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
   
    <title>Remove products</title>
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

    <h3 style="text-align: center;">Remove product</h3>
	<% 
    if(auth != null){%>
    <div class="update-profile">
        
        <form action="AdminRemoveProduct" method="post">
          
           <div class="flex">
              <div class="inputBox">
                 <span>Product id :</span>
                 <input type="text" name="proId" value="" class="box">
              </div>
            
           </div>
 
           	<button type="submit" class="delete-btn">Remove</button>
           	 <a href="adminAddProduct.jsp" class="btn">Back</a>
        </form>
      <% }%>
     </div>

   
    <script src="js/script.js"></script>
  </body>
</html>
