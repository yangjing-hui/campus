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
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            font-size: 22px;
            
        }

        h1 {
            color: #0b6ed2;
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

		textarea{
			width: 100%;
			font-size: 20px;
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
<%
    try {
        // 获取从上一个页面传递过来的参数
        int id = Integer.parseInt(request.getParameter("id"));

        // 连接数据库
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
        Statement stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT * FROM v_notice WHERE id=" + id);

        if (rs.next()) {
            String name = rs.getString("name");
            String content = rs.getString("content");
            String time = rs.getString("time");
%>
            <h1>编辑公告</h1>
            <form action="editnoticeservlet" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                <input type="hidden" name="nid" value="<%= id %>">
                <label for="name">公告:</label>
                <input type="text" id="name" name="name" value="<%= name %>"><br>

                <label for="content">内容:</label>
                <textarea id="content" name="content"><%= content %></textarea><br>

                <label for="time">时间:</label>
            	<input type="datetime-local" id="time" name="time" required>
                <input type="submit" value="保存修改">
            </form>
            <form action="noticemanagement.jsp" method="post">
                <input type="submit" value="取消">
                </form>
<%
        } else {
            // 处理未找到地点的情况
            out.println("公告不存在");
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