package Controllor;

import Model.hotel;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AddController")
@MultipartConfig(maxFileSize = 9999999L)
public class AddController extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        hotel hotel = new hotel();
        hotel.setHotelname(req.getParameter("hotelname"));
        hotel.setLocation(req.getParameter("location"));
        hotel.setDescription(req.getParameter("description"));
        Part part = req.getPart("image");
        InputStream is = part.getInputStream();
        try 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps = con.prepareStatement("insert into hotels (hotelname,location,description,status,image) values(?,?,?,?,?)");
            ps.setString(1,hotel.getHotelname());
            ps.setString(2,hotel.getLocation());
            ps.setString(3,hotel.getDescription());
            ps.setString(4,"available");
            ps.setBlob(5, is);
            ps.executeUpdate();
            con.close();
            resp.sendRedirect("Hotel.jsp");
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }
    
}
