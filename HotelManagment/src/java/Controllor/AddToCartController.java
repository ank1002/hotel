
package Controllor;

import Model.User;
import Model.hotel;
import Model.room;
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
import javax.servlet.http.HttpSession;


@WebServlet(name="AddToCartController", urlPatterns={"/AddToCartController"})
public class AddToCartController extends HttpServlet
 {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException 
    {
        hotel hotel = new hotel();
        room room = new room();
        User user = new User();
        hotel.setHotelid(Integer.parseInt(req.getParameter("hotelid")));
        room.setPrice(Float.parseFloat(req.getParameter("price")));
        room.setDay(Integer.parseInt(req.getParameter("day")));
        int number =Integer.parseInt(req.getParameter("number"));
        float finalprice = room.getDay() * room.getPrice();
        
        HttpSession hs=req.getSession();
        user=(User)hs.getAttribute("user");
        try 
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/Hotel","hotel","hotel");
            PreparedStatement ps2=con.prepareStatement("insert into orders values(?,?,?,?,?)");
                ps2.setInt(3, room.getDay());
                ps2.setFloat(5, finalprice);
                ps2.setInt(4, number );
                ps2.setInt(1, hotel.getHotelid());
                ps2.setFloat(2, user.getUserid());
                ps2.executeUpdate();
                con.close();
                resp.sendRedirect("displayorder.jsp");
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }
        
    }
}
