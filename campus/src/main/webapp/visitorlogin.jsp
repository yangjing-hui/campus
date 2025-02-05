<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .container {
            text-align: center;
        }

        h1 {
            color: #4d4c4c;
            font-size: 60px;
            margin-top: 100px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        body{
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        li {
            display: inline-block;
            margin: 0 15px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            font-size: 32px;
            transition: color 0.3s ease-in-out;
        }

        a:hover {
            color: #0056b3;
        }
        .announcement {
            background-color: #f0f0f0;
            padding: 10px;
            margin-top: 20px;
            font-family: Arial, sans-serif;
            margin-left: 100px ;
            margin-right: 100px ;

        }
    </style>
    <script>
        function toggleContent(element) {
            var paragraph = element.nextElementSibling;
            paragraph.style.display = paragraph.style.display === 'none' ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>欢迎访问访客系统</h1>
        <ul>
            <li><a href="visitorReservation.jsp">预约申请</a></li>
            <li><a href="myAppointments.jsp">我的预约</a></li>
            <li><a href="visitorlocal.jsp">校园游览</a></li>
            <li><a href="userchange.jsp">信息修改</a></li>
        </ul>

        <div class="announcement">
            <h2>公告</h2>
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC", "root", "12345");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM v_notice");
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String content = rs.getString("content");
                        Timestamp times = rs.getTimestamp("time");
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String time = dateFormat.format(times);
                      %> <div class="announcement">
                        <h2 onclick="toggleContent(this)"><%= name %></h2>
                        <p><%= content %></p>
                     <%   out.println("<tr>");
                        out.println("<td>" + time + "</td>");
                        out.println("</tr>");%></div><%
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("Exception: " + e.getMessage());
                }
                %>
            
            
            
        </div>
    </div>
</body>
</html>
