
package Controllor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import others.Email;


@WebServlet(name="OTPController", urlPatterns={"/OTPController"})
public class OTPController extends HttpServlet
 {
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        String email=request.getParameter("email");
        try 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps=con.prepareStatement("select * from users where email=?");
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())
            {
                Random r=new Random();
                int randomnumber=r.nextInt(8999)+1000;
                Email e=new Email(email, "Password RESET :: OTP", "Yout One Time Password is: "+randomnumber);
                e.sendEmail();
                HttpSession hs=request.getSession();
                hs.setAttribute("otp", randomnumber);
                hs.setAttribute("email", email);
                response.sendRedirect("confirmotp.jsp");
            }
        }
        catch (Exception e) 
        {
            System.out.println(e);
        }
    }
}
