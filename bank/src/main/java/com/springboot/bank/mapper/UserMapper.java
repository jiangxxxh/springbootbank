package com.springboot.bank.mapper;

import com.springboot.bank.domain.User;
import com.springboot.bank.util.RedisCache;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 *
 */
@CacheNamespace(implementation = RedisCache.class)
public interface UserMapper {

    User findByUsername(@Param("username")String username);

    @Update("update user set password=#{password},last_password_reset_date=now() where id=#{id}")
    int changePassword(@Param("id")Integer id,
                       @Param("password")String password);

    @Select("select id,username,email,enabled,last_password_reset_date,login_time from user")
    @Results({
            @Result(property = "lastPasswordResetDate",column = "last_password_reset_date"),
            @Result(property = "loginDate",column = "login_time"),
    })
    List<User> find();

    @Select("select id,username,email,enabled,last_password_reset_date,login_time loginDate from user where id=#{id}")
    User findById(Integer id);

    @Insert("insert into user (username,password,email,enabled,last_password_reset_date,login_time) values (#{username},#{password},#{email},#{enabled},#{lastPasswordResetDate},#{loginDate})")
    int addUser(User user);

    @Update("update user email=#{email},enabled=#{enabled} where id=#{id}")
    int modify(User user);

    // @Insert("insert into user_authority(user_id,authority_id) values (#{userId},#{authorityId})")
    int addUserAuthority(
            @Param("userId")Integer userId,
            @Param("authorityIds")Integer[] authorityIds
    );

    /**
     * 删除指定用户的角色
     * @param userId
     * @return
     */
    @Delete("delete from user_authority where user_id=#{userId}")
    int removeUserAuthority(@Param("userId")Integer userId);

    /**
     *  查询指定用户的角色
     * @param userId
     * @return
     */
    @Select("select authority_id from user_authority where user_id=#{userId}")
    List<Integer> findUserAuthority(@Param("userId")Integer userId);

}
