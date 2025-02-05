<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户信息修改</title>
     <style>
        title{
        text-align: center;
        }
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            font-size: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
            font-size: 50px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-size: 20px;
        }

        h3 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 20px;
        }

        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            font-size: 20px;
        }

        input[type="submit"] {
            background-color: #0c63bb;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 20px;
        }

        input[type="submit"]:hover {
            background-color: #084785;
            font-size: 20px;
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #0c63bb;
            text-decoration: none;
            font-size: 20px;
        }
        label{
        	font-size: 20px;
        }
        textarea{
        	font-size: 20px;
        }
    </style>
</head>
<body>

<%
    try {
    	String id="";
        // 获取从上一个页面传递过来的参数
        if(session.getAttribute("uid")!=null)
        id = (String)session.getAttribute("uid").toString();

        // 连接数据库
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT * FROM v_user WHERE id=" + id);

        if (rs.next()) {
            String psw = rs.getString("psw");
%>
            <h2 style="text-align: center; font-size: 50px;color: #0b6ed2">用户信息修改</h2>
            <form action="usereditservlet" method="post"enctype="multipart/form-data" accept-charset="UTF-8">
                <input type="hidden" name="action" value="edit">
                <label for="id">用户名:</label><br>
                <input type="text" id="id" name="id" value="<%= id %>"><br>

                <label for="psw">密码:</label><br>
                <input type="text" id="psw" name="psw" value="<%= psw %>"><br>

                <input type="submit" value="保存修改">
            </form>
            <form action="visitorlogin.jsp" method="post">
                <input type="submit" value="取消">
                </form>
<%
        } else {
            // 处理未找到地点的情况
            out.println("用户不存在");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
