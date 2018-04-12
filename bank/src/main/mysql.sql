
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



