package com.junjun.spike.redis;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * @author junjun
 * @date 2018/9/26 15:48:39
 **/
@Service
public class RedisService {

    @Autowired
    JedisPool jedisPool;

    /**
     * 获取当个对象
     * */
    public <T> T get(KeyPrefix prefix, String key, Class<T> clazz){

        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            String realKey = prefix.getPrefix() + key;
            String str = jedis.get(realKey);
            T t = stringToBean(str, clazz);
            return t;
        } finally {
            returnToPool(jedis);
        }
    }

    public <T> boolean set(KeyPrefix prefix, String key, T value){

        return false;
    }

    public static <T> T stringToBean(String str, Class<T> clazz){

        if(str == null || str.length() <= 0 || clazz == null){
            return null;
        }
        if(clazz == int.class || clazz == Integer.class){
            return (T)Integer.valueOf(str);
        } else if(clazz == String.class){
            return (T)str;
        } else if(clazz == long.class || clazz == Long.class){
            return (T)Long.valueOf(str);
        } else {
            return JSON.toJavaObject(JSON.parseObject(str), clazz);
        }
    }

    private void returnToPool(Jedis jedis){
        if(jedis != null){
            jedis.close();
        }
    }
}
