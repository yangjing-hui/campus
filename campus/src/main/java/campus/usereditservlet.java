package campus;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/usereditservlet")
@MultipartConfig
public class usereditservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public usereditservlet() {
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
		HttpSession session = request.getSession();
        String oldid=session.getAttribute("uid").toString();
		String newid = new String(request.getParameter("id").getBytes("ISO-8859-1"), "utf-8");
		 String psw = request.getParameter("psw");
		 
		  try {
			  	Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
	            String sql = "UPDATE v_user SET id=?, psw=? WHERE id=?";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, newid);
	            statement.setString(2, psw);
	            statement.setString(3, oldid);
	            session.setAttribute("uid", newid);
	            statement.executeUpdate();
	            response.sendRedirect("visitorlogin.jsp");
	            
	            statement.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
