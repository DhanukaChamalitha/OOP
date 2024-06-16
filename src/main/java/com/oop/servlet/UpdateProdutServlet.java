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


@WebServlet("/UpdateProdutServlet")
public class UpdateProdutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
 

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("adminupdateProduct.jsp");
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	response.setContentType("text/html;charset=UTF-8");
  
    	String itemIdStr = request.getParameter("itemId");
		int pid = Integer.parseInt(itemIdStr);
		String pname = request.getParameter("itemName");
		String pcategory= request.getParameter("category"); 
		String ppriceStr = request.getParameter("itemPrice"); 
		double pprice = Double.parseDouble(ppriceStr);
		String pdescription = request.getParameter("itemdescription"); 
		String pimage = request.getParameter("itemimage"); 
		
		
		Connection con = null; 
		
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mlb_wd_g281_online medicine and drugs ordering system", "root", "Dhanuka@78");
		
			PreparedStatement pst = con.prepareStatement("UPDATE products SET id=?,name = ?, category = ?, price = ?, description = ? WHERE id='"+pid+"'");
			
			pst.setInt(1, pid);
			pst.setString(2, pname);
			pst.setString(3, pcategory);
			pst.setDouble(4, pprice);
			pst.setString(5, pdescription);
			
			
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

	