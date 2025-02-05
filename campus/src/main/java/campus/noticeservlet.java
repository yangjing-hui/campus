package campus;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/noticeservlet")
public class noticeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public noticeservlet() {
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
		 String action1 = request.getParameter("action1");System.out.println(action1);
		 String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "utf-8");
		 String content = new String(request.getParameter("content").getBytes("ISO-8859-1"), "utf-8");
		 String time = request.getParameter("time");

	        if("add".equals(action1)) {
	        	
	        	addNotice(name,content,time);
	        }

	        // 重定向回公告管理页面
	        response.sendRedirect("noticemanagement.jsp");
	}
	 private void deleteNotice(int id) {
	        try {
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
	 private void addNotice(String title, String content,String time) {
	        try {
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
	            String sql = "INSERT INTO v_notice (name, content,time) VALUES (?, ?,?)";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, title);
	            statement.setString(2, content);
	            statement.setString(3, time);
	            statement.executeUpdate();

	            statement.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 private void editNotice(int id, String title, String content) {
	        try {
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
	            String sql = "UPDATE v_notice SET name=?, content=? WHERE id=?";
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setString(1, title);
	            statement.setString(2, content);
	            statement.setInt(3, id);
	            statement.executeUpdate();

	            statement.close();
	            conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
