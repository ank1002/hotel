package Servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name="ImageServlet", urlPatterns={"/ImageServlet"})
public class ImageServlet extends HttpServlet
 {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException 
    {
        int hotelid=Integer.parseInt(req.getParameter("hotelid"));
        try 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps=con.prepareStatement("select image from hotels where hotelid=?");
            ps.setInt(1, hotelid);
            ResultSet rs=ps.executeQuery();
            
            if(rs.next())
            {
                Blob blob = rs.getBlob("image");
                byte arr[]=blob.getBytes(1, (int)blob.length());
                con.close();
                resp.getOutputStream().write(arr);
            }
        }
        catch (Exception e) 
        {
            
        }
    }  
    } 
 
