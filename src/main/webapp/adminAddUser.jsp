<%@page import="com.oop.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Users</title>
  <head>
    
    <link rel="stylesheet" href="css/admin.css">


      <ul>
    
        <li><a href="admin.jsp">Home</a></li>
        <li><a href="adminAddProduct.jsp">Products</a></li>
        <li><a href="adminAddUser.jsp">Users</a></li>
        <li style="float:right"><a class="active" href="adminProfile.jsp">Profile</a></li>

    </ul>


 
  </head>

  <body>

    <h3 style="text-align: center;">Remove User</h3>

    <div class="update-profile">
        
        <form action="AdminRemoveUserServlet" method="post" >
          
           <div class="flex">
              <div class="inputBox">
                 <span>User id :</span>
                 <input type="text" name="userId" value="" class="box">
              </div>
              
             
              
           </div>
           	<button type="submit" class="delete-btn">Remove</button>
        </form>
     
     </div>

     

    <script src="js/script.js"></script>
  </body>
</html>
