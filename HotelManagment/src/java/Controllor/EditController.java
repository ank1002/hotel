
package Controllor;

import Model.hotel;
import Model.room;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name="EditController", urlPatterns={"/EditController"})
public class EditController extends HttpServlet
 {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException 
    {
    int hotelid=Integer.parseInt(req.getParameter("hotelid"));
        try 
        {
         Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps = con.prepareStatement("select * from hotels where hotelid=?");
            ps.setInt(1, hotelid);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                hotel hotel = new hotel();
                hotel.setHotelid(rs.getInt("hotelid"));
                hotel.setHotelname(rs.getString("hotelname").toUpperCase());
                hotel.setLocation(rs.getString("location").toUpperCase());
                hotel.setDescription(rs.getString("description"));
                hotel.setStatus(rs.getString("status"));
                con.close();
                req.setAttribute("hotel", hotel);
                RequestDispatcher rd=req.getRequestDispatcher("AddHotel.jsp");
                rd.forward(req, resp);
            }
            
        } catch (Exception e) 
        {
            System.out.println(e);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
       hotel hotel = new hotel();
        room  room = new room();
        hotel.setStatus(req.getParameter("status"));
        hotel.setHotelid (Integer.parseInt((req.getParameter("hotelid"))));
        hotel.setHotelname(req.getParameter("hotelname"));
        hotel.setLocation(req.getParameter("location"));
        hotel.setDescription(req.getParameter("description"));
        try 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps = con.prepareStatement("update hotels set hotelname=?, location=?, description=?, status=? where hotelid=?");
            //PreparedStatement ps1 = con.prepareStatement("update rooms set type=?, price=?, day=? where hotelid=?");
            ps.setString(1,hotel.getHotelname());
            ps.setString(2,hotel.getLocation());
            ps.setString(3,hotel.getDescription());
            ps.setString(4,hotel.getStatus());
            ps.setInt(5,hotel.getHotelid());
            ps.executeUpdate();
            /**ps1.setString(1,room.getType());
            ps1.setFloat(2,room.getPrice());
            ps1.setInt(3,room.getDay());
            ps1.setInt(4, hotel.getHotelid());
            ps1.executeUpdate();**/
            con.close();
            resp.sendRedirect("Hotel.jsp");
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }
    
   
}
