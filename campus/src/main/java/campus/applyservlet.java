package campus;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Types;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class applyservlet
 */
@WebServlet("/applyservlet")
public class applyservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applyservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request, response);
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "utf-8");
        String phone = new String(request.getParameter("phone").getBytes("ISO-8859-1"), "utf-8");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String parking = request.getParameter("parking");        
        String reason = new String(request.getParameter("reason").getBytes("ISO-8859-1"), "utf-8");
	        try {
	        	 Class.forName("com.mysql.cj.jdbc.Driver");
	 	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
	            String sql = "INSERT INTO v_application (name, phone, starttime, endtime, parking, carPlate, reason,uid,state) VALUES (?, ?,?, ?, ?, ?, ?, ?,?)";
	            PreparedStatement statement = con.prepareStatement(sql);
	        //    statement.setString(1, name);
	            statement.setCharacterStream(1, new InputStreamReader(new ByteArrayInputStream(name.getBytes("UTF-8")), "UTF-8"));
	            statement.setString(2, phone);
	            statement.setString(3, startTime);
	            statement.setString(4, endTime);
	            statement.setString(5, parking);
	            if ("yes".equals(parking)) {
	            // 如果选择了停车，将所有信息加入v_application表
	            	String carPlate = new String(request.getParameter("carPlate").getBytes("ISO-8859-1"), "utf-8");
	            	statement.setString(6, carPlate);
	            } else if ("no".equals(parking)) {     
	            	statement.setNull(6, Types.VARCHAR);
	            }
	            statement.setString(7, reason);
	            HttpSession session = request.getSession();
	            statement.setString(8, session.getAttribute("uid").toString());
	            statement.setString(9, "applying".toString());
	            
	            if(statement.executeUpdate()>0) {
	            	response.sendRedirect("visitorlogin.jsp");
	            }
	            statement.close();
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
	
}
