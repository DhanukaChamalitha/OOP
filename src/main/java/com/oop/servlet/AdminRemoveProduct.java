package com.oop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminRemoveProduct")
public class AdminRemoveProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
	    	response.setContentType("text/html;charset=UTF-8");
	  
	    	String proIdStr = request.getParameter("proId");
			int pid = Integer.parseInt(proIdStr);
		
			
			Connection con = null; 
			
			try {

				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mlb_wd_g281_online medicine and drugs ordering system", "root", "Dhanuka@78");
			
				
				PreparedStatement pst = con.prepareStatement("DELETE FROM products WHERE id='"+pid+"'");
		
				int rowCount = pst.executeUpdate();
			
				
				if(rowCount > 0) {
					
					request.setAttribute("status", "success");
					response.sendRedirect("adminAddProduct.jsp");
					
					
				}else {
					request.setAttribute("status", "failed");
				}
			
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}
		}
			
} 	


