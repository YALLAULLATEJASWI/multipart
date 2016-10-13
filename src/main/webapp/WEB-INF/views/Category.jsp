 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Admin</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/app-resources/css/style.css" />

<style>
.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 1s;
    }
div.TableMargin {
	margin-left: 465px;
	border-color: white;
	border-width: 2px;
	border-left-style: solid;
	margin-right: 500px;
	border-collapse: separate;
	padding-left: 15px;
}

div.FontManip {
	font-weight: bold;
	color: red;
}

div.Table {
	margin-left: 55px;
	margin-top: 40px;
	fonr-family: arial;
	font-size: 80%;
	table-layout:fixed;
}

div.BoxSize {
	width: 200px;
	margin-left: 60px;
	margin-top: -6px;
}

body {
	background-image:
		url("http://img.freecodesource.com/twitter-backgrounds/images/bg/L856370352.jpg");
	opacity: 0.8;
}
</style>

<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>
<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'categorygson'
			}).success(function(data, status, headers, config) {
				$scope.categories = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>

</head>

<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Admin">MUSIC HUB</a>
			</div>
			<ul class="nav navbar-nav nv-tabs" style="margin-left: 350px;">
				<li class="active"><a href="Home">Home</a></li>
				<li><a href="Supplier">Supplier</a></li>
				<li><a href="Product">Product</a></li>
				<li><a href="Category">Category</a></li>
			</ul>
		</div>
	</nav>
 




  <c:url var="addAction" value="addcategory" ></c:url>

<form:form action="${addAction}" modelAttribute="category" id="btn-add">
  <div class="TableMargin">
   <h3>
                     <c:if test="${category.id==0}">
		       Add New Item
	            </c:if>
	            <c:if test="${!empty category.id}">
		      Update Item for Id: <c:out value="${category.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3>
	  <table>
	  
	  <tr>  <c:if test="${category.id!=0}">
	  <td> Id:</td> <td><form:input  path="id"/></td> 
	   </c:if>
	    <tr> <td> Name:</td> <td><form:input  path="name"/></td> 
	    <tr> <td>Description:</td> <td><form:input path="description"/> </td> 
	   <%--  <tr> <td>Price: </td> <td><form:input path="price"/></td>  --%>
		
  
	    <tr> <td colspan="2">
    	        <c:if test="${category.id==0}">
			      <input type="submit" value="Add" id="btn-add"> 
	         </c:if>
	         <c:if test="${category.id!=0}">
			      <input type="submit" value="Update" id="btn-update"> 
	         </c:if>
		</td> 
		<tr> <td colspan="2" class="success-msg">
		   <c:out value="${msg}"/>
		</td> 
	  </table>
	  </div>
	  
	  <div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 70%">
				<form>
					<input
						data-ng-model="search" type="text" placeholder=" Search Category"
						style="width: 20%">
				</form>
		
	  <div class="container">
		<table class="table table-striped custab">
	  
			<tr>
			 	<td> ID </td>
		        <td> Name </td>
				 <td> Description</td>
				 <!-- <td> Price </td> -->
				 <td colspan="2"> Action </td>
	      	</tr>
	      	<tr data-ng-repeat="category in categories | orderBy:sortType:sortReverse | filter:search">
    	     
    	     
    	     
    	      <%-- <c:forEach var="obj" items="${allcategory}"> --%>
		      
		                 <td> {{category.id}} </td>
		                 <td>{{category.name}} </td>
						 <td> {{category.description}} </td>
				 <%-- <td> <c:out value="${obj.price}"/> </td> --%>
				
				 <td> <a class="btn btn-danger btn-xs" href="deletecategory/{{category.id}}">Delete </a> |
				     <a class="btn btn-info btn-xs" href="ItemBycategory/{{category.id}}">Edit</a> 
				 </td>
		      </tr>
	      <%-- </c:forEach> --%>
          </table> 
          </div>
          </div>
         
 </form:form>
</body>
</html>