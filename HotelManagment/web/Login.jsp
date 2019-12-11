
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("user");
            session.invalidate();
        %>
        <%
            String username="",password="";
            try
            {
                Cookie[] ck=request.getCookies();
                for(Cookie c:ck)
                {
                    if(c.getName().equals("username"))
                    {
                        username=c.getValue();
                    }
                    else if(c.getName().equals("password"))
                    {
                        password=c.getValue();
                    }
                }
            }
            catch(Exception e)
            {
                
            }
        %>
    <center>
         <jsp:include page="ho.jsp"/>
        <h1>Login Page</h1>
        <form action="LoginControllor" method="post" class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass">
        <div class="container-fliud">        
  <div class="form-group">
      
    <label>Username</label>
    <input type="text"  placeholder="Enter username" value="<%=username%>" name="username" class="form-control">
  
  </div>
  <div class="form-group">
      
    <label >Password</label>
    <input type="password" placeholder="Password"  value="<%=password%>" name="password" class="form-control">
  
  </div>
            <%
                    if(!username.equals(""))
                    {
                 %>
                <div class="form-group">
                    <input type="checkbox" value="remember" class="checkbox" id="remember" name="remember" checked="true">
                    <label for="remember">Remember Me</label>
                </div>
                <%
                    }
                %>
                
                <%
                    if(username.equals(""))
                    {
                 %>
                <div class="form-group">
                    <input type="checkbox" value="remember" class="checkbox" id="remember" name="remember">
                    <label for="remember">Remember Me</label>
                </div>
                <%
                    }
                %>
  <button type="submit" class="btn btn-primary">Login</button>
  <button type="reset" class="btn btn-danger">Reset</button>
         
  <div class="form-group" align="center">
                    <a href="forgetpassword.jsp">Forgot Password?</a>
                </div>
        </div>
        </form>
    </center>
    </body>
</html>
