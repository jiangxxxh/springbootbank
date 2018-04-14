package com.springboot.bank.security.domain;

import java.io.Serializable;

/**
 * 已授权客户(令牌)响应给客户端
 *
 * @author JiangXh
 */
public class JwtAuthenticationResponse implements Serializable {
    private static final long serialVersionUID = -8211037663495232130L;

    private final String token;

    public JwtAuthenticationResponse(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }
}
