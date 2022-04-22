

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sql.Sql;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try {
			Connection con=Sql.getcon();
			PreparedStatement ps1=con.prepareStatement("insert into movie(id,name,genre,year,quality,rating,link,upload_date)values(?,?,?,?,?,?,?,?)");
			
			ps1.setString(1,request.getParameter("id"));
			ps1.setString(2,request.getParameter("name"));
			ps1.setString(3,request.getParameter("genre"));
			ps1.setString(4,request.getParameter("year"));
			ps1.setString(5,request.getParameter("quality"));
			ps1.setString(6,request.getParameter("rate"));
			ps1.setString(7,request.getParameter("link"));
			ps1.setString(8,request.getParameter("date"));
			
			int rs1=ps1.executeUpdate();
			if(rs1>0) {
				PreparedStatement ps2=con.prepareStatement("insert into image(id,image)values(?,?)");
				
				String img=request.getParameter("img");
				InputStream in = new FileInputStream(img);
				
				ps2.setString(1,request.getParameter("id"));
				ps2.setBlob(2,in);
				
				int rs2=ps2.executeUpdate();
				if(rs2>0) {
					out.println("Uploaded Successfully....");
				}
			}
		}
		catch(Exception e) {e.printStackTrace();}
	}

}
