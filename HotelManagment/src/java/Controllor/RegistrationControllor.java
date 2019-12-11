
package Controllor;

import Model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationControllor")
public class RegistrationControllor extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        User user = new User();
        user.setUsername(req.getParameter("Username"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));
        user.setMobile(req.getParameter("mobile"));
        try 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps=con.prepareStatement("insert into users(username,email,password,mobile,role) values(?,?,?,?,?)");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getMobile());
            ps.setString(5, "user");
            ps.executeUpdate();
            resp.sendRedirect("Login.jsp");
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        
        
        
    }
    
}
