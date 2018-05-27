package com.imooc.microweatherbasic.service.impl;

import com.imooc.microweatherbasic.service.WeatherDataService;
import com.imooc.microweatherbasic.service.WeatherReportService;
import com.imooc.microweatherbasic.vo.Weather;
import com.imooc.microweatherbasic.vo.WeatherResponse;
import org.springframework.stereotype.Service;

/**
 * @author junjun
 * @date 2018/3/30
 **/
@Service
public class WeatherReportServiceImpl implements WeatherReportService {

    private WeatherDataService weatherDataService;

    public WeatherReportServiceImpl(WeatherDataService weatherDataService) {
        this.weatherDataService = weatherDataService;
    }

    @Override
    public Weather getDataByCityId(String cityId) {
        WeatherResponse resp = weatherDataService.getDataById(cityId);
        return resp.getData();
    }
}
