<%@page import="com.oop.dao.ProductDao"%>
<%@page import="com.oop.util.DBConnectionUtil"%>
<%@page import="com.oop.model.*"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 

	User auth = (User) request.getSession().getAttribute("auth");
	if(auth !=null){
		request.setAttribute("auth", auth);
	}
	else{
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


    <!-- header section starts -->
    <header>
        <a href="home.jsp" class="logo"> <i class="fa-sharp fa-solid fa-house-chimney-medical"></i>Medicare</a>

        <nav class="navbar">
            <a class="active" href="home.jsp">home</a>
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
           	 	
                	<a style="padding:10px" href="Logout">logout</a>
           	 		
            	<% }else{%>
        
            		<a href="Registration.jsp">register</a>
            		
            	<% }%>
            
        </div>
    </header>
    <!-- header section ends -->

    <!-- search form -->


    <form action="" id="search-form">
      <input type="search" placeholder="search here..." name="" id="search-box">
      <label for="search-box" class="fas fa-search"></label>
      <i class="fas fa-times" id="close"></i>
    </form>


    <!-- search form -->

    <!-- home section starts -->
    
    <section class="home" id="home">

      <div class="swiper mySwiper home-slider">

        <div class="swiper-wrapper wrapper">

          <div class="swiper-slide slide">

            <div class="content">

              <span>Medicare</span>
              <h3>Diabetes</h3>
              <p>Normal blood sugar levels differ from person to person, but a normal 
              range for fasting blood sugar levels is between 70 to 100 mg/dL. Generally,
               the level of glucose in the blood rises after meals and reached between 135 and 140 milligrams per deciliter. 
               Both before and after meals, these variations in blood-sugar levels are normal. It reflects the way 
               that glucose is absorbed and stored in the body. If your blood sugar level 
              is 135 in the morning before eating anything, you must consult a healthcare professional</p>
               
            </div>

            <div class="image">
              <img src="images/diabetes.webp" alt="">
            </div>


          </div>

          
          <div class="swiper-slide slide">

            <div class="content">

              <span>Medicare</span>
              <h3>Heart</h3>
              <p>High blood pressure, also known as hypertension, 
              is a condition characterized by excessive blood pressure against arteries, causing symptoms like fatigue and headache, 
              but most are symptomless.
			If you are experiencing new, severe, or persistent symptoms, it is important to contact a healthcare provider immediately.</p>
               
            </div>

            <div class="image">
              <img src="images/heart high blood preasure.jpeg.jpg" alt="">
            </div>


          </div>

          
          <div class="swiper-slide slide">

            <div class="content">

              <span>Medicare</span>
              <h3>Eye</h3>
              <p>The human eye is a sensory organ, part of the sensory nervous system, that reacts to visible 
              light and allows humans to use visual information for various purposes including seeing things, keeping balance, 
              and maintaining circadian rhythm.</p>
               
            </div>

            <div class="image">
              <img src="images/eye.jpg" alt="">
            </div>


          </div>

          
          <div class="swiper-slide slide">

            <div class="content">

              <span>Medicare</span>
              <h3>Wheezing</h3>
              <p>Wheezing is a high pitched whistling sound that occurs during breathing when the airways are narrowed. 
              Commonly the sound is more prominent when you breathe out than when you breathe in (although not always). 
              The sound is caused by air that is forced through airways that are narrower than normal</p>
               
            </div>

            <div class="image">
              <img src="images/Wheezing.jpg" alt="">
            </div>

          </div>

        </div>

        <div class="swiper-pagination"></div>

      </div>

    </section>

    <!-- home section ends -->
   
   
    <!--medicine section starts-->

    <section class="medicine" id="medicine">

      <h3 class="sub-heading">Medicare</h3>
      <h1 class="heading">New Items</h1>

      	<div class="box-container">
      	<%
      		if(!products.isEmpty()){
      			for(Product p:products){%>
      			
				
				<div class="box">
				
      	          <a href="" class="fas fa-eye"></a>
      	         	<img src="images/image1.jpeg" alt="">
      	          <h3><%= p.getName() %></h3>
      	          <div class="stars">
      	            <i class="fas fa-star"></i>
      	            <i class="fas fa-star"></i>
      	            <i class="fas fa-star"></i>
      	            <i class="fas fa-star"></i>
      	            <i class="fas fa-star-half-alt"></i>
      	          </div>
      	          <h2><%= p.getCategory()%></h2>
      	          <p><%= p.getDescription()%></p>
      	          <p><span>$<%= p.getPrice() %></span></p>
      	       
      	          <a href="AddToCartServlet?id=<%= p.getId()%>" class="btn">add to cart</a>
      	          
				
      	        
      	        </div>
      	        
      			<%} 
      		}
      	%>
      	
      	
      </div>
      
 
    </section>
    
    <!--medicine section ends-->
    
    

   <!--about section starts-->

    <section class="about" id="about">

      <h3 class="sub-heading">about us</h3>
      <h1 class="heading">why choose us?</h1>

      <div class="row">

        <div class="image">
          <img src="images/images.jpeg" alt="">
        </div>
        <div class="content">
          <h3>Medicare</h3>
          <p>Medicare Pharmacy Limited, 
	      a subsidiary of Sunshine Healthcare, 
	      is the 1st branded retail Healthcare Chain in Sri Lanka. </p>
          <div class="icons-container">
            <div class="icons">
              <i class="fas fa-shipping-fast"></i>
              <span>free delivery</span>
          </div>
          <div class="icons">
            <i class="fas fa-dollar-sign"></i>
            <span>easy payment</span>
          </div>
          <div class="icons">
            <i class="fas fa-headset"></i>
            <span>24/7 service</span>
          </div>
            <a href="about us.jsp" class="btn">learn more</a>
        </div>

      </div>
	</div>
    </section>
    
    <!--about section ends-->
    
    <%@include file="footer.jsp" %>
  </body>
</html>
      