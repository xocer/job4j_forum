package ru.job4j.forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.job4j.forum.model.Post;
import ru.job4j.forum.service.PostService;

@Controller
public class PostControl {
    private final PostService posts;

    public PostControl(PostService posts) {
        this.posts = posts;
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("id") int id, Model model) {
        model.addAttribute("post", posts.getById(id));
        return "edit";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute Post post) {
        posts.save(post);
        return "index";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Post post) {
        posts.save(post);
        return "index";
    }

    @GetMapping("/post")
    public String openPost(@RequestParam("id") int id, Model model) {
        Post post = posts.getById(id);
        model.addAttribute("post", post);
        return "post";
    }
}
