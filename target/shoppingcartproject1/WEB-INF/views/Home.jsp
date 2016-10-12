<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>LOGIN PAGE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  
div.container {
    width: 100%;
    
}

header {
    padding: 1em;
    color: white;
    background-color: pink;
    clear: left;
    text-align: center;
	
}
footer {
    padding: 1em;
    color: white;
    background-color: pink;
    clear: left;
    text-align: center;
}
 
nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}
article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}

		.carousel-inner > .item > img,
		.carousel-inner > .item > a > img {
		width: 100%;
		height: 470px;
		margin: 0px;
		}
	
</style>
</head>
<body>
	<div class="container">
		<header>
			<h1> <img src="http://www.bellhausentertainment.com/images/icons/musicstores/Cubomusica.jpg" class="img-square" alt="m"align="left"style="width:100px;height:50px"> MUSIC HUB 
			<img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/LinkedIn_logo_initials.png" class="img-square" alt="icon" width="25px" height="25px" align="right">
			<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Facebook_icon_2013.svg/1024px-Facebook_icon_2013.svg.png" class="img-square" alt="icon" width="25px" height="25px" align="right" >
			<img src="https://mccambridges.com/wp-content/uploads/2016/05/twitter-logo-png-transparent-background-1024x1024.png" class="img-square" alt="icon" width="25px" height="25px" align="right"></h1>
			
			
		</header>
			<div class="container-fluid">
			</div>
			<nav class="navbar navbar" style="margin-bottom:0px">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="Home.jsp"> HOME</a></li>
					<li><a href="#"> REGISTER</a></li>
					<li><a href="#"> LOGIN</a></li>
					<li><a href="#"> ABOUT US</a></li>
					<li><a href="#"> CONTACT US</a></li>
				</ul>
	</div>
	
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
					</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="https://s-media-cache-ak0.pinimg.com/originals/12/71/54/127154a2b46e868b9969ae6cbe02370a.jpg" alt="instruments" width="200" height="100">
					</div>
						 <div class="item">
							<img src="http://wallpapercave.com/wp/UJu9M7U.jpg" alt="instruments" width="200" height="100">
						</div> 
							<div class="item">
								<img src="http://darbar.org/uploads/instrument_images/banner_image_5.jpg" alt="instruments" width="200" height="100">
							</div>
								<div class="item">
									<img src="https://pccdn.perfectchannel.com/christies/live/images/item/Thatcher12846/5968660/original/CKS_12846_0395.jpg" alt="instruments" width="200" height="100">
								</div>
									<div class="item">
										<img src="http://www.nastol.com.ua/pic/201106/1366x768/nastol.com.ua-4719.jpg" alt="instruments" width="200" height="100">
									</div>
     
				</div>

				<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
							 
						</a>
			</div>
		</div>
		<c:choose>
	<c:when test="${UserClickedCart}">
	<c:import url="/WEB-INF/view/Cart.jsp"></c:import>
	</c:when>
</c:choose>
		<c:forEach items="${allproduct}" var="product">
  
  <!-- <div class="row"> -->
     <div class="col-xs-3"> 
       
      <a href="ShowProduct/${product.id}"  class="thumbnail"> <img height="200px"
       width="200px" alt="${product.id }"
       src="<c:url value="/resources/images/product/${product.id }.jpg"></c:url>"></a>
      <div class="desc">
         	<c:out value="${product.id}" />
         	<c:out value="${product.name }"></c:out>
			<c:url var="action" value="addtocart/${product.id}"></c:url>
			<form:form action="${action}" commandName="cart">
			<input type="submit" class="btn btn-primary" value="Add To Cart" />
			
			</form:form>
			
			</div>
			</div>
			
			<!-- </div>  -->
			</c:forEach>
		
				<!-- Footer -->
				<footer class="container-fluid" style="margin:0px 15px 0px 15px">
					<p>Terms And Conditions </p>
				</footer>
</body>
</html>
  