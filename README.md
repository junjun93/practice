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
    perferences -> Build,Execution, Deployment -> Compiler -> Java Compiler 
    设置相应Module的 bytecode version即可 
    
2.failed to load resource: the server responded with a status of 404 () 
  GET http://localhost:8080/js/signin.jsp 404 ()

3.别忘了@ IsMobile@Target({TYPE_USE })（看视频）

Spring AOP看完，开始上班看书+写笔记，下班写项目，周末一天全天写代码

network 分布式集群时用户的Session如何处理：Session同步（性能问题）、分布式Session

2-5 UserService2.5前   12min  redis SampleController
2-6 Prefix KeyPrefix BasePrefix
3-5.CodeMsg、GlobalExceptionHandler
3-6.  11:58 GoodsController、LoginController("/do_login")
3-7 UserArgumentResolver、WebConfig 
    分布式session收尾，setResponse可以先不管
    WebMvcConfigurerAdapter过时，替代的类是什么
    
4-1 GoodsService  snowflake自增算法  变量域用value来表示
4-4 MiaoShaController OrderService 生成不存在的秒杀方法快捷键
数据bug:miaosha_user没有salt字段，导致登录失败   config的两个类

害怕：阿里云服务器，mysql命令行      
学习建议：写项目、手写基础算法     
未来需求：编辑器、收藏夹、百度网盘破解限速插件、Java爬虫、Python爬虫
业务：银行、保险、证券类业务不做，优先教育、医疗类业务


