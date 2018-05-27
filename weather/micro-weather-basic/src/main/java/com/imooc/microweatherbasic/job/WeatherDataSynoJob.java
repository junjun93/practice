package com.imooc.microweatherbasic.job;

import com.imooc.microweatherbasic.service.WeatherDataService;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * @author junjun
 * @date 2018/3/30
 **/
@Slf4j
public class WeatherDataSynoJob extends QuartzJobBean {

    private WeatherDataService weatherDataService;

    @Autowired
    public WeatherDataSynoJob(WeatherDataService weatherDataService) {
        this.weatherDataService = weatherDataService;
    }

    /** (non-Javadoc)
     * @see org.springframework.scheduling.quartz.QuartzJobBean#executeInternal(org.quartz.JobExecutionContext)
     */

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        log.info("Weather Data Sync Job. Start!");

        log.info("Weather Data Sync Job. End!");
    }

}
