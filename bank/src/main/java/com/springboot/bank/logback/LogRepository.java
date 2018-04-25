package com.springboot.bank.logback;

import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * Mongo 资源管理器（Mongo JPA）（把MyLog实体类保存到 MongoDB；还可以进行 CRUD 操作）
 * @author SONG
 */
public interface LogRepository extends MongoRepository<MyLog, String> {
}
