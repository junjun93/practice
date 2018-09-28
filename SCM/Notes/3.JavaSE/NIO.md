NIO non-blocking IO
1.File类：java.io
    file可以通过构造方法，将磁盘上的文件构建成Java程序运行时所能识别的对象，
    再通过文件对象的方法对文件或目录的属性进行操作

    对象名     输出相对路径,重写了toString方法
    exists()    文件是否存在
    isFile()
    isDirectory() 是目录

    getName()
    length()
    getPath()
    getAbsolutePath()

    createNewFile()
    delete()

2.字节处理流(首行)
    FileInputStream
        读取字节文件

    FileOutputStream
        输出字节文件
        当磁盘上的文件不存在时，自动创建并写入内容

3.基本数据类型处理流
    DataOutputStream    DataInputStream

4.字符处理流
        转换流-->字符处理流-->字符缓冲流
    InputStreamReader   OutputStreamWriter
    Reader              Writer
    BufferedReader      BufferedWriter

5.对象处理流
    ObjectOutStream     ObjectInputStream
	注意事项：
        1、写对象到文件中叫作序列化，所有需要User实现Serializable接口（也就是让User对象具备可以序列化的能力）
        2、实现Serializable接口的类设置序列化的编号，给类一个标记
        3、序列化只能对堆中的进行序列化，不能对方法区中的进行序列化
        4、不需要序列化的

6.标准输入、输出流
    System.in：从键盘录入到程序里

    System.out：输出到显示器
      		printStream 字节
            printWriter 字符

    URL：统一资源定位符