package com.niit.shoppingcart1.DAO;

import java.util.List;

import com.niit.shoppingcart1.modal.Product;


public interface ProductDAO {
	
	public boolean saveOrUpdate(Product product);
	public boolean delete(Product product);
	public Product get(int id);
	public List<Product> list();
	public List<Product>getproduct(int id);

}
