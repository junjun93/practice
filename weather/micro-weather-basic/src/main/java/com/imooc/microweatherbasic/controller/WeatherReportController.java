package com.imooc.microweatherbasic.controller;

import com.imooc.microweatherbasic.service.CityDataService;
import com.imooc.microweatherbasic.service.WeatherReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.bind.JAXBException;
import java.io.IOException;

/**
 * @author junjun
 * @date 2018/3/30
 **/
@RestController
@RequestMapping("/report")
public class WeatherReportController {

    private CityDataService cityDataService;
    private WeatherReportService weatherReportService;

    @Autowired
    public WeatherReportController(CityDataService cityDataService, WeatherReportService weatherReportService) {
        this.cityDataService = cityDataService;
        this.weatherReportService = weatherReportService;
    }

    @GetMapping("/cityId/{cityId}")
    public ModelAndView getReportByCityId(@PathVariable("cityId") String cityId, Model model) throws IOException, JAXBException {
        model.addAttribute("title", "君君的天气预报");
        model.addAttribute("cityId", cityId);
        model.addAttribute("cityList", cityDataService.listCity());
        model.addAttribute("report", weatherReportService.getDataByCityId(cityId));
        return new ModelAndView("weather/report", "reportModel", model);
    }
}
