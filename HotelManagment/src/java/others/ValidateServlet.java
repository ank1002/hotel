package others;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ValidateServlet")
public class ValidateServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        String value=req.getParameter("value");
        String element=req.getParameter("element");
        
        try 
        {
             Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps=con.prepareStatement("select * from users where "+element+"=?");
            ps.setString(1, value);
            ResultSet rs=ps.executeQuery();
            PrintWriter out=resp.getWriter();

            
            if(rs.next())
            {
                out.println(element+" is already exist");
            }
            else
            {
                out.println("");
            }
        }
        catch (Exception e) 
        {
            System.out.println(e);
        }
    }   
}
