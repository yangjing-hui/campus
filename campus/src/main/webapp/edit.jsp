<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑地点</title>
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
        // 获取从上一个页面传递过来的参数
        int id = Integer.parseInt(request.getParameter("id"));

        // 连接数据库
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
        Statement stmt = conn.createStatement();

        // 根据id查询地点信息
        ResultSet rs = stmt.executeQuery("SELECT * FROM v_place WHERE id=" + id);

        if (rs.next()) {
            // 获取地点信息
            String name = rs.getString("name");
            String infor = rs.getString("infor");
            String pic = rs.getString("pic");
%>
            <h2 style="text-align: center; font-size: 50px;color: #0b6ed2">编辑地点</h2>
            <form action="editplaceservlet" method="post"enctype="multipart/form-data" accept-charset="UTF-8">
                <input type="hidden" name="id" value="<%= id %>">
                <input type="hidden" name="action" value="edit">
                <label for="name">地点名称:</label><br>
                <input type="text" id="name" name="name" value="<%= name %>"><br>

                <label for="infor">地点简介:</label><br>
                <textarea id="infor" name="infor"><%= infor %></textarea><br>

                <label for="pic">图片:</label><br>
				<input type="file" name="pic" accept="img/*" required><br>
                <input type="submit" value="保存修改">
            </form>
            <form action="local.jsp" method="post">
                <input type="submit" value="取消">
                </form>
<%
        } else {
            // 处理未找到地点的情况
            out.println("地点不存在");
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