package com.imooc.microweatherbasic.config;

import com.imooc.microweatherbasic.job.WeatherDataSynoJob;
import org.quartz.*;
import org.springframework.context.annotation.Bean;

/**
 * @author junjun
 * @date 2018/3/30
 **/
public class QuartzConfiguration {

    private static final int TIME = 1800;

    @Bean
    public JobDetail weatherDataSyncJobDetail(){
        return JobBuilder.newJob(WeatherDataSynoJob.class).withIdentity("weatherDataSyncJob")
                .storeDurably().build();
    }

    @Bean
    public Trigger weatherDataSyncTrigger(){

        SimpleScheduleBuilder scheduleBuilder = SimpleScheduleBuilder.simpleSchedule()
                .withIntervalInSeconds(TIME).repeatForever();

        return TriggerBuilder.newTrigger().forJob(weatherDataSyncJobDetail())
                .withIdentity("weatherDataSyncTrigger").withSchedule(scheduleBuilder).build();
    }
}
