<com.junjun.demo.a href="https://www.zhihu.com/question/26710849">Java中使用了设计模式思想的类有哪些？</com.junjun.demo.a>

Java IO

装饰器模式：
有一些流处理器可以对另一些流处理器起到装饰作用，形成新的、具有改善了的功能的流处理器。

适配器模式：
有一些流处理器是数组适配器对流处理器的适配。

 

Java 集合框架

装饰器模式：
通过阅读源码发现TreeSet和 HashSet 的实现其实是对 TreeMap 和 HashMap 的包装，set 在 map 的基础上删减了一些功能并增加了一些特性。

 

Tomcat
观察者模式：
Tomcat 对组件生命周期的控制和监听可以说都是通过观察者模式实现的。观察者模式 jdk中有类库实现它，但 Tomcat使用了自己的实现。

责任链模式：
Tomcat 的初始化过程和启动过程都是责任链模式实现的。

模板方法模式：
Tomcat 源码中到处充满着模板方法模式，每个组件的实现控制都用到了模板方法模式。

门面(外观)模式：
Tomcat 内部 Request和Response对象通过门面模式转化为servlet中的Request和Response对象。

 

Spring

工厂模式：
Spring 数据库,bean的实现都用到了工厂模式。

模板方法模式：
Spring 源码中预留了很多扩展点，通过继承父类并重写某些方法可以自定义过程。

建造者模式：
Bean 的组装。

代理模式:
在Aop实现中用到了JDK的动态代理；

单例模式:
这个比如在创建bean的时候

 

其他用到的设计模式

策略模式：
Sort 中的 Comparator这个接口。多线程的实现。

原型模式：
Object 类的 clone方法。

迭代器模式：
Java 集合框架中的各种迭代器。


在 java中，用到设计模式的地方简直多如牛毛，只要心中有设计模式，那么哪儿都会有设计模式的影子。