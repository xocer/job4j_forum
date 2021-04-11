package ru.job4j.forum.service;

import org.springframework.stereotype.Service;
import ru.job4j.forum.model.Post;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class PostService {

    private final List<Post> posts = new ArrayList<>();

    public PostService() {
        Post post = Post.of("test");
        post.setId(1);
        post.setDesc("abcdefg");
        post.setCreated(Calendar.getInstance());
        posts.add(post);
//        posts.add(Post.of("Продаю машину ладу 01."));
    }

    public List<Post> getAll() {
        return posts;
    }

    public Post getById(int id) {
        return posts.stream().filter(post -> post.getId() == id).findFirst().get();
    }

    public void save(Post post) {
        posts.add(post);
    }
}