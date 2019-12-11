<%-- 
    Document   : Registration
    Created on : Sep 5, 2019, 3:28:10 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .myclass
            {
                margin:0 auto;
            }
            .error
            {
                color:red;
            }
        </style>
    </head>
    <body>
        <script>
            function myfunction(element)
            {
                var val=element.value;
                var ele=element.id;
                
                var url="ValidateServlet?element="+ele+"&value="+val;
                
                var xhttp=new XMLHttpRequest();
                xhttp.onreadystatechange=function()
                {
                    if(xhttp.readyState==4)
                    {
                              document.getElementById("msg"+ele).innerHTML=xhttp.responseText;
                    }
                };
                
                xhttp.open("get",url);
                xhttp.send();
            }
            
        </script>
    <center>
         <jsp:include page="ho.jsp"/>
        <h1>Registration</h1>
    
        <form action="RegistrationControllor" method="post" class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass">
            
            <div class="form-group">
                <lable>Username</lable>
                 <input type="text" name="username" value="" class="form-control" placeholder="Username" id="username" onkeyup="myfunction(this)"/><span id="msgusername" class="error"></span>
                       <span class="error">${userStatus}</span>
            </div>
            <div class="form-group">
                <lable>Email</lable>
                <input type="text" class="form-control" name="email" value="" onkeyup="myfunction(this)" id="email" /><span id="msgemail" class="error"></span>
                     <span class="error">${emailStatus}</span>
            </div>
            <div class="form-group">
                <lable>Mobile number</lable>
                <input type="text" class="form-control" name="mobile" value="" onkeyup="myfunction(this)" /><span id="msgemobile" class="error"></span>
                <span class="error">${mobileStatus}</span>
            </div>
            <div class="form-group">
                <lable>Password</lable>
                <input type="password" class="form-control" name="password" value="" />
            </div>
            <input class="btn btn-primary" type="submit" value="Registration" />
            <input class="btn btn-danger" type="reset" value="Reset" />
        </form>
    </center>
    </body>
</html>
