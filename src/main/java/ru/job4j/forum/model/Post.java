package ru.job4j.forum.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Calendar;

@Getter
@Setter
@EqualsAndHashCode
@Entity
@Table(name = "posts")
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private Calendar created;

    public static Post of(String name) {
        Post post = new Post();
        post.name = name;
        return post;
    }
}