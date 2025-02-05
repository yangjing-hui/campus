package campus;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class addplaceservlet
 */
@WebServlet("/addplaceservlet")
@MultipartConfig
public class addplaceservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addplaceservlet() {
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
		 // 添加地点信息
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"), "utf-8");
        String infor = new String(request.getParameter("infor").getBytes("ISO-8859-1"), "utf-8");
        Part filePart = request.getPart("pic");
        
        InputStream inputStream = filePart.getInputStream();
        System.out.println(inputStream);
        addPlace(name, infor, inputStream);
     // 重定向回地点管理页面
        response.sendRedirect("local.jsp");
	}
	private void addPlace(String name, String infor, InputStream inputStream) {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/visitormanagement?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8", "root", "12345");
            String sql = "INSERT INTO v_place (name, infor, pic) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, infor);
            statement.setBlob(3, inputStream);
            statement.executeUpdate();
            System.out.println("Place added successfully");
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
