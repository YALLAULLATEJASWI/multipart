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

</head>

<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">MUSIC HUB</a>
			</div>
			<ul class="nav navbar-nav nv-tabs" style="margin-left: 350px;">
				<li class="active"><a href="Admin">Home</a></li>
				<li><a href="Supplier">Supplier</a></li>
				<li><a href="Product">Product</a></li>
				<li><a href="Category">Category</a></li>
			</ul>
		</div>
	</nav>
	<c:url var="addAction" value="addProduct"></c:url>

<form:form action="${addAction}" modelAttribute="product" id="btn-add" enctype="multipart/form-data" method="post">
		<div class="TableMargin">
			<h3>

		 <c:if test="${product.id==0}">
		       
	            </c:if>
	            <c:if test="${!empty product.id}">
		       <c:out value="${product.id}"/>
		      <form:hidden path="id"/>
	            </c:if> 
			</h3>
			<table>

				<tr>
					<c:if test="${product.id!=0}">
						<td><span
							style="font-family: arial; color: darkblue; font-size: 80%;">
								Id</span></td>
						<td><form:input path="id" /></td>
					</c:if>
				<tr>
					<td>Name</td>
					<td><span style="margin-left: 30px;"><form:input placeholder="product name" path="name" /></span></td>
				<tr>
					<td>Description</td>
					<td><span style="margin-left: 30px"><form:input path="description" /> </span></td>
				<tr>
					<td>Price</td>
					<td><span style="margin-left: 30px"></span>
					<form:input path="price" /></td>
				<tr>
					<td colspan="2"><c:if test="${product.id==0}">
							<br>
							<!--  <input type="submit" class="btn btn-success" style="margin-left:235px" value="add" id="btn-add">  -->
						</c:if> <c:if test="${product.id!=0}">
							<br>
							<input type="submit" class="btn btn-success"
								style="margin-left: 235px" value="Update" id="btn-update">
						</c:if></td>
				<tr>
					<td colspan="2" class="success-msg"><c:out value="${msg}" /></td>
			</table>
             
			 <div class="BoxSize">
			<tr><!-- <td>	<span style="margin-left: -120px; margin-top: 30px">Category</span></td> -->
	<span style="margin-left:30px"></span><form:select id="category_id" name="category_id" class="form-control product-type" path="category_id"></td></tr>
<label >Category Name</label>
					<c:forEach items="${allcategory}" var="categorylist">
						<form:option class="input1" value="${categorylist.id}">${categorylist.name}</form:option>
					</c:forEach>
				</form:select>
			


			<form:select id="supplier_id" name="supplier_id" class="form-control product-type" path="supplier_id"></td></tr>

				<c:forEach items="${allsupplier}" var="supplierlist">
					<form:option class="input1" value="${supplierlist.id}">${supplierlist.name}</form:option>
				</c:forEach>
			</form:select> 
</div>
			<br>

			<td><label for="image">Image:</label></td>
			<td><form:input type="file"
					class=" btn btn-default btn-block form-control" path="image"
					required="true" /></td>
			</tr>
			<tr>

				<br>
				<td><input type="submit" class="btn btn-primary" value="Save" /></td>
		</div>
		<br>
		<div class="container">
		<table class="table table-striped custab">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Price</th>

				<th>CATEGORY</th>
				<th>SUPPLIER</th>
<th>IMAGE</th>

				<th colspan="2" >Action</th>
			</tr>
			<c:forEach var="obj" items="${allproduct}">
				<tr>
					<td><c:out value="${obj.id}" /></td>
					<td><c:out value="${obj.name}" /></td>
					<td><c:out value="${obj.description}" /></td>
					<td><c:out value="${obj.price}" /></td>

					<td><c:out value="${obj.category_id}" /></td>
					<td><c:out value="${obj.supplier_id}" /></td>
					<td><div class="thumbnail">
<img height="50px" width="50px" alt="${obj.id}" src="<c:url value="/resources/images/product/${obj.id}.jpg"></c:url>">
						</div>
					<td><a class="btn btn-danger btn-xs" href="deleteproduct/${obj.id}"></span>Delete </a> | <a
						class="btn btn-info btn-xs" href="ItemByproduct/${obj.id}">Edit</a></td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</form:form>
</body>
</html>
