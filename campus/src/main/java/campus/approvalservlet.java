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


@WebServlet("/approvalservlet")
public class approvalservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public approvalservlet() {
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
		String action = request.getParameter("action");
        int applicationId = Integer.parseInt(request.getParameter("applicationId"));

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
 	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC", "root", "12345");
            PreparedStatement statement = null;

            if ("approve".equals(action)) {
                statement = con.prepareStatement("UPDATE v_application SET state='passed' WHERE num=?");
            } else if ("reject".equals(action)) {
                statement = con.prepareStatement("UPDATE v_application SET state='rejected' WHERE num=?");
            }

            if (statement != null) {
                statement.setInt(1, applicationId);
                statement.executeUpdate();
                statement.close();
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 重定向回预约管理页面
        response.sendRedirect("adminlogin.jsp");
	}

}
