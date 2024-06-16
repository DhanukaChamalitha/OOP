<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="com.oop.util.DBConnectionUtil"%>
<%@page import="com.oop.model.*"%>

<% 
	Admin auth = (Admin) request.getSession().getAttribute("auth");
	if(auth !=null){
		response.sendRedirect("admin.jsp");
	}
%>
<html lang="en">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Profile</title>
  <head>
    
    <link rel="stylesheet" href="css/admin.css">

    <body>
        
        <div class="form-container">

            <form action="AdminLogin" method="post">
               <h3>Admin login</h3>
              
               <input type="text" name="username" placeholder="enter username" class="box" required>
               <input type="password" name="password" placeholder="enter password" class="box" required>
               <input type="submit" name="submit" value="login now" class="btn">
              
            </form>
         
         </div>


    
    <script src="js/script.js"></script>
  </body>
</html>
