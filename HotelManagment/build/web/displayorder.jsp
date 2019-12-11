

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>
   <body>
    
        <jsp:include page="ho.jsp"/>
        <sql:setDataSource driver="org.apache.derby.jdbc.ClientDriver" 
                           url="jdbc:derby://localhost:1527/hotel"
                           user="hotel"
                           password="hotel"
                           var="con"/>
        
        <sql:query dataSource="${con}" var="data">
            select * from orders where userid=${user.userid}
        </sql:query>
            <c:forEach items="${data.rows}" var="row">
       
            <sql:query dataSource="${con}" var="data1">
                select * from hotels where hotelid = ${row.hotelid}
            </sql:query>
        <c:forEach items="${data1.rows}" var="row1">
        <div class="container-fliud">
<div class="card">
	<div class="row">
		<aside class="col-sm-5 border-right">
<article class="gallery-wrap"> 
<div class="img-big-wrap">
  <div> <a href="#"><img src="ImageServlet?hotelid=${row1.hotelid}"></a></div>
</div> 

</article> 
		</aside>
		<aside class="col-sm-7">
<article class="card-body p-5">
    <h3 class="title mb-3"><label>Hotel Name:</label>${row1.hotelname}</h3>
    <dl class="item-property">
  <dt>Location:</dt>
  <dd><p> ${row1.location}</p></dd>
</dl>
<dl class="item-property">
  <dt>Description:</dt>
  <dd><p> ${row1.description}</p></dd>
</dl>
<hr>
	
		
            <div class="col-sm-7">
                <p class="price-detail-wrap">
                    
			<dl class="param param-inline">
                             <dt>price: </dt>
                             
				  <dd>
				  	<label class="form-check form-check-inline">
					  
                                          <span >${row.finalprice} for ${row.day} days  </span>
					</label>
				  </dd>
				  <!-- <dt>Room Type: </dt>
				  <dd>
				  	<label class="form-check form-check-inline">
					  <span class="form-check-label">${row.Type}</span>
					</label>
				  </dd> -->
                                 
                                        
			</dl>  <!-- item-property .// -->
                    
            
		
        </div>
        <hr>
        <form action="BuyController" method="post">
           <button class="btn btn-lg btn-dark text-uppercase" type="submit" > Buy now </button>
           <input type="hidden" name="hotelid" class="form-control" value="${row.hotelid}"/>
           <input type="hidden" name="price" class="form-control" value="${row.finalprice}"/>
           <input type="hidden" name="day" class="form-control" value="${row.day}"/>
        </form>
</article> <!-- card-body.// -->
		</aside> <!-- col.// -->
	</div> <!-- row.// -->
</div> <!-- card.// -->


</div>
            
            
                                                        </c:forEach> 
                </c:forEach> 
    </body>
</html>
