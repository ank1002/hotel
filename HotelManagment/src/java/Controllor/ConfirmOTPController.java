
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name="ConfirmOTPController", urlPatterns={"/ConfirmOTPController"})
public class ConfirmOTPController extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        int uotp=Integer.parseInt(request.getParameter("otp"));
     
        HttpSession hs=request.getSession();
        int sotp=(Integer)hs.getAttribute("otp");
        
        if(uotp==sotp)
        {
            response.sendRedirect("newpassword.jsp");
        }
        else
        {
            PrintWriter out=response.getWriter();
            out.println("Please enter correct otp!!!");
        }
    }
}
