

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sql.Sql;

/**
 * Servlet implementation class Image
 */
@WebServlet("/Image")
public class Image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Image() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		  response.setContentType("text/html");
		  
//		  String img=request.getParameter("img");
//		  InputStream in = new FileInputStream(img);
		  
		  Connection con=Sql.getcon();
		  try {
			  Statement st=con.createStatement();
			  ResultSet rs=st.executeQuery("select * from image where id=\""+id+"\"");
			  rs.next();
			  byte[] img=rs.getBytes("image");
		      response.reset();
		      response.setContentType("image/jpg");
		      OutputStream os=response.getOutputStream();
		      os.write(img);
			  }
		catch(Exception e) {System.out.println(e);}
	}

}
