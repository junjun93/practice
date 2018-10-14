一.工具的使用
1.Tomcat集群
（1）编辑/etc/profile文件
    export CATALINA_BASE=/Users/junjun/Applications/Tomcat1;
    export CATALINA_HOME=/Users/junjun/Applications/Tomcat1;
    export TOMCAT_HOME=/Users/junjun/Applications/Tomcat1;
    export CATALINA_2_BASE=/Users/junjun/Applications/Tomcat2;
    export CATALINA_2_HOME=/Users/junjun/Applications/Tomcat2;
    export TOMCAT_2_HOME=/Users/junjun/Applications/Tomcat2;
    
（2）编辑bin/catalina.sh文件，添加两个export

（3）编辑conf/server.xml文件，改三个端口

2.Mac下IntelliJ IDEA使用Tomcat报error=13, permission denied
    cd /Users/junjun/Applications/Tomcat1/bin
    chmod a+x catalina.sh

3.安装、启动redis
    wget http://download.redis.io/releases/redis-2.8.0.tar.gz
    cd /usr/local/Cellar/redis-2.8.0
    make
    make test
    cd src          cd /usr/local/Cellar/redis-2.8.0/src
    ./redis-server  ./redis-cli  redis设置开机自启动
    brew list redis-2.8.0
    
4.重置密码(在redis-cli界面)
    config set requirepass 123456
    config get requirepass
    auth 123456
    
二.基础知识
1.Redis基础命令
   (1) info --> database(keyspace)      select 1
   (2) dbsize    save   quit
   (3) flushdb  flushall-->清空
   
2.Redis键命令
    (1) set a a     del xxx     exists a
    (2) ttl a(time to live)     -1-->永久
    (3) expire a 10             -2-->挂了
    (4) type b      hset hash2 name tom
    (5) randomkey
    (6) rename a d      renamenx a d(所有nx结尾的都需要判断是否存在键值对)
  
3.Redis数据结构-string
    (1) setex c 100 c   psetex d 10000 d(ms expire)
    (2) getrange word 0 2   [0,2]
        getset a aa (更新值并返回更新前的旧职)
    (3) mset a1 1 a2 2 a3 3     mget a1 a2 a3
    (4) setnx a a            msetnx a1 1 a2 2 a3 3
    (5) strlen word
    (6) set 1 1     get 1   
        incr 1  incrby 1 100
    (7) decr 1  decrby 1 100   
    (8) append 1 app
    
4.Redis数据结构-hash
    (1) hset map1 name jim      hget map1 name  rename  type  exists
    (2) hgetall map1 name age
    (3) hdel map1 name
    (4) hsetnx map1 name

5.Redis数据结构-list
    (1) lpush list1 1 2 3       llen list1 
    (2) lset  list1 0 100       lrange 0 2
    (3) lindex list 5
    (4) lpop list1(首)       rpop list1(末)

6.Redis数据结构-set
    (1) sadd set2 a b c d       scard set2
    (2) smembers set2
    (3) sdiff  set1 set2(差集2)
        sinter set1 set2(交集)
        sunion set1 set2(并集)
    (4) srandmeter set1 2
    (5) sismember  set1 2
    (6) srem set1 a b
    (7) spop set2(移除并返回随机元素)

7.Redis数据结构-sortedset
    (1) zadd sort1 a 100 b 200 c 300 
    (2) zcard sort1      
    (3) zscore sort1 d
    (4) zcount sort1 0 220      [0,220] 
    (5) zramk sort1 a(序号)
    (6) zincrby sort1 1000 
    (7) zrange 0 100 withscores
 
 
三.单点登录  
    bak文件，nginx是不会加载进来的；；e.getMessage只有一行错误信息，因此不用它
    1.CookieUtil.java 
        StringUtils有空判断，不会报空指针异常
        writeLoginToken()中，httpOnly防止js脚本攻击，要设置domain、path、httpOnly、maxAge等属性
    2.UserController.java改造的代码要回看
        login、logout-》CookieUtil
        源码中sessionId、浏览器中Network、Application；
        Redis中session有效期需要重置-》SessionExpireFilter
    3.updateInformation、resetInformation、富文本上传
    4.GuavaCacheg改造
        forgetCheckAnswer<=>CheckAnswer
        
四.Redis分布式
    集群：物理形态，Tomcat
    分布式：工作方式，Redis
    代码验证：nginx+2个Tomcat+2个Redis
 
五.springSession
    前面的单点登录对业务有入侵、ping域名
    Redis   aa:bb:cc
    修改web.xml文件，看Spring官方文档、github sample
    Command+T JedisConnectionFactory 哨兵
    RedisSessionConfiguration
    monitor看Redis日志
 回看各种工具类
 
  
1.Decompiler反编译
2.环境隔离打包、发布测试
3.JsonUtil为什么字符串不能直接null判断，sudo rm -rf /*
4.Linux显示 Git 当前所在分支












一.
	mysql权限设置

