 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en-US">
<head><title>Admin</title>
<script src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
  <script src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/app-resources/css/style.css"/>
</head>
<body>
  <c:url var="addAction" value="addsupplier" ></c:url>

<form:form action="${addAction}" modelAttribute="supplier" id="btn-add">
   <h3>
                    <c:if test="${supplier.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty supplier.id}">
		      Update Item for Id: <c:out value="${supplier.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>
	  <table>
	  
	  <tr>  <c:if test="${supplier.id!=0}">
	  <td> Id:</td> <td><form:input  path="id"/></td> 
	   </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Address:</td> <td><form:input path="address"/> </td> 
	    <%-- <tr> <td>Price: </td> <td><form:input path="price"/></td>  --%>
		
  
	    <tr> <td colspan="2">
    	        <c:if test="${supplier.id==0}">
			      <input type="submit" value="Add" id="btn-add"> 
	         </c:if>
	         <c:if test="${supplier.id!=0}">
			      <input type="submit" value="Update" id="btn-update"> 
	         </c:if>
		</td> 
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td> 
	  </table>
	  <table>   
			<tr>
			 <td> ID </td>
		        <td> Name </td>
				 <td> Address</td>
				 <!-- <td> Price </td> -->
				 <td colspan="2"> Action </td>
	      	</tr>
                    <c:forEach  var="obj" items="${allData}">		      
                    <tr>
		                 <td> <c:out value="${obj.id}"/> </td>
		                 <td> <c:out value="${obj.name}"/> </td>
				 <td> <c:out value="${obj.address}"/> </td>
				 <%-- <td> <c:out value="${obj.price}"/> </td> --%>
				
				 <td> <a href="deletesupplier/${obj.id}">Delete </a> |
				     <a href="ItemBysupplier/${obj.id}">Edit</a> 
				 </td>
		      </tr>
	    </c:forEach>
          </table> 
 </form:form>
  
</body>
</html> 