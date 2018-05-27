package com.imooc.microweatherbasic.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.imooc.microweatherbasic.service.WeatherDataService;
import com.imooc.microweatherbasic.vo.WeatherResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @author junjun
 * @date 2018/3/23
 **/
@Slf4j
@Service
public class WeatherDataServiceImpl implements WeatherDataService {
    /*http://www.weather.com.cn/data/sk/101281601.html
    http://www.weather.com.cn/data/cityinfo/101281601.html */
    private static final String WEATHER_URI = "http://wthrcdn.etouch.cn/weather_mini?";
    private static final long TIME_OUT = 1800L;

    private RestTemplate restTemplate;
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private WeatherDataServiceImpl(RestTemplate restTemplate, StringRedisTemplate stringRedisTemplate){
        this.restTemplate = restTemplate;
        this.stringRedisTemplate = stringRedisTemplate;
    }

    @Override
    public WeatherResponse getDataById(String cityId) {
        String uri = WEATHER_URI + "citykey=" + cityId;
        return this.getData(uri);
    }

    @Override
    public WeatherResponse getDataByName(String cityName) {
        String uri = WEATHER_URI + "city=" + cityName;
        return this.getData(uri);
    }

    private WeatherResponse getData(String uri){

        String key = uri;
        String strBody = null;
        ObjectMapper mapper = new ObjectMapper();
        WeatherResponse resp = null;

        //缓存中的数据对象
        ValueOperations<String, String> ops = stringRedisTemplate.opsForValue();

        //先查缓存，缓存中有的取缓存中的数据
        if(stringRedisTemplate.hasKey(key)){
            log.info("Redis has data");
            strBody = ops.get(key);
        } else {
            log.info("Redis don't has data");
            //没有缓存，再调用接口来获取   看源码理解
            ResponseEntity<String> respString = restTemplate.getForEntity(uri, String.class);

            if(respString.getStatusCodeValue() == 200){
                strBody = respString.getBody();
            }

            //数据写入缓存
            ops.set(key, strBody, TIME_OUT, TimeUnit.SECONDS);
        }

        try {
            resp = mapper.readValue(strBody, WeatherResponse.class);
        } catch (IOException e) {
            log.error("Error", e);
        }

        return resp;
    }
}
