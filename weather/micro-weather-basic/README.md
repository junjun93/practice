1.Field injection is not recommended.
    
    private WeatherDataService weatherDataService;
    
    @Autowired
    WeatherController(WeatherDataService weatherDataService){
        this.weatherDataService = weatherDataService;
    }
    
2.No beans of 'RestTemplate' type found.

    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }


3.The dependencies of some of the beans in the application context form a cycle.
  Missing URI template variable 'cityName' for method parameter of type String.
    RestTemplate injection error
instead of generating it with Spring Data
总结：@GetMapping("cityName/{{cityName}}") → @GetMapping("cityName/{cityName}")

4.tomcat LifecycleException
 
5.RestConfiguration.java使用或覆盖过时的 API。
注: 有关详细信息, 请使用 -Xlint:deprecation 重新编译。
 	看导包import

6.接口请求正确，却没返回值
    Weather类中，forecastList → forecast;

5.@Autowired
  	private RestTemplate restTemplate;
  	
  	@Value("${test.path}")
  	private String path;
  	@RequestMapping("/test")
  	@ResponseBody
  	public String test(){
  		return this.restTemplate.getForObject(path, String.class);
  	}

6.如何重新编译gradle

7.Lombok Requires Annotation Processing
    Annotation processing seems to be disabled for the project "hello-world". 
    For the plugin to function correctly, please enable it under "Settings > Build > Compiler > Annotation Processors"

8.translate
    (1)Reports any variables declared as java.lang.StringBuffer which may be more efficiently declared as java.lang.StringBuilder. 
        java.lang.StringBuilder is a non-thread-safe replacement for java.lang.StringBuffer, available in Java 5 and newer.
        This inspection only reports if the project or module is configured to use a language level of 5.0 or higher.
    (2)Variable 'line' initializer '""' is redundant less... (⌘F1) 
       This inspection points out the cases where a variable value is never used after its assignment, i.e.:  
       - the variable never gets read after assignment OR  - the value is always overwritten with another assignment before the
       next variable read OR  - the variable initializer is redundant (for one of the above two reasons)
       
cd micro-weather-basic
gradle bootRun


微服务拆分：
    1.天气数据采集 ---》调用第三方天气接口
    2.天气数据API ---》实现cityId、cityName接口
    3.天气预报 ---》前端页面
    4.城市数据API ---》解析cityList.xml   

