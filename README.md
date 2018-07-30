# practice
Navicat Premium快捷键：右移光标、左移光标、上下行移动、添加字段
权限系统
    部门模块SysDept LevelUtil SysTreeService
    用户模块SysUser User Admin
    权限模块
        校验传入的参数、校验菜单是否重名
        SysAclService补代码
    权限点模块
    角色模块
    角色权限关系
    角色用户关系
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

学习建议：多看class文件、手写基础算法、写小项目、看基础类库源码
找工作项目：慕课网项目+淘宝项目，结合起来写成自己的业务。看能不能整个开源项目，尽早自己实现一个全栈项目
未来需求：编辑器、收藏夹、百度网盘破解限速插件、Java爬虫、Python爬虫


