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
<script type="text/javascript">
 function confirmPass() {
    	 //alert("inside the check password");
    
        var pass = document.getElementById("inputnPassword").value
        var confPass = document.getElementById("inputnPassword1").value
        if(pass!=confPass) {
            alert("Wrong confirm password !");
        }
    }
</script>
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
<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script>
window.onload = function () {
var chart = new CanvasJS.Chart("chartContainer", {
title: {
 text: "Compare Company Name"
},
axisX: {
 valueFormatString: "MMM YYYY"
},
axisY2: {
 title: "Company List Price",
 prefix: "$",
 suffix: "K"
},
toolTip: {
 shared: true
},
legend: {
 cursor: "pointer",
 verticalAlign: "top",
 horizontalAlign: "center",
 dockInsidePlotArea: true,
 itemclick: toogleDataSeries
},
data: [{
 type:"line",
 axisYType: "secondary",
 name: "Cognizant",
 showInLegend: true,
 markerSize: 0,
 yValueFormatString: "$#,###k",
 dataPoints: [  
  { x: new Date(2014, 00, 01), y: 850 },
  { x: new Date(2014, 01, 01), y: 50 },
  { x: new Date(2017, 05, 01), y: 1170 }
 ]
},
{
 type: "line",
 axisYType: "secondary",
 name: "Cognizant",
 showInLegend: true,
 markerSize: 0,
 yValueFormatString: "$#,###k",
 dataPoints: [
  { x: new Date(2014, 00, 01), y: 200 },
  { x: new Date(2014, 01, 01), y: 1700 },
  { x: new Date(2017, 05, 01), y: 30 }
 ]
},
{
 type: "line",
 axisYType: "secondary",
 name: "Cognizant",
 showInLegend: true,
 markerSize: 0,
 yValueFormatString: "$#,###k",
 dataPoints: [
  { x: new Date(2014, 00, 01), y: 40 },
  { x: new Date(2014, 01, 01), y: 415 },
  { x: new Date(2017, 05, 01), y: 875 }
 ]
},
{
 type: "line",
 axisYType: "secondary",
 name: "Cognizant",
 showInLegend: true,
 markerSize: 0,
 yValueFormatString: "$#,###k",
 dataPoints: [
  { x: new Date(2014, 00, 01), y: 529 },
  { x: new Date(2017, 04, 01), y: 1749 },
  { x: new Date(2017, 05, 01), y: 740 }
 ]
}]
});
chart.render();
function toogleDataSeries(e){
if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
 e.dataSeries.visible = false;
} else{
 e.dataSeries.visible = true;
}
chart.render();
}
}
</script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>