<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加地点</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            font-size: 24px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            font-size: 24px;
        }

        input[type="submit"] {
            background-color: #0c63bb;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 24px;
            display: block;
            margin: 0 auto;
        }

        input[type="submit"]:hover {
            background-color: #084785;
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #0c63bb;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center; font-size: 50px;color: #0b6ed2">添加地点</h1>

    <form action="addplaceservlet" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
        地点名: <input type="text" name="name" required><br>
        简介: <input type="text" name="infor" required><br>
        图片: <input type="file" name="pic" accept="image/*" required><br>
    
        <input type="submit" value="添加">
    </form>
    <br>
    <a href="local.jsp">返回</a>
</body>
</html>
