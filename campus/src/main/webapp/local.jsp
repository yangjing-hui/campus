<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Base64"%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>地点管理</title>
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
        ResultSet rs = stmt.executeQuery("SELECT * FROM v_place");
%>

        <h2 style="text-align: center; font-size: 50px;color: #0b6ed2">地点管理</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>id</th>
                    <th>地点</th>
                    <th>简介</th>
                    <th>图片</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
<%
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String infor = rs.getString("infor");
                    Blob pic = rs.getBlob("pic");
 
                        byte[] imageData = pic.getBytes(1, (int) pic.length());
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        String imageUrl = "data:image/jpeg;base64," + base64Image;                

%>
                    <tr>
                        <td><%= id %></td>
                        <td><%= name %></td>
                        <td><%= infor %></td>
                        <td><img src="data:image/jpeg;base64,<%= base64Image %>" alt="Location Image" width="100" height="100"></td>
                        <td>
                          	<form action="placeservlet" method="post">
							<a href="edit.jsp?id=<%= id %>">编辑</a>
							</form>
							
							<form action="placeservlet" method="post">
							  
							    <a href="placeservlet?id=<%= id %>">删除</a>
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
		<a href="add.jsp">添加新地点</a>


</body>
</html>
