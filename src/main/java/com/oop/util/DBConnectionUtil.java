package com.oop.util;



import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnectionUtil {
	
	private static String url = "jdbc:mysql://localhost:3306/mlb_wd_g281_online medicine and drugs ordering system";
	private static String userName = "root";
	private static String password = "Dhanuka@78";
	private static Connection con;

	public static Connection getConnection() {
		
		try {
			if(con == null) {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
			System.out.println("Connected");
			}
		}
		catch (Exception e) {
			System.out.println("Database connection is not success!!!");
		}
		
		return con;
	}
}


