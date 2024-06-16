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


@WebServlet("/UpdateUserProfileServlet")
public class UpdateUserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("updateProfile.jsp");
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	response.setContentType("text/html;charset=UTF-8");
  
    	String uIdStr = request.getParameter("uid");
		int uid = Integer.parseInt(uIdStr);
		String uname = request.getParameter("ueame");
		String uemail = request.getParameter("uemail"); 
		String uaddress = request.getParameter("uaddress"); 
		String ucontact = request.getParameter("ucontact"); 
		String upassword = request.getParameter("upassword"); 
		
		
		Connection con = null; 
		
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mlb_wd_g281_online medicine and drugs ordering system", "root", "Dhanuka@78");
			PreparedStatement pst = con.prepareStatement("UPDATE user SET id=?, username = ?, useremail = ?, useraddress = ?, usercontact = ?, userpassword = ? WHERE id='"+uid+"'");
			
			pst.setInt(1, uid);
			pst.setString(2, uname);
			pst.setString(3, uemail);
			pst.setString(4, uaddress);
			pst.setString(5, ucontact);
			pst.setString(6, upassword);
			
			int rowCount = pst.executeUpdate();
		
			
			if(rowCount > 0) {
				
				request.setAttribute("status", "success");
				response.sendRedirect("userProfile.jsp");
				
				
			}else {
				request.setAttribute("status", "failed");
				response.sendRedirect("updateUserProfile.jsp");
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

	

