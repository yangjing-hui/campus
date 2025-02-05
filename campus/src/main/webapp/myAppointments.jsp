<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的预约</title>
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
            font-size: 16px;
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
<div class="container">
        <h2 style="text-align: center; font-size: 50px;color: #0b6ed2">我的预约</h2>
        <table border="1" >
            <thead>
                <tr>
                    <th>姓名</th>
                    <th>手机号</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>入校停车</th>
                    <th>车牌号</th>
                    <th>访问事由</th>
                    <th>状态</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM v_application");

                    while (rs.next()) {
                        String name = rs.getString("name");
                        String phone = rs.getString("phone");
                        Timestamp startTimeStamp = rs.getTimestamp("starttime");
                        Timestamp endTimeStamp = rs.getTimestamp("endtime");
                        String parking = rs.getString("parking");
                        String carPlate = rs.getString("carPlate");
                        String reason = rs.getString("reason");
                        String state = rs.getString("state");
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String startTime = dateFormat.format(startTimeStamp);
                        String endTime = dateFormat.format(endTimeStamp);

                        out.println("<tr>");
                        out.println("<td>" + name + "</td>");
                        out.println("<td>" + phone + "</td>");
                        out.println("<td>" + startTime + "</td>");
                        out.println("<td>" + endTime + "</td>");
                        out.println("<td>" + parking + "</td>");
                        out.println("<td>" + carPlate + "</td>");
                        out.println("<td>" + reason + "</td>");
                        out.println("<td>" + state + "</td>");
                        out.println("</tr>");
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("Exception: " + e.getMessage());
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
