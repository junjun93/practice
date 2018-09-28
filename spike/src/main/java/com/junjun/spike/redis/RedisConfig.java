package com.junjun.spike.redis;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author junjun
 * @date 2018/9/27 15:57:53
 **/
@Component
@ConfigurationProperties(prefix = "redis")
@Getter
@Setter
public class RedisConfig {

    private String host;
    private int port;
    private int timeout;
    private String password;
    private int poolMaxTotal;
    private int poolMaxIdle;
    private int poolMaxWait;
}
