第19节 线程
一.如何创建线程
    1.实现Runnable接口，重写该接口的run()方法
    2.继承Thread类，重写该类的run()方法
    3.使用Callable和Future接口创建线程。具体是实现Callable接口，重写call()方法...

     如：Callable<Integer> myCallable = new MyCallable();
        //使用FutureTask来包装MyCallable对象
        FutureTask<Integer> ft = new FutureTask<>(myCallable)

使用内部类的方式新建线程
二.线程的状态
    就绪状态转换为运行状态：当此线程得到处理器资源；
    运行状态转换为就绪状态：当此线程主动调用yield()方法或在运行过程中失去处理器资源；
    运行状态转换为死亡状态：当此线程线程执行体执行完毕或发生了异常

三.阻塞状态与线程的控制
    1.join —— 让线程A等待线程B完成才继续执行
    2.sleep —— 常用来暂停线程执行
        线程B必然性的立即执行，直接调用线程A的sleep(1)即可
    3.后台线程（Daemon Thread）
    （1）定义
        后台线程主要是为其他线程（前台线程）提供服务，也称之为守护线程。如JVM中的垃圾回收线程
    （2）设置
        main线程默认前台线程，用setDaemon(true)方法设置成后台线程
    （3）判断
        isDaemon()
    4.改变线程的优先级 setPriority()
      获取线程优先级 getPriority()
        MAX_PRIORITY:10
        MIN_PRIORITY:1
        NORM_PRIORITY:5
    5.线程让步 yield()

四.取钱例子分析
    1.同步方法
    2.同步代码块
    3.Lock对象同步锁
    4.wait()/notify()/notifyAll()线程通信
    
    