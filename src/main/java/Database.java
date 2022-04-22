

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sql.Sql;

/**
 * Servlet implementation class Database
 */
@WebServlet("/Database")
public class Database extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Database() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			Connection con=Sql.getcon();
			
		    PreparedStatement ps=con.prepareStatement("insert into user(username,password,name,mobilenumber,mailid)values(?,?,?,?,?)");
		   
		   	ps.setString(1,request.getParameter("username"));
			ps.setString(2,request.getParameter("pwd"));
		   	ps.setString(3,request.getParameter("name"));
		   	ps.setString(4,request.getParameter("phone"));
		   	ps.setString(5,request.getParameter("email"));
						
			int i=ps.executeUpdate();
			
			if(i>0) {
				out.println("<b>You are successfully registered</b>");
			    out.println("<br><br>If you want to see details , ");
			    out.println("<a href=\"Login.jsp\">Click here</a>");
			}
		}
		catch(Exception e){e.printStackTrace();}
	}

}