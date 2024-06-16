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

@WebServlet("/AdminUpdateDetails")
public class AdminUpdateDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("updateProfile.jsp");
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	response.setContentType("text/html;charset=UTF-8");
  
    	String itemIdStr = request.getParameter("adminId");
		int id = Integer.parseInt(itemIdStr);
		String name = request.getParameter("adminName");
		String email = request.getParameter("adminEmail"); 
		String address = request.getParameter("adminAddress"); 
		String contact = request.getParameter("adminContact"); 
		String password = request.getParameter("adminPassword"); 
		
		
		Connection con = null; 
		
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mlb_wd_g281_online medicine and drugs ordering system", "root", "Dhanuka@78");
			PreparedStatement pst = con.prepareStatement("UPDATE user SET id = ?, username = ?, useremail = ?, useraddress = ?, usercontact = ?, userpassword = ? WHERE id = 1");
			
			pst.setInt(1, id);
			pst.setString(2, name);
			pst.setString(3, email);
			pst.setString(4, address);
			pst.setString(5, contact);
			pst.setString(6, password);
			
			int rowCount = pst.executeUpdate();
		
			
			if(rowCount > 0) {
				
				request.setAttribute("status", "success");
				response.sendRedirect("adminProfile.jsp");
				
				
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

	

