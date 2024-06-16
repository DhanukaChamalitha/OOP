package com.oop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import com.oop.model.Admin;



public class AdminDao {
	
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public AdminDao(Connection connection) {
	
		this.connection = connection;
	}
	
	public Admin adminLogin(String username,String userpassword) {
		
		Admin admin = null;
		
		try {
			
			query = "SELECT * FROM user WHERE username=? AND userpassword=? AND usertype = 'admin'";
			
			pst = this.connection.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, userpassword);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				
				admin = new Admin();
				admin.setId(rs.getInt("id"));
				admin.setName(rs.getString("username"));
				admin.setEmail(rs.getString("useremail"));
				admin.setAddres(rs.getString("useraddress"));
				admin.setContact(rs.getString("usercontact"));
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return admin;
		
	}

	public Admin displayDetails(int id){
		
		Admin admin= new Admin();
		
		try {
			
			query = "SELECT * FROM user WHERE id=1";
			pst = this.connection.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();

			while(rs.next()) {
				
				admin = new Admin();
				id = rs.getInt("id");
						
				admin.setId(id);
				admin.setName(admin.getName());
				admin.setAddres(admin.getAddres());
				admin.setEmail(admin.getEmail());
				admin.setPassword(admin.getPassword());
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		
		return admin;
	}
	
	public boolean updateAdminDetails(Admin admin) {
		
		boolean rowUpdated = false;
		
		try {
			
			query = "Update * FROM user WHERE id=1";
			pst = this.connection.prepareStatement(query);
			
			rowUpdated = pst.executeUpdate()>0;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return rowUpdated;
		
	}
	
	
}
	

