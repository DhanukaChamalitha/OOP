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
    <title>privacy</title>

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
      <h1 class="heading">Privacy Policy</h1>

	<div class="box-container">
	
		<div class="box">
	    
  <p style="font-size:20px;text-align:left">
   
The new General Data Protection Regulation is one of the biggest changes.
www.medicarepharmacy.lk takes the privacy of its users very seriously and strives to maintain the highest levels of confidentiality and data security at all times. This privacy policy outlines the way in which www.medicarepharmacy.lk collects and uses your personal data. By accessing the www.medicarepharmacy.lk website and using its services, you give your consent to how your data is handled, as described herein.
COLLECTION OF PERSONAL DATA
	1.	Understanding the importance of personal data, medicarepharmacy.lk only collects information that is needed to provide you the best services and products. www.medicarepharmacy.lk does not collect information that is unrelated or cannot enhance its service and product offerings.
	2.	User-specific data such as your name, email address and contact number will be collected by medicarepharmacy.lk during registration.
	3.	Transaction data and payment information such as bank details, account numbers, billing data and other information are also collected in order to process sales and purchases that are made via the website.
	4.	In order to provide a better user experience, medicarepharmacy.lk records the website activity of users and collects certain specifications and preferences when transactions are made via the website.
	5.	Event information of users and potential users – usually names of potential customers and their contact information – are collected at special events.
	6.	Purchase and browsing history of medicarepharmacy.lk users is also recorded to determine statistical information about the website. Such browsing information can include any relevant IP addresses, types of software and other hardware details.
	7.	Business data includes information related to registration, accounts, browsing activity and events. Such data can be referred to as personal data only when they are personally tied to a living individual.
	8.	Certain processes such as website registration require users to provide specific business and personal information, without which they will not be able to make use of medicarepharmacy.lk products and services.
USAGE OF PERSONAL DATA

Personal data provided by you will be used for the following:
	1.	To verify your identity,
	2.	To verify your website registration eligibility,
	3.	To process, maintain and manage website registrations,
	4.	To respond to queries and handle feedback,
	5.	To let buyers and sellers communicate,
	6.	To enhance our service and product offerings,
	7.	To provide you marketing material and updates related to our latest services and products
	8.	For legal purposes.
DISCLOSURE OF PERSONAL DATA
	1.	By accessing the website and using its services, you give your consent to your personal data being given to service providers who are directly involved with medicarepharmacy.lk service and product offerings.
	2.	medicarepharmacy.lk may disclose personal data to law enforcement authorities or legal advisers when necessary.
	3.	Personal data can be accessed by medicarepharmacy.lk employees, service providers and external parties for the above purposes.
	4.	Any voluntary Information provided by users can be made publicly available to other internet users.
	5.	Account information will be shared with banks or vendors in order to process transactions. Though medicarepharmacy.lk does all that it can to protect user data, there is no guarantee that it is safe from the risk of intruders.
	6.	Third parties may also be given personal information for statistical purposes.
	7.	This policy does not apply to any third party websites that uniquepharmacy.lk deals with. Separate privacy policies will be applicable for such websites.
ACCESSING AND CORRECTING PERSONAL DATA
Users have the right to access and change personal information recorded by www.medicarepharmacy.lk. Users who wish to correct or update their personal information may send a correction request via email to info@medicarepharmacy.lk . When required and were permitted by the law, www.medicarepharmacy.lk has the right to charge a fee for additional processing brought on by any data correction requests.
COOKIES
www.medicarepharmacy.lk uses “cookies” to enhance the online shopping experience of users by recording and keeping track of their online activity. These cookies are stored on your computer and are used to track your internet usage pattern. Cookies used by www.medicarepharmacy.lk enable it to:
	1.	Manage registration and account information.
	2.	Collect user statistics.
	3.	Identify user patterns and trends.
	4.	Track user visits and process orders.
	5.	Keep track of progress.
If you wish, you may choose to reject all cookies stored by www.medicarepharmacy.lk. Cookies can be disabled by changing the configuration settings on your browser. However users will have to keep in mind that by doing so, certain features of the website may become unavailable.
AGE RESTRICTIONS
www.medicarepharmacy.lk and its services are intended for individuals above the age of 18 and it does not offer its services to minors. Any personal information of individuals below 18 years of age need to be provided with the consent of the guardian or parent. Parents and guardians are urged to inform www.medicarepharmacy.lk and request the removal of any personal information stored without their consent.
ONLINE SECURITY
www.medicarepharmacy.lk enforces strict security measures to ensure that user data is held secure, up-to-date and safe from unauthorized access. As an additional precaution, users should adopt a few basic security measures for better data security – including signing out of your account, selecting strong passwords and codes during the website registration process. Users will have to keep in mind that data transmission via the internet is never perfectly secure and that www.medicarepharmacy.lk cannot guarantee the security of data during transmission.
Users are also advised to take caution against phishing attacks that target your personal data. Do not respond to any emails that appear to be from www.medicarepharmacy.lk, requesting for your personal data such as your passwords or credit card information www.medicarepharmacy.lk will never request users to provide such information via email.
PRIVACY POLICY CHANGES
www.medicarepharmacy.lk may make changes to this policy at any time and users will be informed of any changes made to it. All changes and updates made to the policy will be immediately effective and by accessing the website or using its services, you agree to be governed by the latest version of the policy.
FEEDBACK
Users are welcome to contact www.medicarepharmacy.lk for more information about its privacy policy or to provide feedback on its products and services. All feedback, queries and responses can be directed to info@medicarepharmacy.lk .
  </p>
	      	
		</div>
		
	</div>

      	        
      	 
      
      
    
  
    </section>
 
 <!--content section ends-->
    <!--content section ends-->

   

    <!--footer section starts-->


    < <%@include file="footer.jsp" %>
  </body>
</html>
      