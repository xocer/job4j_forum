insert into authorities (authority)
values ('ROLE_USER');
insert into authorities (authority)
values ('ROLE_ADMIN');

insert into users (username, password, enabled, authority_id)
values ('test', '$2a$10$XMt2m4/AAhSNolNL4uxE2eYJQPHkiYifAvpSkiq3hK4K/.RR6V3UK', true,
        (select id from authorities where authority = 'ROLE_ADMIN'));

insert into posts (name, user_id) values ('О чем этот форум?', 1);
insert into posts (name, user_id) values ('Правила форума.', 1);