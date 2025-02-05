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

@WebServlet("/deletenoticeservlet")
@MultipartConfig
public class deletenoticeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletenoticeservlet() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid = request.getParameter("sid");
		int id=0;
		if (sid != null) {
		    id = Integer.parseInt(sid);
		    // 进行后续的操作
		    try {
				   Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
		            String sql = "DELETE FROM v_notice WHERE id=?";
		            PreparedStatement statement = conn.prepareStatement(sql);
		            statement.setInt(1, id);
		            statement.executeUpdate();
		            
		            statement.close();
		            conn.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		} else {
		    System.out.print("sid为空");
		}
		response.sendRedirect("noticemanagement.jsp");
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 int id = Integer.parseInt(request.getParameter("id")); 
		 System.out.print(id);
		   try {
			   Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
	            String sql = "DELETE FROM v_notice WHERE id=?";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setInt(1, id);
	            statement.executeUpdate();

	            statement.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
