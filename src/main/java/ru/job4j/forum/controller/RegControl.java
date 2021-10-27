package ru.job4j.forum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.job4j.forum.model.User;
import ru.job4j.forum.service.UserService;

@Controller
public class RegControl {
    private final UserService service;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public RegControl(UserService service) {
        this.service = service;
    }

    @GetMapping("/reg")
    public String regPage() {
        return "reg";
    }

    @PostMapping("/reg")
    public String reg(@ModelAttribute User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        service.save(user);
        return "login";
    }
}
