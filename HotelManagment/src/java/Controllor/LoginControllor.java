
package Controllor;

import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginControllor")
public class LoginControllor extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        User user = new User();
        user.setUsername(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        try 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps=con.prepareStatement("Select * from users where username=? and password=?");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ResultSet rs=ps.executeQuery();
            HttpSession hs = req.getSession();
            if(rs.next())
            {
                user.setUserid(rs.getInt("userid"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("mobile"));
                user.setRole(rs.getString("role"));
                con.close();
                hs.setAttribute("user", user);
             if(req.getParameter("remember")!=null)
                {
                    Cookie ck1=new Cookie("username", user.getUsername());
                    Cookie ck2=new Cookie("password", user.getPassword());
                    ck1.setMaxAge(60*60*24*30);
                    ck2.setMaxAge(60*60*24*30);
                    resp.addCookie(ck1);
                    resp.addCookie(ck2);
                }
            else
                {
                    Cookie ck1=new Cookie("username", "");
                    Cookie ck2=new Cookie("password", "");
                    ck1.setMaxAge(-1);
                    ck2.setMaxAge(-1);
                    resp.addCookie(ck1);
                    resp.addCookie(ck2);
                }
             resp.sendRedirect("Hotel.jsp");
            }
           else
            {
                PrintWriter out=resp.getWriter();
                out.print("Incorrect username or password!!!");
            }
                
            
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
 
}
