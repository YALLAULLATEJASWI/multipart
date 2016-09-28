package com.niit.shoppingcart1.DAO;

import java.util.List;

import com.niit.shoppingcart1.modal.Category;

public interface CategoryDAO {
	
	public boolean saveOrUpdate(Category category);
	public boolean delete(Category category);
	public Category get(int id);
	public List <Category> list();
}
