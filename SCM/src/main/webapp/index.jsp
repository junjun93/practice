<%--
  User: junjun
  Date: 2018/7/10 下午10:13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="img/x-ico" rel="icon" href="images/logo.ico">
    <title>杭州鼎基管理咨询有限公司</title>
    <meta name="keywords" content="关键词,关键词">
    <meta name="description" content="">

    <style>
        *{margin:0;padding:0;
            background: url(images/bg.jpg) repeat-x top #4a9dde;
            font-size: 12px;
        }
        .leftbg{
            background:url('images/bg-l.jpg') no-repeat;
            width:344px;
            height:171px;
        }
        .logo{
            background:url(images/logo.jpeg) no-repeat;
            background-size:100% 100%;
            width:200px;
            height:200px;
            margin:0 auto;
        }
        .type{
            width:370px;
            margin:0 auto;
            color:#fff;
            margin-top:3px;
        }
        form{
            position:absolute;
            margin-top:30px;
            margin-left:63px;
        }
        form table{
            border:none;
            outline:none;
        }
        form table tr td{
            font-size:16px;
            border:none;
            outline:none;
        }
        form table tr td input{
            width:140px;
            height:16px;
            background:#fff;
            outline:none;
            border:none;
        }
        form table tr td select{
            width:140px;
            height:16px;
            background:#fff;
            outline:none;
            border:none;
        }
        .login{
            position:relative;
            left:295px;
            top:10px;
        }

        .bottom{
            text-align:center;
            position:absolute;
            bottom: 10px;
            left:0;
            width:100%;
        }
    </style>
</head>
<body>
    <div class="leftbg"></div>
    <div class="logo"></div>
    <div class="type">
        <form action="" method="post">
            <table>
                <tr>
                    <td>用 户 名：</td>
                    <td><input type="text"/></td>
                </tr>
                <tr>
                    <td>密 &nbsp;码：</td>
                    <td><input type="password"/></td>
                </tr>
                <tr>
                    <td>所属公司：</td>
                    <td>
                        <select name="" id="">
                            <option value="1">供应链系统</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <img src="images/btn1.jpg" width="67" height="26"/>
                        <img src="images/btn2.jpg" width="65" height="26"/>
                    </td>
                </tr>
            </table>
        </form>
        <img src="images/tit.jpg" alt="登录背景图片" width="112" height="59" class="login">
    </div>
    <div class="bottom">杭州鼎基企业管理咨询有限公司设计出品  © Copyrights</div>
<script>

</script>
</body>
</html>
