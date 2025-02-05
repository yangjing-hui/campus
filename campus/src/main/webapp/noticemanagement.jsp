<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>公告管理</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #0c63bb;
        color: white;
        font-size: 18px;
        text-align: center;
    }

    td button {
        padding: 5px 10px;
        cursor: pointer;
    }

    /* Optional: Add hover effect to buttons */
    td button:hover {
        background-color: #ddd;
    }
</style>
</head>
<body>

<%
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
        Statement stmt = conn.createStatement();

        // View locations
        ResultSet rs = stmt.executeQuery("SELECT * FROM v_notice");
%>

        <h2 style="text-align: center; font-size: 50px;color: #0b6ed2">公告管理</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>id</th>
                    <th>公告名</th>
                    <th>内容</th>
                    <th>时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
<%
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String content = rs.getString("content");
                    Timestamp startTimeStamp = rs.getTimestamp("time");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String time = dateFormat.format(startTimeStamp);

%>
                    <tr>
                        <td><%= id %></td>
                        <td><%= name %></td>
                        <td><%= content %></td>
                        <td><%= time %></td>
                        <td>
                          	<form action="noticeservlet" method="post">
                          	 <input type="hidden" name="action1" value="edit">
							<a href="noticeedit.jsp?id=<%=id%>">编辑</a>
							</form>
							
							<form action="deletenoticeservlet" method="post">
							    <a href="deletenoticeservlet?sid=<%=id%>">删除</a>
							</form>

                        </td>
                    </tr>
<%
                }
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
%>
            </tbody>
        </table>
		<a href="noticeadd.jsp" >添加新公告</a>


</body>
</html>