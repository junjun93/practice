package com.imooc.microweatherbasic.service.impl;

import com.imooc.microweatherbasic.service.CityDataService;
import com.imooc.microweatherbasic.util.XmlBuilder;
import com.imooc.microweatherbasic.vo.City;
import com.imooc.microweatherbasic.vo.CityList;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import javax.xml.bind.JAXBException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

/**
 * @author junjun
 * @date 2018/3/30
 **/
@Service
public class CityDataServiceImpl implements CityDataService {

    @Override
    public List<City> listCity() throws IOException, JAXBException {

        // 读取xml文件
        Resource resource = new ClassPathResource("cityList.xml");
        BufferedReader br = new BufferedReader(new InputStreamReader(resource.getInputStream(), "utf-8"));
        StringBuilder builder = new StringBuilder();
        String line = "";

        while((line = br.readLine()) != null){
            builder.append(line);
        }

        br.close();
        // xml转为Java对象
        CityList cityList = (CityList)XmlBuilder.xmlStrToObject(CityList.class, builder.toString());
        return cityList.getCityList();
    }
}
