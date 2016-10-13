package com.niit.shoppingcart1.DAO;

import java.util.List;

import com.niit.shoppingcart1.modal.Cart;

public interface CartDAO {
	
	
	public List<Cart> list();
	public boolean save(Cart cart);
	public boolean update(Cart cart); 
	public boolean delete(Cart cart);
	
	public Cart get(int id);
	
	public Cart getproduct(int id);
/*	
	public void pay(int userId);
	
	public double CartPrice(int userId);
	
	public long cartsize(int userId);
*/	
}