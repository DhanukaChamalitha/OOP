package com.oop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.oop.model.User;

public class UserDao {
	
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public UserDao(Connection connection) {
	
		this.connection = connection;
	}
	
	public User userLogin(String username,String userpassword) {
		
		User user = null;
		
		try {
			
			query = "SELECT * FROM user WHERE username=? AND userpassword=? AND usertype = 'user'";
			
			pst = this.connection.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, userpassword);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("username"));
				user.setEmail(rs.getString("useremail"));
				user.setAddres(rs.getString("useraddress"));
				user.setContact(rs.getString("usercontact"));
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return user;
		
	}
	
	public User userRegistration(String username,String userpassword) {
		
		User user = null;
		
		try {
			
			query = "SELECT * FROM user WHERE username=? AND userpassword=? AND usertype = 'user'";
			
			pst = this.connection.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, userpassword);
			
			rs = pst.executeQuery();
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return user;
		
	}
	
	
	
	

}
