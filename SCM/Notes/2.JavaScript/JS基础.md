var com.junjun.demo.a = prompt\("请输入用户名："\)
### 一.JavaScript认识
        
    1、JS代码写在哪里？ 
        引用js文件 script标签内 标签属性内
    2、JS里的系统弹窗代码 
        alert()、prompt()、confirm()
    3、获取元素以及修改内容
        getElementById、getElementsByClassName、getElementsByTagName、getElementsByName、querySelector、querySelectorAll
        innerHTML、innerText、write()方法
    4、操作标签属性 
        getAttribute/setAttribute/removeAttribute 
    5、操作css样式
        .style.cssText  .style.width(行内样式)     属性操作注意事项
    6、JS里的事件 
        事件、方法/函数、this的简单认识
    7、+ 的初步认识 
        数字相加、字符拼接、各种缩写
    8、[]的初步认识 
        下标、代替.     如：com.junjun.demo.a.b <=> com.junjun.demo.a['b']
    
**tips**:自定义属性和自定义标签属性区别

     // title   dachui
     <div id="box" title='小阳' dachui='大锤'></div>
     // 未定义，为什么未定义呢？就是因为他不是合法的字符，不能打点调用
     console.log(oBox.dachui);	
     // 获取自定义的属性 
     console.log(oBox.getAttribute("dachui"));	

### 二.数据类型
	数据类型 变量=字面值
	<弱类型>
 1.变量：具有唯一代表性<br/>
**&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以字母，_，$，开头，其他随便（除了关键字）<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;变量存在内存window对象中<br/>**
2.数据类型
    
```
    number	string boolean  undefined
    object（array、null、regex、date、dom）
	function
```
存储内存中 	 	
### 三.数学运算符

#### 2.1数学运算符
只有纯数字字符串、布尔值、null能够帮你进行隐式转换

##### 2.1.1 string → number	（显示类型转换）
1. parseInt()<br>
parseInt就是将一个string转为一个整数，不四舍五入，直接截取整数部分。如果这个string有乱七八糟的东西，那么就截取前面数字部分。如果两个数字之间有字符串，那么只截取第一个数字。

```
var com.junjun.demo.a = "123.12px123";
var b = parseInt(com.junjun.demo.a);
console.log(typeof b); //number
console.log(b); //123
```

1.	parseFloat()<br>
会截取小数点

```
var com.junjun.demo.a = "123.12px123";
var b = parseFloat(com.junjun.demo.a);
console.log(typeof b); //number
console.log(b); //123.12
```

##### 2.1.2 number → string<br>
将一个数字，与一个空字符串进行连字符运算，那么就是自动转为字符串了,不仅是数字适用，其他类型要转换成字符串也适用

```
var com.junjun.demo.a = 123;
var b = com.junjun.demo.a + "";
console.log(b);	//123
console.log(typeof b);  //string
```
##### 2.1.3	toString()


将其他类型转换为string类型	

```
var str4 = 100;
console.log(typeof str4.toString());  //string
```


##### 2.1.4 隐式转换
就是没有写parseInt()、parseFloat()自己帮你转格式

```
console.log(3 * "8");	//24
console.log("3" * "8");	//24
console.log("48" / "2"); //24
console.log("24" % 55);	//24
```


(1)隐式转换的时候null、boolean将被转为0
```
console.log(3 * null);	 //0
console.log(3 * false);  //0
console.log(3 * true);	 //3
```
(2)不纯的字符串和undefined是不能帮你进行隐式转换的，结果都是NaN

```
console.log(3 * "8天");		//NaN
console.log(3 * undefined); 	//NaN
```
总结：
    (1)数学运算中，不纯的字符串没法隐式转换<br/>
    (2)无论哪种运算，只要出现了undefined参与运算，结果都是NaN<br>
    (3)加号比较特殊，面对"4"没有隐式转换的

### 二.函数参数传递
    1、函数分类 有名函数、匿名函数(不能加()执行，式())、函数定义、函数表达式
    2、参数 实参、形参、不定参arguments ✔
    3、return 返回值介绍、undefined(声明未初始化) return与break/continue区别

### 三.js解析顺序和作用域（1课时）
    1、javascript解析顺序
    2、定义 先解析var、function、参数
    3、执行 再从上至下执行其他代码
    4、作用域、作用域链
        （1）为什么函数可以在定义前面执行
        （2）除了定义就是执行，从下往下执行
    
### 四.json 和 call,apply,bind
    1、json对象 创建 读取 增删改 对象的解析(for in)    
    2、创建对象,对象存在的意义    
    3、读取对象的属性,方法,以及增删改   
    4、对象的解析for in JSON.parse() 、JSON.stringify()    
    5、简单实现jq中css,html功能    
    6、call，apply，bind   ✔

### 五.定时器 Math数学函数
    1、定时器 setTimeout、setInterval   ✔
    2、定时器参数不标准使用法 、eval方法   ✔    
    3、数学函数 Math.random、Math.ceil，Math.floor，Math.round，Math.max，Math.min    
    4、Math.sin（弧度），Math.cos（弧度）； 一弧度 = π/180；

### 六.日期对象
    1、日期对象data 创建一个时间点 new data()等更多参数   
    2、Date.parse(),Date.UTC()    
    3、几种日期格式化方法 toDateString()、toTimeString()、toLocaleDateString()、toLocaleTimeString()、toUTCString()、toLocalString()    
    4、关于日期的方法 getTime()、getFullYear() 、getMonth()、getDate() 、getHours() 、getMinutes()、getSeconds()、getDay()
    5、getTimezoneOffset()

### 七.速度运动框架

### 八.时间版运动Tween.js
