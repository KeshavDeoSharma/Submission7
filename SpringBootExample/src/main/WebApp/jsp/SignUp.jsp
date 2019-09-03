<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/jsp/SignUp.css"
	rel="stylesheet">

<!-- script type="text/javascript">
$(document).ready(function() { // <-- enclose your code in a DOM ready handler

 console.log("inside validator");

 jQuery.validator.addMethod("avail", function() {
  //var bool=false;
  $.ajax({
   url : "checkEmail",
   data : {
    email : $("#inputUsername").val()
   },
   async : false,
   success : function(data) {
    var m = data;
    if (m == "Username is Available") {
     /*alert("In avail");*/
     window.bool = true;
    }
    if (m == "Username is taken") {
     /*alert("In taken");*/
     window.bool = false;
    }
   }

  });
  /*alert(bool);*/
  return window.bool;;
 })
</script>
 -->
<!--  <script type="text/javascript">
 $("#inputUsername").blur(function(){
	 var.entered = $("#inputUsername").val();
	 $ajax({
		 url : window.location +"/validate",
		 data : "username=" + entered,
		 success : function(result) {
			 if(result == 'Duplicate') {
				 $("#emailMsg").html("Username already registered.!!");
				 $("#inputUsername").focus();
				 $("#create").prop("disabled", true);
			 
			 } else {
				 $("#emialMsg").html("");
				 $("#create").prop("diabled",false);
			 }
		 }
	 });
	 });</script> -->
<script>
	function avail(){
		$.ajax({
			url : "validate",
			data : {
				uname : $("#inputUsername").val()	
			},
			success : function(data){
				var m = data;
				if( m == "Wrong"){
					alert("Username already taken!");
					$("#inputUsername").val("");
					$("#inputUsername").focus();
				}		
				
			},
			error : function() {
				alert("Error");
			}
			});
		}
</script>
<script type="text/javascript">
    function confirmPass() {
    	 //alert("inside the check password");
    
        var pass = document.getElementById("inputPassword").value
        var confPass = document.getElementById("inputCPassword").value
        if(pass!=confPass) {
            alert("Wrong confirm password !");
        }
    }
</script>
<script type="text/javascript">
    function confirmPass1() {
        var pass = document.getElementById("inputPassword1").value
        alert("inside the check password");
        var confPass = document.getElementById("inputCPassword").value
        if(pass!=confPass) {
            alert("Wrong confirm password !");
            
        }
    }
</script>
<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/jquery-migrate-1.4.1.min.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.min.js"></script>
</head>
<body>


	<div class="container">
		<div class="card card-container">


			<ul class="nav nav-pills red">
				<li class="active"><a data-toggle="pill" href="#home">SignUp
						as Admin</a></li>
				<li><a data-toggle="pill" href="#menu1">SignUp as User</a></li>

			</ul>

			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<!-- -----------------Admin Signup----------------- -->
					<header>
						<div class="login-head">
							<h1 class="login-head-content">
								<i class="fa fa-pencil-square-o"></i> Admin Registrations
							</h1>
						</div>
					</header>
					<form:form class="form-signin" method="POST"
						action="/addRegisterAdmin" modelAttribute="register">
						<span id="reauth-email" class="reauth-email"></span>
						<b>Username:</b>
						<form:input type="text" id="inputUsername" name="username"
							class="form-control" placeholder=" Username" path="username"
							required="required" />
						<button onclick="avail()">Check</button>
						<span id="reauth-email" class="reauth-email"></span>
						<b>Email:</b>
						<form:input type="email" id="inputEmail" class="form-control"
							placeholder="Email" path="email"  required="required" />
						<b>Password:</b>
						<form:input type="password" id="inputPassword"
							class="form-control" placeholder="Password" name="pass" path="password" />
						<b> Confirm Password:</b>
						<form:input type="password" id="inputCPassword" name="c_pass"
							class="form-control" placeholder="Confirm password"
							path="confirmpassword" onblur="confirmPass()" required="required" />
						<b>Contact Number:</b>
						<form:input type="number" pattern="[7-9]{1}[0-9]{9}" id="Contact"
							class="form-control" placeholder="Contact Number"
							path="mobileNumber" required="required" value="mobileNumber" />
							<br/>
						<button class="btn btn-lg btn-primary btn-block btn-signin"
							type="submit">Sign Up</button><br/>
							
					</form:form>
					<a href="/loadLogin" class="signup">Already Registered? Sign in</a>
					<br/>
				</div>
				<div id="menu1" class="tab-pane fade">
					<header>
						
						
						
						
						
						
						
						<!-- -----------------User signup----------------- -->
						<div class="login-head">
							<h1 class="login-head-content">
								<i class="fa fa-pencil-square-o"></i> User Registration
							</h1>
						</div>
					</header>
					<form:form class="form-signin" action="/addRegisterUser"
						method="POST" modelAttribute="register" autocomplete="off">
						<span id="reauth-email" class="reauth-email"></span>
						<b>Username:</b>
						<form:input type="text" id="inputUsername" class="form-control"
							placeholder=" Username" path="username" required="required" />
<button onclick="avail()">Check</button>
						<span id="reauth-email" class="reauth-email"></span>
						<b>Email:</b>
						<form:input type="email" id="inputEmail" class="form-control"
							placeholder="Email" path="email" required="required" />
						<b>Password:</b>
						<form:input type="password" id="inputPassword1"
							class="form-control" placeholder="Password" name="pass1" path="password"
							required="required" />
						<b> Confirm Password:</b>
						<form:input type="password" id="inputCPassword1"
							class="form-control" placeholder="Confirm password"
							path="confirmpassword" name="c_pass1" required="required" onblur="confirmPass1()" />
						<b>Contact Number:</b>
						<form:input type="text" pattern="[7-9]{1}[0-9]{9}" id="Contact"
							class="form-control" placeholder="Contact Number"
							path="mobileNumber" required="required" />
						<button class="btn btn-lg id=" create" btn-primary btn-block
							btn-signin" type="submit">Sign Up</button>
					</form:form>
					<a href="/loadLogin" class="signup">Already Registered? Sign in</a>
				</div>

			</div>
		</div>
	</div>
</body>
</html>