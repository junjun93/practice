package com.imooc.microweatherbasic.vo;

import javax.xml.bind.annotation.*;
import java.util.List;

/**
 * @author junjun
 * @date 2018/3/30
 **/
@XmlRootElement(name = "c")
@XmlAccessorType(XmlAccessType.FIELD)
public class CityList {
    @XmlElement(name = "d")
    private List<City> cityList;

    public List<City> getCityList() {
        return cityList;
    }

    public void setCityList(List<City> cityList) {
        this.cityList = cityList;
    }
}
