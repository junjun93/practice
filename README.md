# practice
Java项目使用纯json配置文件，一会儿用xml、一会儿用properties，太不优雅了
周三晚上，debug理解框架
tree.json->dto继承、复制父类属性
           遍历一个集合、将一个集合的数值放入另一个集合
           权限模块转换，不太理解，回看transformAclModuleTree()
 http://localhost:8080/sys/dept/tree.json
 http://localhost:8080/sys/aclModule/tree.json
           
Navicat Premium快捷键：右移光标、左移光标、上下行移动、添加字段
权限系统
    部门模块SysDept LevelUtil SysTreeService
    用户模块SysUser User Admin
    权限模块
        校验传入的参数、校验菜单是否重名
        SysAclModuleService 补代码
    权限点模块
        SysAclService 返回光标的上一位置  roleTree()、SysCoreService回看
    角色模块
        SysRoleService
    角色权限关系
    角色用户关系

项目难点：
    tree.json的递归算法
1    
        ThreadLocal是每线程独有的，互不影响 Map->key一个进程  
        找到高并发这个知识点的位置
        理解HttpInterceptor-》监控所有请求
        DruidWebStatFilter如何进入
        LoginFilter相对路径、绝对路径；RequestHolder简略数据传输
        ip正则表达式理解
            map是在线程中的 不是在threadlocal中的
            threadlocal内部并不存在 map
            并且key也不是 线程名称 而是 threadlocal自己
本类中的方法直接调用，不区分是否静态方法
多看编译后的代码
map.getEntry
int i = key.threadLocalHashCode & (table.length - 1);

一.慕课网的实战项目
1.Weather 微服务   <a href="https://coding.imooc.com/learn/list/177.html">从天气项目入门 Spring Cloud 微服务治理</a>

2.permission <a href="https://coding.imooc.com/lesson/149.html#">Java开发企业级权限管理系统</a>

输入命令：sudo vim ~/.bash_profile 能.bash_profile文件不存在  
GRADLE_HOME= /usr/local/Cellar/gradle-4.5 export 
GRADLE_HOME export PATH=$PATH:$GRADLE_HOME/bin
not a valid identifier

 路径自己选择  输入完成后，保存退出  
输入命令：source ~/.bash_profile 
 更新修改后，验证是否成功安装  
输入命令：gradle -v

<property/>快捷键

二.数字类型
    整数: tinyint、smallint、mediumint、int、bigint
    浮点数: float、double、real、decimal
    日期和时间: date、time、datetime、timestamp、year
    字符串类型
    字符串: char、varchar(255+)
    文本: tinytext、text、mediumtext、longtext
    二进制(可用来存储图片、音乐等): tinyblob、blob、mediumblob、longblob
    
三.配置文件目录
webapp下
    web.xml 
    spring-servlet.xml
resources下
    applicationContext.xml
    mybatisConfig.xml
    datasource.properties
    generatorConfig.xml
    logback.xml

四.常见错误
1.源发行版 1.8 需要目标发行版 1.8
    
    
2.failed to load resource: the server responded with a status of 404 () 
  GET http://localhost:8080/js/signin.jsp 404 ()

3.别忘了 @IsMobile @Target({TYPE_USE })（看视频）

Spring AOP看完，开始上班看书+写笔记，下班写项目，周末一天全天写代码

 
各种bug总结：
    1.IEDA解决源码1.5已过时
       (1)修改Maven的Settings.xml文件添加如下内容
       (2)在项目的pom.xml文件中添加：build-plugin 1.8
       (3)打开项目配置，设置Modules的Language Level为”8” (file ~~Project Structure ~~Modules ~~Sources )：
       (4)搜索Java Compiler 
    
    mac启动springboot项目太慢
        (1)就是把本机的hostname 添加到 hosts 中，例如: 127.0.0.1 localhost myMac
        (2)执行  scutil --set HostName "localhost"

    3.@WebServlet不能直接被前端访问，@Controller却可以

    4.容器先关闭再启动，缓存没了；直接重启，缓存还在里面

    5.upload.html没有文件直接提交会报错500

    6.@WebServlet("mail.do")  少/，直接启动报错
    
    7.Caused by: redis.clients.jedis.exceptions.JedisDataException: ERR Client sent AUTH, but no password is set
     redis-cli实际密码与项目配置文件密码不一样

network 分布式集群时用户的Session如何处理：Session同步（性能问题）、分布式Session

miaosha_order、order_info区别


秒杀课程
    补充-》未理解知识点汇总   mac whereis命令用不了
    ①登录问题，登录后用户信息放session；用户信息，放到浏览器cookies里了、再次登录先访问cookies再访问数据库
    ②分布式session回看3-6，要上Redis
    ③商品详情回看4-2
    SpringMvc中的HandlerAdapter会对Controller层方法的参数执行 HandlerMethodArgumentResolver
    (对参数的解析器)中的方法;
    自定义注解 @isMobile、用户信息封装
    id自增方式选择：自增、UUID、snowflake(4-2 02:11)
    
    
    2-5 UserService2.5前   12min  redis SampleController
    2-6 Prefix KeyPrefix BasePrefix
    3-5.CodeMsg、GlobalExceptionHandler
    3-6.  11:58 GoodsController、LoginController("/do_login")
3-7 延长有效期，最后登录时间+30min      51行、67行、75、83、123  
    WebConfig、UserArgumentResolver 05:06方法参数上user注入进来；框架回调addArgumentResolvers注入值
    07:26注释 13:06  goods_list.html报错原因:RedisService的set方法没有写（源码回看）
    GlobalExceptionHandler，理解其实现原理
    原生session同步，性能差、实现复杂    
    do_login将token写入浏览器cookie中，服务器取cookie中token信息；to_list请求获取到token
    手机端token放到参数中传递
    UUIDUtil redisService不全 miaoshatoken
    分布式session，token不存到服务器里、存到缓存里
        goods_detail、order_detail有问题
        WebMvcConfigurerAdapter过时，替代的类是什么
1   
  
    
    4-1 GoodsService  
    4-2 id自增 snowflake自增算法  变量域用value来表示
    4-4 MiaoShaController OrderService 生成不存在的秒杀方法快捷键
        数据bug:miaosha_user没有salt字段，导致登录失败   config的两个类
    4-5 OrderController
    5-1 结合 195 高并发2-3  JMeter redis-benchmark
    5-2 UserController 必须ajax  UserArgumentResolver重看，不浪费时间token cookies miaoshauserservice 
        goodsController 缓存+数据库 08：03

        
    害怕：阿里云服务器，mysql命令行      
    学习建议：写项目、手写基础算法     
    未来需求：编辑器、收藏夹、百度网盘破解限速插件、Java爬虫、Python爬虫
    业务：银行、保险、证券类业务不做，优先教育、医疗类业务
    
    下岗待就业、铁饭碗、公费医疗、退休金、价格双轨制 
    胡耀邦  76年天安门事件 周总理 平反 426社论 爱国无罪
    对抗型政治  赵：法制不健全、政府透明度不够 绝食宣言、自焚    血性
    5.14下午对话（学生打断）    5.15戈尔巴乔夫访华
    道德自觉性、灵魂契约
    5.16严明复广场对话、赵紫阳讲话
    5.18李鹏人民大会堂对话学生代表
    5.19凌晨赵紫阳神情憔悴的出现在广场 改革派、顽固派 静坐
    5.19晚，解放军入城
      
    鲁殇王
    
华夏：62.90
广发：0.05
交通：0
信用卡：华夏12000+招商10000+广发8000+交通7000 = 37000元
网商贷：30000元/6798.36元(11号)
花呗：3715.38元/1454.75元(9号)（2000元以内；不点外卖，晚上做第二天加热吃）
招联好期贷：23923元/1400元(9号)
微粒贷：8770元/635.96元(1号)
百度钱包：4600元
分期乐：3000元
京东：40.4元  家族的形式 第2集00:45为人父母与成长的讨论 3集00:33 00:41
回家3天：20元14G、过年回家8天：60元  
经过车次有（Z201/2 北京西~三亚）（Z111/2/3/4 哈尔滨~海口）（K407/8 长沙~海口）（K457/8 郑州~海口）（K407/8 长沙~海口）（ K457/8 郑州~海口） ( K511/2 上海南~海口） (K1167/68/69/70 西安~海口）
                        
灵山石树、大龙山、迎江寺、振风塔、孔雀东南飞景区、五千年文博园
安庆海洋世界、秋浦河、浮山、大孤山、小孤山、明堂山、巨石山、天柱山（神秘谷+天池峰+炼丹湖）
安庆古建一日游 http://travel.sina.com.cn/ah_anqing_1526-xiangqing-gonglue/

