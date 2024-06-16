<%@page import="com.oop.dao.ProductDao"%>
<%@page import="com.oop.util.DBConnectionUtil"%>
<%@page import="com.oop.model.*"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 

	Admin auth = (Admin) request.getSession().getAttribute("auth");
	if(auth !=null){
		request.setAttribute("auth", auth);
	}else{
		response.sendRedirect("adminLogin.jsp");
	}
	
	ProductDao pd = new ProductDao(DBConnectionUtil.getConnection());
	List<Product> products =  pd.getAllProducts();
	
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DBConnectionUtil.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		
		request.setAttribute("cart_list", cart_list);
	}
	
%>
  
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Products</title>
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

    <h3 style="text-align: center;">Add product</h3>

    <div class="update-profile">
        
        <form action="AdminAddProduct" method="post" >
          
           <div class="flex">
              <div class="inputBox">
              <span>Item id :</span>
                 <input type="text" name="itemId" value="" class="box">
                 <span>Item Name :</span>
                 <input type="text" name="itemName" value="" class="box">
                 <span>Item Category :</span>
                 <input type="text" name="category" value="" class="box">
                 
              </div>
              <div class="inputBox">
                 
                 <span>Item Price :</span>
                 <input type="text" name="itemPrice" placeholder="item price" class="box">
                 <span>Item Description :</span>
                 <input type="text" name="itemdescription" placeholder="itemdescription" class="box">
               <span>Item image :</span>
                 <input type="file" name="itemimage" placeholder="itemimage" class="box">
              </div>
           </div>
           <input type="submit" value="Add Item" name="update_profile" class="btn">
        </form>
     
     </div>
     
  
    <h3 style="text-align: center;">Products</h3>

	<div class="row">
         
           <div class="flex">
              <div class="inputBox">
                <table>
                    <tr>
                      <th>Id</th>
                      <th>Name</th>
                      <th>Category</th>
                      <th>Price</th>
                      <th>Description</th>
                       <td>image</td>
                    </tr>
                <%
      			if(!products.isEmpty()){
      			for(Product p:products){%>    
                    <tr>
                      <td><%= p.getId()%></td>
                      <td><%= p.getName() %></td>
                      <td><%= p.getCategory()%></td>
                      <td><%= p.getPrice() %></td>
                      <td><%= p.getDescription()%></td>
                      <td>image</td>
                      <td><a href="adminUpdateProduct.jsp">Update</a></td>
                      <td><a href=adminRemoveProduct.jsp>Remove</a></td>
                      
                    </tr>
                    		<%} 
      		}
      	%>
                  </table>
              </div>
             </div>
     	</div>
     	
    <script src="js/script.js"></script>
  </body>
</html>
