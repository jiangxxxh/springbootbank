
-- bank script of bank

-- 用户表
CREATE TABLE user
(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    username varchar(100),
    password varchar(100),
    email varchar(100),
    enabled int, -- 1 启动 0 禁用
    last_password_reset_date datetime,
    login_time datetime
);

-- 角色表
CREATE TABLE authority
(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    name varchar(100),
    descn varchar(100)
);

-- 用户- 角色表
CREATE TABLE user_authority
(
    user_id bigint,
    authority_id bigint,
    CONSTRAINT ua_user_fk FOREIGN KEY (user_id) REFERENCES user (id),
    CONSTRAINT ua_authority_fk FOREIGN KEY (authority_id) REFERENCES authority (id)
);

-- 初始化数据
INSERT INTO employee.authority (id, name, descn) VALUES (1, 'ROLE_ADMIN', '系统管理员');
INSERT INTO employee.authority (id, name, descn) VALUES (2, 'ROLE_MANAGER', '经理');
INSERT INTO employee.authority (id, name, descn) VALUES (3, 'ROLE_CLERK', '办事员');

INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (1, 'admin', '$2a$10$xQe0QpB.RbrIJYrLmAfJ8ui28r.FwT5oUdMnuiw3sRPBQaxobyILi', 'admin@gmail.com', 1, '2018-04-10 07:06:39', '2018-04-12 07:07:01');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (2, 'king', '$2a$10$yrCWOQ6ZkyXALIFkKtfomev8z3c8vEdsNE4eOnjFLLPHUnsmb6UAW', 'king@gmail.com', 1, '2018-04-09 09:07:49', '2018-04-11 12:24:02');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (3, 'smith', '$2a$10$4d9.BVyKFsf9AETlVjsWkOxr35dbQ.ojBO/0xsn1DO9/TtpncUia.', 'smith@gmail.com', 0, '2018-04-04 15:34:35', '2018-04-10 14:12:49');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (4, 'jones', '$2a$10$47nxZcaMHV9jlYHwtwJnDeany0oXjWPRI185xApNciJ86gUNGyK9C', 'jones@gmail.com', 1, '2018-04-08 16:46:25', '2018-04-12 11:56:52');
INSERT INTO employee.user (id, username, password, email, enabled, last_password_reset_date, login_time) VALUES (5, 'james', '$2a$10$83HQlAz82H9fmaZh/VqT2O.gidb.sdzMh0zyRnFtCb0.410yOuoZq', 'james@gmail.com', 1, '2018-04-12 15:10:46', '2018-04-12 16:25:57');

INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 2);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (1, 3);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (2, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (3, 1);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (4, 2);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (4, 3);
INSERT INTO employee.user_authority (user_id, authority_id) VALUES (5, 3);



