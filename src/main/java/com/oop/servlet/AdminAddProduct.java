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




@WebServlet("/AdminAddProduct")
public class AdminAddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String itemIdStr = request.getParameter("itemId");
		int pid = Integer.parseInt(itemIdStr);
		String pname = request.getParameter("itemName");
		String pcategory = request.getParameter("category");
		String itemPriceStr = request.getParameter("itemPrice");
		double pprice = Double.parseDouble(itemPriceStr);
		String pdescription = request.getParameter("itemdescription");
		String pimage = request.getParameter("itemimage");
		
		RequestDispatcher dispatcher = null;
		Connection con = null; 
		
			
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mlb_wd_g281_online medicine and drugs ordering system", "root", "Dhanuka@78");
			PreparedStatement pst = con.prepareStatement("INSERT INTO products(id,name,category,price,description,image) VALUES (?,?,?,?,?,?) ");
			pst.setInt(1, pid);
			pst.setString(2, pname);
			pst.setString(3, pcategory);
			pst.setDouble(4, pprice);
			pst.setString(5, pdescription);
			pst.setString(6, pimage);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("adminAddProduct.jsp");
			
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

		
		



