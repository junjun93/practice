/ /*区别
    ResourceServlet.java isAuth()
    Configuration.java
    text log
    
    Resolver debug Tomcat选2，添加字段自动生成
    
    mybatis-generator使用
    pom.xml-plugin放入架包
    Maven Projects-Plugins-build
 
 第六章
     单词末尾快捷键command+->
     6-2JsonData
     6-3SpringExceptionResolver
     
     request.getHeader判断请求方式->test
     PermissionException
     RuntimeException
     
     param
     SpringExceptionResolver
     BeanValidator
     JsonMapper
     ApplicationContextHelper
     HttpInterceptor
     NotBlank及各种注解

第七章
7-1
    DeptParam   LevelUtil   SysTreeService  DeptLevelDto
    BeanUtils.copyProperties(dept, dto);
    一个集合中所有数据存入另一个集合
7-2
    SysDeptController int
    SyDeptService
    树形结构的各种方法，在有前台页面时一一验证
    
7-3
    findUsages
    Integer int区别
    curl+链接，测试接口
    周末看工具类1h、书1h
    
    sql全部要用包装类
    SysDeptService update方法
    
    function updateDept
    handleDeptSelected
    
    loadUserList
    mybatis Configuration   safeRowBoundEnbled safeRowBoundsEnabled

curl http://localhost:8080/sys/user/save.json\?username\=技术部\&telephone\=1233954
\&mail\=admin@qq.com\&deptId\=100\&status=\1\&remark\=1


第八章，UserParam
    看框架配置文件  Md5Util passwordUtil回写
    notblank notnull 
    BeanValidator.check(param);
    Preconditions.checkNotNull(before, "待更新的用户不存在");
    
    结合业务去建立自己的知识体系，多想多敲
    option+/ 替换
    user update.json测试失败
    页面css、js加载失败->druid
    UserMapper.xml在哪，在shiro文件夹中
    GET http://localhost:8080/bootstrap3.3.5/css/signin.jsp 404
项目启动配置文件报错常见原因：
    模板引擎 Mustache/zTree-》有问题，css、js全部显示不了
    GET http://localhost:8080/js/signin.jsp 404 () 配置文件导致路径错误
    shiro realm注入不要注入service、注入dao
    
public class Config extends WebMvcConfigurerAdapter{
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {  
    registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
   }
}
    intellij idea difference between war war exploded
    
botched
Dude, your paths are botched
issue
I was facing the same issue with a font


