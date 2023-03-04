package Client_Demo;

import java.awt.Window;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/updated")
public class Updated extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String userName = req.getParameter("userName");
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String userEmail = req.getParameter("userEmail");
		String userAge = req.getParameter("userAge");
		String userAddress = req.getParameter("userAddress");
		String userNumber = req.getParameter("userNumber");
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_client", "root", "root");
		PreparedStatement ps = con.prepareStatement("update register set username=?, firstname=?, lastname=?, email=?, age=?, address=?, mobilenumber=? where ID=? ");
		
		System.out.println("Your id is: "+userId);
		ps.setString(1, userName);
		ps.setString(2, firstName);
		ps.setString(3, lastName);
		ps.setString(4, userEmail);
		ps.setInt(5, Integer.parseInt(userAge));
		ps.setString(6, userAddress);
		ps.setInt(7, Integer.parseInt(userNumber));
		ps.setInt(8, Integer.parseInt(userId));
		
		ps.executeUpdate();
		RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
		PrintWriter pw = res.getWriter();
		pw.print("Updated successfully!!");
		rd.forward(req, res);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		pw.print("Incorrect details: Details not matching, Please enter the details again!!");
		RequestDispatcher rd = req.getRequestDispatcher("UpdateUser.jsp");
		rd.include(req, res);
	}
	
}
