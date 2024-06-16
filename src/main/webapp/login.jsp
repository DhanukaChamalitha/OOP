<%@page import="com.oop.util.DBConnectionUtil"%>
<%@page import="com.oop.model.*"%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<% 
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth !=null){
		response.sendRedirect("home.jsp");
	}
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>User Login</title>
	
	  <link rel="stylesheet" href="css/admin.css">
	
</head>
<body>

 	<div class="form-container">

	
	
            <form action="Login" method="post">
               <h3>Login</h3>
              
               <input type="text" name="username" placeholder="enter username" class="box" required>
               <input type="password" name="password" placeholder="enter password" class="box" required>
               <input type="submit" name="submit" value="Login" class="btn">
               <p style="color:red">haven't an account</p>
               <a href="Registration.jsp" class="btn">Register Now</a>
              
            </form>
	
 	</div>

</body>
</html>
