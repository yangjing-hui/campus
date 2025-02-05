<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html >
<head>
    <title>校园访客系统</title>
    <h1 style="text-align: center; font-size: 50px;color: #fcf8f8;">校园访客系统</h1>

    <style>
        h1 {
            margin-top: 150px; /* 距离顶部的上边距 */

        }
    </style>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('login1.png'); /* 设置背景图片 */
            background-size: cover;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body >
<div class="container">
    <h2 style="font-size: 40px;">登录</h2>
    <form action="adloginservlet" method="post">
        <input style="font-size: 30px;"type="text" name="id" placeholder="用户名" required><br>
        <input style="font-size: 30px;"type="password" name="psw" placeholder="密码" required><br>
        <input style="font-size: 30px;"type="submit" value="登录">
    </form>
</div>
</body>
</html>
