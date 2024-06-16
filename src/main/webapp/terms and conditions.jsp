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
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>terms</title>

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
        <a href="home.html" class="logo"> <i class="fa-sharp fa-solid fa-house-chimney-medical"></i>Medicare</a>
       

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
      
     <h1 class="heading">Terms & Conditions</h1>

	<div class="box-container">
	
		<div class="box">
	    
  <p style="font-size:20px;text-align:left">
    In General
    Medicare Pharmacy Limited (“www.Medicare.lk”) owns and operate this Website. This document governs your relationship
    with www.Medicare.lk (“Website”). Access to and use of this Website and the products and services available through
    this Website (collectively, the "Services") are subject to the following terms, conditions and notices (the "Terms
    of Service"). By using the Services, you are agreeing to all of the Terms of Service, as may be updated by us from
    time to time. You should check this page regularly to take notice of any changes we may have made to the Terms of
    Service.

    Access to this Website is permitted on a temporary basis, and we reserve the right to withdraw or amend the Services
    without notice. We will not be liable if for any reason this Website is unavailable at any time or for any period.
    From time to time, we may restrict access to some parts or all of this Website.

    This Website may contain links to other websites (the "Linked Sites"), which are not operated by www.Medicare.lk.
    www.Medicare.lk has no control over the Linked Sites and accepts no responsibility for them or for any loss or
    damage that may arise from your use of them. Your use of the Linked Sites will be subject to the terms of use and
    service contained within each such site.

    Privacy Policy
    Our privacy policy, which sets out how we will use your information, can be found at [Privacy Policy]. By using this
    Website, you consent to the processing described therein and warrant that all data provided by you is accurate.

    Prohibitions
    You must not misuse this Website. You will not: commit or encourage a criminal offense; transmit or distribute a
    virus, trojan, worm, logic bomb or any other material which is malicious, technologically harmful, in breach of
    confidence or in any way offensive or obscene; hack into any aspect of the Service; corrupt data; cause annoyance to
    other users; infringe upon the rights of any other person's proprietary rights; send any unsolicited advertising or
    promotional material, commonly referred to as "spam"; or attempt to affect the performance or functionality of any
    computer facilities of or accessed through this Website. Breaching this provision would constitute a criminal
    offense and www.healthguard.lk will report any such breach to the relevant law enforcement authorities and disclose
    your identity to them.

    We will not be liable for any loss or damage caused by a distributed denial-of-service attack, viruses or other
    technologically harmful material that may infect your computer equipment, computer programs, data or other
    proprietary material due to your use of this Website or to your downloading of any material posted on it, or on any
    website linked to it.

    Intellectual Property, Software and Content
    The intellectual property rights in all software and content (including photographic images) made available to you
    on or through this Website remains the property of www.Medicare.lk or its licensors and are protected by copyright
    laws and treaties around the world. All such rights are reserved by www.Medicare.lk and its licensors. You may
    store, print and display the content supplied solely for your own personal use. You are not permitted to publish,
    manipulate, distribute or otherwise reproduce, in any format, any of the content or copies of the content supplied
    to you or which appears on this Website nor may you use any such content in connection with any business or
    commercial enterprise.

    Terms of Sale
    By placing an order you are offering to purchase a product on and subject to the following terms and conditions. All
    orders are subject to availability and confirmation of the order price.

    Dispatch times may vary according to availability and subject to any delays resulting from postal delays or force
    majeure for which we will not be responsible.

    In order to contract with www.healthguard.lk you must be over 18 years of age and possess a valid credit or debit
    card issued by a bank acceptable to us. www.Medicare.lk retains the right to refuse any request made by you. If your
    order is accepted we will inform you by email and we will confirm the identity of the party which you have
    contracted with. This will usually be www.Medicare.lk or may in some cases be a third party. Where a contract is
    made with a third party www.Medicare.lk is not acting as either agent or principal and the contract is made between
    yourself and that third party and will be subject to the terms of sale which they supply you. When placing an order
    you undertake that all details you provide to us are true and accurate, that you are an authorized user of the
    credit or debit card used to place your order and that there are sufficient funds to cover the cost of the goods.
    The cost of foreign products and services may fluctuate. All prices advertised are subject to such changes.

    (a) Our Contract
    When you place an order, you will receive an acknowledgment e-mail confirming receipt of your order. A contract
    between us will be formed until when this e-mail is sent. Only those goods listed in the confirmation e-mail will be
    included in the contract formed.

    (b) Pricing and Availability
    Whilst we try and ensure that all details, descriptions, and prices that appear on this Website are accurate, errors
    may occur. If we discover an error in the price of any goods which you have ordered we will inform you of this as
    soon as possible and give you the option of reconfirming your order at the correct price or canceling it. If we are
    unable to contact you we will treat the order as cancelled. If you cancel and you have already paid for the goods,
    you will receive a full refund.

    Delivery costs will be charged in addition; such additional charges are clearly displayed where applicable and
    included in the 'Total Cost'.

    (c) Payment
    Upon receiving your order we carry out a standard authorization check on your payment card to ensure there are
    sufficient funds to fulfill the transaction. Your card will be debited upon authorization being received. The monies
    received upon the debiting of your card shall be treated as payment against the value of the goods you purchased.

    Disclaimer of Liability
    The material displayed on this Website is provided without any guarantees, conditions, or warranties as to its
    accuracy. Unless expressly stated to the contrary to the fullest extent permitted by law www.Medicare.lk and its
    suppliers, content providers, and advertisers hereby expressly exclude all conditions, warranties and other terms
    which might otherwise be implied by statute, common law, or the law of equity and shall not be liable for any
    damages whatsoever, including but without limitation to any direct, indirect, special, consequential, punitive or
    incidental damages, or damages for loss of use, profits, data or other intangibles, damage to goodwill or
    reputation, or the cost of procurement of substitute goods and services, arising out of or related to the use,
    inability to use, performance or failures of this Website or the Linked Sites and any materials posted thereon,
    irrespective of whether such damages were foreseeable or arise in contract, tort, equity, restitution, by statute,
    at common law or otherwise. This does not affect www.Medicare.lk 's liability for death or personal injury arising
    from its negligence, fraudulent misrepresentation, misrepresentation as to a fundamental matter, or any other
    liability that cannot be excluded or limited under applicable law.

    Linking to this Website
    You may link to our home page, provided you do so in a way that is fair and legal and does not damage our reputation
    or take advantage of it, but you must not establish a link in such a way as to suggest any form of association,
    approval or endorsement on our part where none exists. You must not establish a link from any website that is not
    owned by you. This Website must not be framed on any other site, nor may you create a link to any part of this
    Website other than the home page. We reserve the right to withdraw linking permission without notice.

    Disclaimer as to ownership of trademarks, images of personalities and third party copyright

    Except where expressly stated to the contrary all persons (including their names and images), third-party trademarks
    and content, services, and/or locations featured on this Website are in no way associated, linked, or affiliated
    with www.Medicare.lk and you should not rely on the existence of such a connection or affiliation. Any
    trademarks/names featured on this Website are owned by the respective trademark owners. Where a trademark or brand
    name is referred to it is used solely to describe or identify the products and services and is in no way an
    assertion that such products or services are endorsed by or connected to www.Medicare.lk.

    Indemnity
    You agree to indemnify, defend, and hold harmless www.Medicare.lk, its directors, officers, employees, consultants,
    agents, and affiliates, from any and all third-party claims, liability, damages, and/or costs (including, but not
    limited to, legal fees) arising from your use this Website or your breach of the Terms of Service.

    Variation
    www.Medicare.lk shall have the right in its absolute discretion at any time and without notice to amend, remove, or
    vary the Services and/or any page of this Website.

    Invalidity
    If any part of the Terms of Service is unenforceable (including any provision in which we exclude our liability to
    you) the enforceability of any other part of the Terms of Service will not be affected by all other clauses
    remaining in full force and effect. So far as possible where any clause/sub-clause or part of a clause/sub-clause
    can be severed to render the remaining part valid, the clause shall be interpreted accordingly. Alternatively, you
    agree that the clause shall be rectified and interpreted in such a way that closely resembles the original meaning
    of the clause /sub-clause as is permitted by law.

    Complaints
    We operate a complaints handling procedure which we will use to try to resolve disputes when they first arise,
    please let us know if you have any complaints or comments.

    Waiver
    If you breach these conditions and we take no action, we will still be entitled to use our rights and remedies in
    any other situation where you breach these conditions.

    Transaction/Personal Data
    Your personal information is stored on the Medicare Pharmacy Ltd. server but is only available to Medicare Pharmacy
    Ltd. Medicare Pharmacy Ltd. does not store any credit card information. We will not, under any circumstances, supply
    your personal information to a third party unless required to do so for legal reasons.

    Entire Agreement
    The above Terms of Service constitute the entire agreement of the parties and supersede any and all preceding and
    contemporaneous agreements between you and www.Medicare.lk. Any waiver of any provision of the Terms of Service will
    be effective only if in writing and signed by a Director of www.Medicare.lk.

    Contacting Us
    For any dispute complaint or query regarding this User Agreement or Terms and Conditions stated herein please
    contact;

    Medicare Pharmacy Limited
    No 167/A,
    Soyza Road,
    Colombo 02
    Sri Lanka
    Web: www.Medicare.lk
    Email: onlinestore@sunshineholdings.lk
    Contact Number: +94 7743 97 111
  </p>
	      	
		</div>
		
	</div>

      	   
    </section>
 
 <!--content section ends-->
    <!--footer section starts-->

 <%@include file="footer.jsp" %>
  </body>
</html>
      