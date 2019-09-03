<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.keshav.SpringBootExample.model.Register"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">
<head>

<title>Upadte Password</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="importStockPageStyle.css" />
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="shortcut icon"
href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="./jsp/ipoplanned.css">

<!-- <meta charset="ISO-8859-1"> -->

</head>
<body>
<% 
Object username=session.getAttribute("user");
if(username==null){
	 response.sendRedirect("/loadLogin");
}
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
  %>
<div class="container-fluid nav-container">
<div class="row">
 <div class="col-md-2">
  <img src="logo.jpg">
 </div>
  <div class="col-md-8">
  <ul class="nav nav-pills nav-justified">
       <li class="dropdown"><a class="dropdown-toggle"
      data-toggle="dropdown" href="#">View Ipo <span class="caret"></span></a>
      <ul class="dropdown-menu">
       <li><a href="/loadImport">View IPO</a></li>
      </ul></li>
      
      
        <li class="dropdown active"><a class="dropdown-toggle"
      data-toggle="dropdown" href="#">Compare Company <span class="caret"></span></a>
      <ul class="dropdown-menu">
       <li><a href="/loadCompany">Add Company</a></li>
       
       </ul></li>
      <li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#">Compare Stock<span class="caret"></span></a>
      <ul class="dropdown-menu">
       <li><a href="/loadStock">Add Stock Exchange</a></li>
      </ul></li>
      
      
      <li class="dropdown  " ><a class="dropdown-toggle"
      data-toggle="dropdown" href="#">Others<span class="caret"></span></a>
      <ul class="dropdown-menu">
       <li><a href="/loadUpdatePassword">Update Password</a></li>
       <li><a href="/loadUpdateUser">Update Profile</a></li>
      
      </ul></li>
   </ul>
 </div>
<div class="col-md-2">
<a class="btn btn-danger" button type="submit" class="btn btn-danger btn-md logout"  href ="<c:url value = "/logout" />">Logout</a>
 </div>
</div>
</div>
<div class="container">
       <div class="card card-container">
           
 <header>
           <div class="login-head">
              <h1 class="login-head-content"><i class="fa fa-pencil-square-o"></i>  Add Stock Exchange</h1>
           </div>
           </header>
<form:form action="/compareStock" method="POST" modelAttribute="stock" class="form-signin">
  <div class="form-label-group"></div>
       <b>Select Stock:</b><form:select name="companyId" class="form-control" path="stock1">
    <c:forEach items="${stockList}" var="stockList">
        <option value="${stockList.stockExchangeName}">${stockList.stockExchangeid} : ${stockList.stockExchangeName}</option>
    </c:forEach>
</form:select>

      <div class="form-label-group"></div>
        <b>Select Stock:</b><form:select name="companyId" class="form-control" path="stock2">
      <c:forEach items="${stockList}" var="stockList">
        <option value="${stockList.stockExchangeName}">${stockList.stockExchangeid} : ${stockList.stockExchangeName}</option>
    </c:forEach>
</form:select>
     

               
            <button class="btn btn-lg btn-primary btn-block btn-signin text-uppercase" type="submit">Search</button>
           </form:form>
           </div>
           </div>
           
</body>
</html>