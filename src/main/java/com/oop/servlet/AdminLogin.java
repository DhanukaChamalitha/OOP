package com.oop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.dao.AdminDao;

import com.oop.model.Admin;

import com.oop.util.DBConnectionUtil;



@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("adminLogin.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter() ){
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			AdminDao uDao = new AdminDao(DBConnectionUtil.getConnection());
			Admin admin = uDao.adminLogin(username, password);
			
			if(admin != null) {
				request.getSession().setAttribute("auth", admin);
				response.sendRedirect("admin.jsp");
			}else {
				out.print("Admin login failed");
			}
	
			
		}
	}
}


