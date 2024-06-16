<%@page import="com.oop.dao.ProductDao"%>
<%@page import="com.oop.util.DBConnectionUtil"%>
<%@page import="com.oop.dao.OrderDao"%>
<%@page import="com.oop.model.*"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if(auth !=null){
		request.setAttribute("auth", auth);
		orders = new OrderDao(DBConnectionUtil.getConnection()).userOrders(auth.getId());
		
	}else{
		response.sendRedirect("login.jsp");
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
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <title>Home</title>
  <head>
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>

    <!-- font css link -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <!-- custom css file link -->

    <link rel="stylesheet" href="css/style.css">
    

  </head>
  <body>

    <!-- search form -->
<div class="container">
		<div class="card-header my-3"></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQuantity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="CancleOrderServlet?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
   
	<a class="btn btn-sm btn-danger" href="home.jsp">Home</a>
    <!--footer section starts-->


  

    <!--loader part-->

   

    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

    <!--custom js file link-->
    <script src="js/script.js"></script>
  </body>
</html>
      