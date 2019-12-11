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
        <form action="ConfirmOTPController" method="post" class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass">
                <div class="form-group">
                    <label>Enter OTP</label>
                    <input type="text" name="otp" value="" class="form-control" placeholder="Enter OTP Number"/>
                </div>
                
                <div class="form-group">
                    <input type="submit" value="Confirm OTP" class="btn btn-primary btn-block"/>
                    <input type="reset" value="Reset" class="btn btn-danger btn-block"/>
                </div>
        </form>
        </div>
</html>