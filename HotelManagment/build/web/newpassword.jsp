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
        </style>
    </head>
    <body>
        <div class="container-fliud">
            <jsp:include page="ho.jsp"/>
        <form action="ChangePasswordController" method="post" class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass">
                <div class="form-group">
                    <label>Enter Password</label>
                    <input type="password" name="password" value="" class="form-control" placeholder="Enter Password"/>
                </div>
            
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" name="cpassword" value="" class="form-control" placeholder="Confirm Password"/>
                </div>
                
                <div class="form-group">
                    <input type="submit" value="Change Password" class="btn btn-primary btn-block"/>
                    <input type="reset" value="Reset" class="btn btn-danger btn-block"/>
                </div>
        </form>
        </div>
</html>
