package com.imooc.microweatherbasic.service;

import com.imooc.microweatherbasic.vo.WeatherResponse;

/**
 * @author junjun
 * @date 2018/3/23
 **/
public interface WeatherDataService {

    /**
     * 根据城市编号查询天气数据
     * */
    WeatherResponse getDataById(String cityId);

    /**
     * 根据城市名称查询天气数据
     * */
    WeatherResponse getDataByName(String cityName);
}
