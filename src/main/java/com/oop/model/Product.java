package com.oop.model;

public class Product {
	
	private int id;
	private String name;
	private String category;
	private double price;
	private String image;
	private String description;
	
	
	public Product() {
		
	}
	
	public Product(int id, String name, String category, double price, String image, String description) {
		
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.image = image;
		this.description = description;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image="
				+ image + ", description=" + description + "]";
	}
	

}
