<%@page import="java.util.ArrayList"%>
<%@page import="com.oop.dao.ProductDao"%>
<%@page import="com.oop.util.DBConnectionUtil"%>
<%@page import="com.oop.model.*"%>
<%@page import="java.util.List" %>
<%@page import="java.text.DecimalFormat"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<% 
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	if(auth !=null){
		request.setAttribute("auth", auth);
	}
	

	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DBConnectionUtil.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>cart</title>
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
        
            		<a href="Registration.jsp">register</a>
            		
            	<% }%>
            
        </div>
    </header>
    <!-- header section ends -->

   
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
   

    <!-- search form -->


    <form action="" id="search-form">
      <input type="search" placeholder="search here..." name="" id="search-box">
      <label for="search-box" class="fas fa-search"></label>
      <i class="fas fa-times" id="close"></i>
    </form>


    <!-- search form -->

    <!--content starts-->


    <h3 class="sub-heading">Medicare</h3>
    <h1 class="heading">my cart</h1>

    <div class="containt-cart">

      <div style="padding-left: 50px;" class="price">
      <h1>Total Price: $ ${(total>0)?dcf.format(total):0}</h1> 
      <a class="btn" action="CheckOutSerlet">Check out</a></div>

      <table class="table-cart" style="display: inline;justify-content: center;padding-left: 100px;">
        <thead>
          <tr>
            <th style="padding-left: 150px;font-weight: bold;font-size: large;border-bottom: 5px solid var(--black);" scope="col">Name</th>
            <th style="padding-left: 200px;font-weight: bold;font-size: large;border-bottom: 5px solid var(--black);" scope="col">Category</th>
            <th style="padding-left: 200px;font-weight: bold;font-size: large;border-bottom: 5px solid var(--black);" scope="col">Price</th>
            <th style="padding-left: 200px;font-weight: bold;font-size: large;border-bottom: 5px solid var(--black);" scope="col">Buy Now</th>
            <th style="padding-left: 200px;font-weight: bold;font-size: large;border-bottom: 5px solid var(--black);" scope="col">Cancel</th>
            
          </tr>
        </thead>
        <tbody>
        	
        	<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
        			<tr>
                    <td style="padding-left: 20px;font-size: large;"><%= c.getName() %></td>
                    <td style="padding-left: 20px;font-size: large;"><%= c.getCategory() %></td>
                    <td style="padding-left: 50px;font-size: large;"><%= dcf.format(c.getPrice())%></td>
                    <td>

                      <form action="OrderNowServlet" method="post">
                        <input type="hidden" name="id" value="<%= c.getId()%>">
                        <a href="QuntIncDecServlet?action=inc&id=<%= c.getId()%>"><i class="fa-solid fa-plus"></i></a> 
                        <input  style="background: #e6e6e6;text-align:center;font-weight: bold;color=red" id="quantity" type="text" name="qty" value="<%=c.getQuantity()%>" readonly>
                         <a href="QuntIncDecServlet?action=dec&id=<%= c.getId()%>"><i class="fa-solid fa-minus"></i></a>
                          <a href="OrderNowServlet?id=<%= c.getId()%>&quantity=<%=c.getQuantity()%>" class="btn">buy now</a>
                     </form>
                    
                    </td>
                   
                    <td style="text-align:center;" ><a class="btn" href="RemoveFromCartServlet?id=<%=c.getId() %>" >Remove</a></td>
                  </tr>
	
        		<%}
        	}%>
        </tbody>


      </table>

    </div>
    <!--content ends-->

   
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
          <a href="">contact num</a>
          <a href="">contact num</a>
          <a href="">gmail</a>
          <a href="">gmail</a>
          <a href="">adress</a>
        </div>

        <div class="box">
          <h3>follow us</h3>
          <a href="">facebook</a>
          <a href="">twitter</a>
          <a href="">instagram</a>
          <a href="">linkedin</a>
        </div>

      </div>
      
      <div class="credit">copyright @ 2023 by <span>medicine</span></div>


    </section>

    <!--footer section ends-->

    <!--loader part-->

    <div class="loader-container">
      <img src="images/load2.webp" alt="">
    </div>

    <!--loader part-->

   

    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

    <!--custom js file link-->
    <script src="js/script.js"></script>


</body>
</html>