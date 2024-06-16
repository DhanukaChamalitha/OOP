package com.oop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oop.dao.UserDao;
import com.oop.model.User;
import com.oop.util.DBConnectionUtil;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter() ){
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			UserDao uDao = new UserDao(DBConnectionUtil.getConnection());
			User user = uDao.userLogin(username, password);
			
			if(user != null) {
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("home.jsp");
			}else {
				out.print("User login failed");
			}
			
		}
	}

}
