<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Base64"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>地点游览页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        .location-card {
            border: 1px solid #ccc;
            background-color: #fff;
            margin-bottom: 20px;
            padding: 20px;
        }

        .location-card h3 {
            margin: 0;
        }

        .location-card img {
            max-width: 100%;
            margin-bottom: 10px;
        }

        .location-card p {
            color: #555;
        }
    </style>
</head>
<body>

    <h2>地点游览页面</h2>

    <% 


try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
        Statement stmt = conn.createStatement();

        // View locations
        ResultSet rs = stmt.executeQuery("SELECT * FROM v_place");
%><%
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String infor = rs.getString("infor");
                    Blob pic = rs.getBlob("pic");
                    byte[] imageData = pic.getBytes(1, (int) pic.length());
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                    String imageUrl = "data:image/jpeg;base64," + base64Image; 
                    %>
         <div class="location-card">
            <h3><%= name %></h3>
            <img src="data:image/jpeg;<%= imageUrl %>" alt="Location Image" width="500" height="300">
            <p><%= infor %></p>
        </div>           
                    <% 
                }%><%
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
%>
        
</body>
</html>
