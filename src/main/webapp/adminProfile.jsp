<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oop.util.DBConnectionUtil"%>
<%@page import="com.oop.model.*"%>
<!DOCTYPE html>

<% 
	Admin auth = (Admin) request.getSession().getAttribute("auth");
	if(auth !=null){
	request.setAttribute("auth", auth);
	}else{
	response.sendRedirect("adminLogin.jsp");
	}
%>

<html lang="en">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Profile</title>
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
  
	<% 
    if(auth != null){%>
    
    <div class="update-profile">

        <form action="" method="post" enctype="multipart/form-data">
          
           <div class="flex">
              <div class="inputBox">
                 <span>Admin Username :</span>
                 <input type="text" name="adminName" value="<% out.print(auth.getName());%>" class="box">
                 <span>Admin Email :</span>
                 <input type="email" name="adminEmail" value="<% out.print(auth.getEmail());%>" class="box">
               <!--   <span>update Admin pic :</span>
               <input type="file" name="adminImage" accept="image/jpg, image/jpeg, image/png" class="box">--> 
              </div>
              <div class="inputBox">
                 
                 <span>Admin Address :</span>
                 <input type="text" name="adminAddress" placeholder="enter address" class="box" value="<% out.print(auth.getAddres());%>">
                 <span>Admin Contact :</span>
                 <input type="text" name="adminContact" placeholder="enter contact" class="box" value="<% out.print(auth.getContact());%>">    
              </div>
           </div>
           <a href="updateAdminProfile.jsp" class="delete-btn">Update Profile</a>
          
           <a href="admin.jsp" class="delete-btn">go back</a>
            <a href="AdminLogout" class="delete-btn">logout</a>
           	 		
           <% }%>
            	
  
        </form>
     
     </div>
     
    
  	            
        		
 
    
    <script src="js/script.js"></script>
  </body>
</html>
