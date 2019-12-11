<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <center>
        <jsp:include page="ho.jsp"/>
        <h1>Add Hotel Page</h1>
        <div class="container-fliud">
        <c:if test="${hotel==null}">
        <form action="AddController" method="Post" class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass" enctype="multipart/form-data">
        </c:if>
        <c:if test="${hotel!=null}">
            <form action="EditController" method="post" class="col-lg-6 col-md-6 col-sm-12 col-xs-12 myclass">
                <div class="form-group">
          <label>Hotel ID</label>
          <input type="text" name="hotelid" readonly="" value="${hotel.hotelid}" class="form-control"/>  
                </div>
                </c:if>
          <div class="form-group">
            <label>Hotel Name</label>
            <input type="text" name="hotelname" class="form-control"  value="${hotel.hotelname}" />
          </div>
            <div class="form-group">
                    <label>Location</label>
                    <input type="text" name="location" class="form-control" value="${hotel.location}" />
            </div>
            <div class="form-group">
              <label>Description</label>
              <textarea name="description" class="form-control">${hotel.description}</textarea> 
            </div>
            <div class="form-group">
                    <label>Image</label>
                    <input type="file" name="image" class="form-control" accept="image/*" />
            </div>
              <c:if test="${hotel!=null}">
                  <label>Status</label>
                  <input type="text" name="status" class="form-control" value="${hotel.status}"/>
                  
              </c:if>
                  <div class="form-group">
               <c:if test="${hotel==null}">
                   <input type="submit" value="Add"  class="btn tbn-primary btn-block"/>
               </c:if>
               <c:if test="${hotel!=null}">
                   <input type="submit" value="update" class="btn btn-primary btn-block" />
               </c:if>
                   <input type="reset" value="Reset" class="btn btn-danger btn-block"/>
            </div>
        </form>
        </div>
    </center>
    </body>
</html>
