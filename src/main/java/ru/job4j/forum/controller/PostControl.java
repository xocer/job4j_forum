package ru.job4j.forum.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.job4j.forum.model.Post;
import ru.job4j.forum.model.User;
import ru.job4j.forum.service.PostService;
import ru.job4j.forum.service.UserService;

@Controller
public class PostControl {
    private final PostService posts;
    private final UserService users;

    public PostControl(PostService posts, UserService users) {
        this.posts = posts;
        this.users = users;
    }

    @GetMapping("/create")
    public String create(Model model) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        final User user = users.getUserByName(username);
        model.addAttribute("user", user);
        return "edit";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("id") long id, Model model) {
        model.addAttribute("post", posts.getById(id));
        model.addAttribute("user",
                users.getUserByName(SecurityContextHolder.getContext().getAuthentication().getName()));
        return "edit";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Post post) {
        posts.save(post);
        return "redirect:/";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") long id) {
        posts.delete(id);
        return "redirect:/";
    }
}
