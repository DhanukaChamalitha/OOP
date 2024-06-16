package com.oop.servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/register")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("username");
		String uemail = request.getParameter("useremail");
		String upass = request.getParameter("userpassword");
		String ucontact = request.getParameter("usercontact");
		String uaddress = request.getParameter("useraddres");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
			
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mlb_wd_g281_online medicine and drugs ordering system", "root", "Dhanuka@78");
			PreparedStatement pst = con.prepareStatement("INSERT INTO user(username,useremail,useraddress,usercontact,userpassword) VALUES (?,?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, uaddress);
			pst.setString(4, ucontact);
			pst.setString(5, upass);
			
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("login.jsp");
			
			if(rowCount > 0) {
				
				request.setAttribute("status", "success");
				
				
			}else {
				request.setAttribute("status", "failed");
			}
		
			dispatcher.forward(request, response);
			
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
