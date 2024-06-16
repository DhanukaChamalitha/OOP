package com.oop.model;

public class User{
	
	    private int id;
	    private String name;
	    private String email;
	    private String addres;
	    private String contact;
	    private String password;
	    
	    public User() {
	    	
	    }
	    
	    public User(int id, String name, String email,
	    		String contact, String password) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.contact = contact;
		this.password = password;
	    }

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getContact() {
			return contact;
		}

		public void setContact(String contact) {
			this.contact = contact;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getAddres() {
			return addres;
		}

		public void setAddres(String addres) {
			this.addres = addres;
		}

	  
	}

