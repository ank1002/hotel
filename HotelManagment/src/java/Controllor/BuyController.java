
package Controllor;

import Model.User;
import Model.hotel;
import Model.room;
import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name="BuyController", urlPatterns={"/BuyController"})
public class BuyController extends HttpServlet
 {
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException 
    {
        hotel hotel = new hotel();
        room room = new room();
        hotel.setHotelid(Integer.parseInt(req.getParameter("hotelid")));
        room.setPrice(Float.parseFloat(req.getParameter("price")));
       room.setDay(Integer.parseInt(req.getParameter("day")));
       
       HttpSession hs=req.getSession();
        User user=(User)hs.getAttribute("user");
        try 
        {
            ApiContext context = ApiContext.create("test_hTGItCBU3Td1BHxQLmsRHSoJ7svgGkgaoyn", "test_D1cLm8jTxvMc8vIXvqVD3wcVSuStxy9gmcZSLjtMxy4LW6u2g9GaxKcnHUCfOPuZVb1ZuuZ7W5Z964RTl9knV4pjEnye577MLmchNhzbPmJOASIvKJDUIXFNwlD", ApiContext.Mode.TEST);
            Instamojo api = new InstamojoImpl(context);

            PaymentOrder order = new PaymentOrder();
            order.setName(user.getUsername());
            order.setEmail(user.getEmail());
            order.setPhone(user.getMobile() );
            order.setCurrency("INR");
            order.setAmount((double)room.getPrice());
            order.setDescription("This is a test transaction.");
            order.setRedirectUrl("https://7d6965f7.ngrok.io/HotelManagment/Hotel.jsp");
            order.setWebhookUrl("https://7d6965f7.ngrok.io/HotelManagment/");
            Random r=new Random();
            int ra=r.nextInt(999999);
            order.setTransactionId(ra+"");

            PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
            resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
        } catch (Exception e) 
        {
            System.out.println(e);
        }
    }
}
