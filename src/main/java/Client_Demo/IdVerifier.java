package Client_Demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ids")
public class IdVerifier extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		
		String idnumber = req.getParameter("idNumber");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_client", "root", "root");
			PreparedStatement ps = con.prepareStatement("select * from register where ID=?");
			
			ps.setInt(1, Integer.parseInt(idnumber));
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
					RequestDispatcher rd = req.getRequestDispatcher("UserDetails.jsp");
					rd.forward(req, res);
			}
		
			} catch(Exception e) {
				e.printStackTrace();
			}
		
			res.setContentType("text/html");
			PrintWriter pw = res.getWriter();
			pw.print("Incorrect details: Password not matching, Please enter the details again!!");
			RequestDispatcher rd = req.getRequestDispatcher("IdLogin.jsp");
			rd.include(req, res);
		}
	
	}
