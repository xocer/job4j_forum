package ru.job4j.forum.service;

import org.springframework.stereotype.Service;
import ru.job4j.forum.model.Post;
import ru.job4j.forum.store.PostRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class PostService {

    private final PostRepository posts;

    public PostService(PostRepository posts) {
        this.posts = posts;
    }

    public List<Post> getAll() {
        List<Post> rsl = new ArrayList<>();
        posts.findAll().forEach(rsl::add);
        return rsl;    }

    public Post getById(long id) {
        return posts.findById(id).orElse(new Post());
    }

    public void save(Post post) {
        posts.save(post);
    }

    public void delete(long id) {
        posts.deleteById(id);
    }
}