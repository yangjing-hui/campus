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


@WebServlet("/editnoticeservlet")
@MultipartConfig
public class editnoticeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editnoticeservlet() {
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
		 String content = new String(request.getParameter("content").getBytes("ISO-8859-1"), "utf-8");
		 String time = request.getParameter("time");
		 int id = Integer.parseInt(request.getParameter("nid")); 
		  try {
			  	Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
	            String sql = "UPDATE v_notice SET name=?, content=? WHERE id=?";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, name);
	            statement.setString(2, content);
	            statement.setInt(3, id);
	            statement.executeUpdate();
	            response.sendRedirect("noticemanagement.jsp");

	            statement.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
