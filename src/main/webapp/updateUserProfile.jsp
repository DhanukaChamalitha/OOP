<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.oop.util.DBConnectionUtil"%>
<%@page import="com.oop.model.*"%>
<!DOCTYPE html>

<% 
	
User auth = (User) request.getSession().getAttribute("auth");
if(auth !=null){
	request.setAttribute("auth", auth);
}else{
	response.sendRedirect("login.jsp");
}
%>


<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <title>Update</title>
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
     <link rel="stylesheet" href="css/admin.css">

  </head>
  <body>


    <!-- header section starts -->
    <header>
        <a href="home.jsp" class="logo"> <i class="fa-sharp fa-solid fa-house-chimney-medical"></i>Medicare</a>

        <nav class="navbar">
            <a href="home.jsp">home</a>
            <a href="categories.jsp">categories</a>
            <a href="about us.jsp">about us</a>
            <a href="contact us.jsp">contact us</a>
	
        </nav>

        <div class="icons">
            <i class="fas fa-bars" id="menu-bars"></i>
            <i class="fas fa-search" id="search-icon"></i>
            <a href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
            <a href="userProfile.jsp"><i class="fas fa-user"></i></a>

	 		<% 
           	 	if(auth != null){%>
           	 	
                	<a style="padding:10px" href="Logout" href="Logout">logout</a>
           	 		
            	<% }else{%>
        
            		<a style="padding:10px" href="Logout" href="Registration.jsp">register</a>
            		
            	<% }%>
 
    
          </div>
    </header>
    <% 
    if(auth != null){%>
    <div style = "margin-top:65px;" class="update-profile">

        <form action="UpdateUserProfileServlet" method="post">
          
           <div class="flex">
              <div class="inputBox">
              <span>User Id :</span>
                 <input type="text" name="uid" value="<% out.print(auth.getId());%>" class="box" readonly>
                 <span>Username :</span>
                 <input type="text" name="ueame" value="<% out.print(auth.getName());%>" class="box">
                 <span>User Email :</span>
                 <input type="email" name="uemail" value="<% out.print(auth.getEmail());%>" class="box">
               <!--   <span>update Admin pic :</span>
               <input type="file" name="adminImage" accept="image/jpg, image/jpeg, image/png" class="box">--> 
              </div>
              <div class="inputBox">
                 <span>User Address :</span>
                 <input type="text" name="uaddress" placeholder="enter address" class="box" value="<% out.print(auth.getAddres()); %>">
                 <span>User Contact :</span>
                 <input type="text" name="ucontact" placeholder="enter contact" class="box" value="<% out.print(auth.getContact());%> ">
                 <span>New Password :</span>
                 <input type="password" name="upassword" placeholder="enter password" class="box" value="" required>      
              </div>
           </div>
         	
         	<button type="submit" class="delete-btn">Update</button>
          
           <a href="userProfile.jsp" class="delete-btn">go back</a>
           
    	
            	<% }%>
    	
        </form>
     
     </div>
 
   <!--footer section starts-->


    <section class="footer">

      <div class="box-container">
        
        <div class="box">
          <h3>location</h3>
          <a href="">Srilanka</a>
          <a href="">Srilanka</a>
          <a href="">Srilanka</a>
          <a href="">Srilanka</a>
          <a href="">Srilanka</a>
        </div>

        <div class="box">
          <h3>quick link</h3>
          <a href="home.jsp">home</a>
          <a href="about us.jsp">about us</a>
          <a href="privacy and policy.jsp">privacy and policy</a>
          <a href="terms and conditions.jsp">terms and conditions</a>
        </div>

        
         <div class="box">
          <h3>contact info</h3>
          <a href="">(+94) 077 5500567</a>
          <a href="">(+94) 0777 443733</a>
          <a href="">(+94) 011 55055210</a>
          <a href="">medicarepharmacy@gmail.com</a>
          <a href="">No:149, Galle Road, Colombo,Sri Lanka.</a>
        </div>

        <div class="box">
          <h3>follow us</h3>
          <a href="">facebook</a>
          <a href="">twitter</a>
          <a href="">instagram</a>
          <a href="">linkedin</a>
        </div>

      </div>
      
      <div class="credit">copyright @ 2023 by <span>medicine</span></span></div>


    </section>

    <!--footer section ends-->

    <!--loader part-->

    
    <!--loader part-->

   

    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

    <!--custom js file link-->
    <script src="js/script.js"></script>

    
    
  </body>
</html>
