
package Controllor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name="ChangePasswordController", urlPatterns={"/ChangePasswordController"})
public class ChangePasswordController extends HttpServlet
 {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
       String pass =request.getParameter("password");
        String cpass=request.getParameter("cpassword");
        
        HttpSession hs=request.getSession();
        String email=(String)hs.getAttribute("email");
        
        if(pass.equals(cpass))
        {
            try 
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/librarydemo","librarydemo","librarydemo");
                PreparedStatement ps=con.prepareStatement("update users set password=? where email=?");
                ps.setString(1, pass);
                ps.setString(2, email);
                ps.executeUpdate();
                response.sendRedirect("Login.jsp");
            }
            catch (Exception e) 
            {
                System.out.println(e);
            }
        }
        else
        {
            PrintWriter out=response.getWriter();
            out.print("Password and confirm password not matched!!!");
        }
    }
}
