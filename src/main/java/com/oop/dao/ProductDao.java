package com.oop.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oop.model.Cart;
import com.oop.model.Product;


public class ProductDao {
	
	private Connection connection;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDao(Connection connection) {
		this.connection = connection;
	}
	
	public List<Product> getAllProducts(){
		
		List<Product> products = new ArrayList<Product>();
		
		try {
			
			query = "SELECT * FROM products";
			pst = this.connection.prepareStatement(query);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setCategory(rs.getString("category"));
				row.setPrice(rs.getDouble("price"));
				row.setDescription(rs.getString("description"));
				row.setImage(rs.getString("image"));
				
				products.add(row);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> products = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.connection.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }
	
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "SELECT price FROM products WHERE id=?";
                    pst = this.connection.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
    
    public Product getSingleProduct(int id) {
		 Product box = null;
	        try {
	            query = "SELECT * FROM products WHERE id=? ";

	            pst = this.connection.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	box = new Product();
	            	box.setId(rs.getInt("id"));
	            	box.setName(rs.getString("name"));
	            	box.setCategory(rs.getString("category"));
	            	box.setPrice(rs.getDouble("price"));
	            	box.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return box;
	    }
    
    public Product addProduct(String productName) {
    	
    	Product product = null;
    		
    		try {
    			
    			query = "INSERT INTO product(name,category,price,description) VALUES (?,?,?,?) ";
    			
    			pst = this.connection.prepareStatement(query);
    			
    			rs = pst.executeQuery();
    			
    			
    		}catch (Exception e) {
    			e.printStackTrace();
    			System.out.println(e.getMessage());
    		}
    		
    		return product;
    		
    	}
    
    public Product deleteProduct(String productName) {
    	
    	Product product = null;
    	
   

    		try {
    			query = "DELETE * products WHERE id=?";
    			
    			pst = this.connection.prepareStatement(query);
    			
    			rs = pst.executeQuery();
    			
    			
    		}catch (Exception e) {
    			e.printStackTrace();
    			System.out.println(e.getMessage());
    		}
    		
    		return product;
    		
    	}
    
    
    
    
}
 
