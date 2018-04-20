package com.springboot.bank;

import com.springboot.bank.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApplicationTests {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserService userService;


    @Test
    public void getpassword() {
        System.out.println(passwordEncoder.encode("james"));
    }


    @Test
    public void test() {
        String ss = "asdfsadf  asdf  ";
        String s = new String("asdfsaddasdf  asdf  ");
        Boolean b = Boolean.FALSE;
    }

    @Test
    public void addUserAu() {
        userService.addUserAuthority(6,new Integer[]{3});
    }
}
