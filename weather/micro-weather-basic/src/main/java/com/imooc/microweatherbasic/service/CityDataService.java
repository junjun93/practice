package com.imooc.microweatherbasic.service;

import com.imooc.microweatherbasic.vo.City;

import javax.xml.bind.JAXBException;
import java.io.IOException;
import java.util.List;

/**
 * @author junjun
 * @date 2018/3/30
 **/
public interface CityDataService {

    /**
     * 获取City列表
     * */
    List<City> listCity() throws IOException, JAXBException;
}
