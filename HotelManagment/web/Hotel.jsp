

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" prefix="sql"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="hotel.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container-fliud">
        <jsp:include page="ho.jsp"/>
        <sql:setDataSource
                           driver="org.apache.derby.jdbc.ClientDriver" 
                           url="jdbc:derby://localhost:1527/Hotel"
                           user="hotel"
                           password="hotel"
                           var="con"/>
        
        <sql:query dataSource="${con}" var="data">
            select * from hotel 
           
        </sql:query>
            
            <div class="container-fliud">
        
        <table class="table table-bordered table-condensed table-striped table-hover">
            <tr>
                <th>Hotel Id</th>
                <th>Hotel Name</th>
                <th>Location</th>
                <th>Status</th>
                <c:if test="${user.role=='admin'}">
                <th>Modify</th>
                </c:if>
            </tr>
            <c:forEach items="${data.rows}" var="row" >             
                <tr class="table-row" data-href='details.jsp?hotelid=${row.hotelid}'>
                    <td>${row.hotelid}</td>
                    <td>${row.hotelname}</td>
                    <td>${row.location}</td>
                    <td>${row.Status}</td>
                    <c:if test="${user.role=='admin'}">
                        <td><a href="EditController?hotelid=${row.hotelid}" class="btn btn-primary">Edit</a> <a href="DeleteController?hotelid=${row.hotelid}" class="btn btn-dark">Delete</a></td>
                    </c:if>
                </tr>
                </c:forEach>
        </table>
        </div>
            <script>
            $(document).ready(function($) {
    $(".table-row").click(function() {
        window.document.location = $(this).data("href");
    });
});
</script>
        </div>
    </body>
</html>
