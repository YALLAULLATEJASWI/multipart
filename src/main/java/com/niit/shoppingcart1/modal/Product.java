package com.niit.shoppingcart1.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="PRODUCT")
@Component
public class Product {
	
@Id
@GeneratedValue
 private int id;
private String name;
private String description;
private double  price;

private int category_id;
private int supplier_id;


@Transient
private MultipartFile image;


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


public String getDescription() {
	return description;
}


public void setDescription(String description) {
	this.description = description;
}


public double getPrice() {
	return price;
}


public void setPrice(double price) {
	this.price = price;
}


public int getCategory_id() {
	return category_id;
}


public void setCategory_id(int category_id) {
	this.category_id = category_id;
}


public int getSupplier_id() {
	return supplier_id;
}


public void setSupplier_id(int supplier_id) {
	this.supplier_id = supplier_id;
}


public MultipartFile getImage() {
	return image;
}


public void setImage(MultipartFile image) {
	this.image = image;

}

}
