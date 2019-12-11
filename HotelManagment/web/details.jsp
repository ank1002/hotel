

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
         <link href="hotel.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
    
        <jsp:include page="ho.jsp"/>
    <sql:setDataSource driver="org.apache.derby.jdbc.ClientDriver" 
                           url="jdbc:derby://localhost:1527/hotel"
                           user="hotel"
                           password="hotel"
                           var="con"/>
        
        <sql:query dataSource="${con}" var="data">
            select * from hotels where hotelid=?
            <sql:param>${param.hotelid}</sql:param>
        </sql:query>
            <sql:query dataSource="${con}" var="data1">
            select * from rooms
            </sql:query>
        <c:forEach items="${data.rows}" var="row">
		 <form action="AddToCartController" method="post">

            <div class="container-fliud">
<div class="card">
	<div class="row">
		<aside class="col-sm-5 border-right">
 

 <div class="tab-pane active" id="pic-1"><img src="ImageServlet?hotelid=${row.hotelid}" class="col-lg-10" style="height:1000px ; width: 1000px"/></div>



		</aside>
		<aside class="col-sm-7">
<article class="card-body p-5">
    <h3 class="title mb-3" style="color: red"><label>Hotel Name:</label>${row.hotelname}</h3>
    <dl class="item-property">
  <dt>Location:</dt>
  <dd><p> ${row.location}</p></dd>
</dl>
<dl class="item-property">
  <dt>Description:</dt>
  <dd><p> ${row.description}</p></dd>
</dl>
<hr>
	
            <div class="col-sm-7">
                <p class="price-detail-wrap">
                    <c:forEach items="${data1.rows}" var="rom">
			<dl class="param param-inline">
                             <dt>price: </dt>
                             
				  <dd>
				  	<label class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="price" id="inlineRadio2" value="${rom.price}">
                                          <span >${rom.price}/day  </span>
					</label>
				  </dd>
				  <dt>Room Type: </dt>
				  <dd>
				  	<label class="form-check form-check-inline">
					  <span class="form-check-label">${rom.Type}</span>
					</label>
				  </dd>
                                 
                                        
			</dl>  <!-- item-property .// -->
                    </c:forEach>
            
		
        </div>
        <hr>
       
            <button class="btn btn-lg btn-primary text-uppercase" type="submit" > Add to cart </button>
        <button class="btn btn-lg btn-dark text-uppercase" type="submit" > Buy now </button>

</article> <!-- card-body.// -->
		</aside> <!-- col.// -->
	</div> <!-- row.// -->
</div> <!-- card.// -->


</div>
            <div class="form-group">
                <input type="hidden" name="hotelid" class="form-control" value="${row.hotelid}"/>                                       
                </div>
            <table class="table table-striped">
 <tbody>
    <tr>
      <th scope="row">Number of days you want to stay</th>
      <td><input type="number" name="day"  min="1"/></td>
    </tr>
    <tr>
      <th scope="row">Which room number you want</th>
      <td><input type="number" name="number" value=""  min="1" max="500"/></td>
      
    </tr>
    
  </tbody>
</table>
                                                        </c:forEach>  
                 </form>
    </body>
</html>
