package com.imooc.microweatherbasic.service;

import com.imooc.microweatherbasic.vo.Weather;

/**
 * @author junjun
 * @date 2018/3/30
 **/
public interface WeatherReportService {
    /**
     * 根据城市编号查询天气信息
     * */
    Weather getDataByCityId(String cityId);
}
