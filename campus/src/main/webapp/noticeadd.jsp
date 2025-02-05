<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加公告</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
             font-size: 24px
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

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"], input[type="datetime-local"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
             font-size: 24px
        }

        input[type="submit"] {
            background-color: #0c63bb;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 20px;
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
            font-size: 20px
        }
    </style>
</head>
<body>
    <h1 style="text-align: center; font-size: 50px;color: #0b6ed2">添加新公告</h1>
    <form action="noticeservlet" method="post" accept-charset="UTF-8">
        <input type="hidden" name="action1" value="add">
        <label for="name">公告:</label>
        <input type="text" id="name" name="name" required>
        <label for="content">内容:</label>
        <input type="text" id="content" name="content" required>
        <label for="time">时间:</label>
        <input type="datetime-local" id="time" name="time" required>
        <input type="submit" value="添加">
    </form>
    <a href="noticemanagement.jsp">返回</a>
</body>
</html>
