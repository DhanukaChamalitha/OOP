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

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>About Us</title>

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
            <a href="home.jsp">home</a>
            <a href="categories.jsp">categories</a>
            <a class="active" href="about us.jsp">about us</a>
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
   

    <!--content section starts-->

    <section class="medicine" id="medicine">
    
    <h3 class="sub-heading">Medicare</h3>
		<h1 class="heading">Abut Us</h1>
      
      

	<div class="box-container">
	
		<div class="box">
	    	<p style="font-size:20px;text-align:left">  Medicare Pharmacy Limited, 
	      a subsidiary of Sunshine Healthcare, 
	      is the 1st branded retail Healthcare Chain in Sri Lanka. 
	      The Company entered the market with a view of creating differentiated 
	      offering and retailing experience to the consumer. The organization, headed by a 
	      team of professionals, has introduced an innovative retail concept centered on exceptional 
	      shopper experience through service, technology, product offering, pricing and a host of value additions. 
	      Through this innovative concept Healthguard has gained market leadership position in Drug Store Retailing with a loyal consumer base.
	      		
	      </p><br>
	     <p style="font-size:20px;text-align:left">Medicare's core tenet has been to be 
	     the standard in healthcare retailing. Centered on this belief,
	      our business model strives to be more just than an ordinary pharmacy in our offerings, 
	      format and solutions. Our view of Healthcare Retailing is not limited to the narrow focus of pharmaceuticals.
	       To us Healthcare Retailing is also about Living Better (Wellness) and Looking Better (Beauty)</p>
	     
	     	<h3 class="sub-heading">Our Vision</h3>
		<p style="font-size:20px">To be the Admired Healthcare Retailer in Sri Lanka.</p>

			<h3 class="sub-heading">Our Mission</h3>
			<p style="font-size:20px">To offer exceptional Pharma, Wellness & Beauty solutions to the Customer and the Community.</p>
	      
	      	
		</div>
		
	</div>

      	        
      	 
      
      
    
  
    </section>
    
    
    

    <!--footer section starts-->

 <%@include file="footer.jsp" %>
  </body>
</html>
