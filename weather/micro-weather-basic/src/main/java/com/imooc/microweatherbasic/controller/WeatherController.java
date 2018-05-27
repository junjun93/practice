package com.imooc.microweatherbasic.controller;

import com.imooc.microweatherbasic.service.WeatherDataService;
import com.imooc.microweatherbasic.vo.WeatherResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author junjun
 * @date 2018/3/23
 **/
@RestController
@RequestMapping("/weather")
public class WeatherController {

    private WeatherDataService weatherDataService;

    @Autowired
    WeatherController(WeatherDataService weatherDataService){
        this.weatherDataService = weatherDataService;
    }

    @GetMapping("/cityId/{cityId}")
    public WeatherResponse getWeatherByCityId(@PathVariable("cityId") String cityId){
        return weatherDataService.getDataById(cityId);
    }

    @GetMapping("cityName/{cityName}")
    public WeatherResponse getWeatherByCityName(@PathVariable("cityName") String cityName){
        return weatherDataService.getDataByName(cityName);
    }
}
