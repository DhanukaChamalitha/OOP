package com.oop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.dao.OrderDao;
import com.oop.model.Cart;
import com.oop.model.Order;
import com.oop.model.User;
import com.oop.util.DBConnectionUtil;


@WebServlet("/CheckOutSerlet")
public class CheckOutSerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()){
			

			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			 
	         Date date = new Date();
	         
	         //retrive all cart products
	         
	         ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
	         
	         //user authentication
	         User auth = (User) request.getSession().getAttribute("auth");
	         
	         //check auth and cart list
	         
	         if(auth == null && cart_list == null) {
	        	 
	        	 for(Cart c:cart_list) {
	        		 Order order = new Order();
	        		 order.setId(c.getId());
	        		 order.setUid(c.getId());
	        		 order.setQuantity(c.getQuantity());
	        		 order.setDate(formatter.format(date));
	        		 
	        		 OrderDao orderDao = new OrderDao(DBConnectionUtil.getConnection());
	        		 boolean result =  orderDao.insertOrder(order);
	        		 if(!result) {
	        			 break;
	        		 }
	        	 }
	        	 cart_list.clear();
	        	 response.sendRedirect("order.jsp");
	        	 
	         }else {
	        	 response.sendRedirect("cart.jsp");
	         }
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
