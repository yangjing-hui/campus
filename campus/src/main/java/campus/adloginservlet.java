package campus;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/adloginservlet")
public class adloginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adloginservlet() {
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
		String id = request.getParameter("id");
		String psw = request.getParameter("psw");
		if(authenticateUser(id,psw)) {
		    HttpSession session = request.getSession();
			session.setAttribute("uid", id);
			response.sendRedirect("adminlogin.jsp");		
		}
		else {
			response.sendRedirect("adlogin.jsp");		
		}
	}
	public boolean authenticateUser(String id, String psw) {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC", "root", "12345");

	        String sql = "SELECT * FROM v_admin where id = ? AND psw = ?";
	        PreparedStatement statement = con.prepareStatement(sql);
	        statement.setString(1, id);
	        statement.setString(2, psw);
	        ResultSet resultSet = statement.executeQuery();
	        boolean adminExists = resultSet.next();
	        resultSet.close();
	        statement.close();
	        con.close();
	        return adminExists;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
