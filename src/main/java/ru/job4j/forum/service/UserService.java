package ru.job4j.forum.service;

import org.springframework.stereotype.Service;
import ru.job4j.forum.model.User;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
    private final List<User> users = new ArrayList<>();

    public UserService() {
        users.add(User.of("user", "email@mail.ru", "1"));
    }

    public void save(User user) {
        users.add(user);
    }

    public User findUserByName(String name) {
        return users.stream().filter(user -> user.getName().equals(name)).findFirst().get();
    }
}
