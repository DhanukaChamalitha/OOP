<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registration</title>
	
	  <link rel="stylesheet" href="css/admin.css">
	
</head>
<body>

 	<div class="form-container">

            <form action="register" method="post">
               <h3>Registration</h3>
              
               <input type="text" name="username" placeholder="Enter Username" class="box" required>
               <input type="password" name="userpassword" placeholder="Enter Password" class="box" required>
               <input type="text" name="useremail" placeholder="Enter Email" class="box" required>
               <input type="text" name="useraddres" placeholder="Enter Address" class="box" required>
               <input type="text" name="usercontact" placeholder="Enter Contact" class="box" required>
               
               <input type="submit" name="submit" value="Register" class="btn">
                <p style="color:red">haven an account</p>
               <a href="login.jsp" class="btn">Login</a>
            </form>
		
 	</div>

</body>
</html>
