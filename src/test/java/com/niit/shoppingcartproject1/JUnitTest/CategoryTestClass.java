/*package com.niit.shoppingcartproject1.JUnitTest;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.shoppingcart1.DAO.CategoryDAO;
import com.niit.shoppingcart1.modal.Category;

public class CategoryTestClass {

	@Autowired
	AnnotationConfigApplicationContext context;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	Category category;
	
	@Before
	public void init()
	{
		context =new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		category = (Category)context.getBean("category");
		categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
	}
	
	@Test
	public void createCategoryTestCase()
	{
		category.setId("LAP_l01");
		category.setName("Dell");
		category.setDescription("Dell Laptop");
		
		Assert.assertEquals("hello", true, categoryDAO.saveorupdate(category));
		
		//Assert.assertEquals("Create Category", true,categoryDAO.saveorupdate(category));
		
	}
	@Test
	public void listCategoryTestCase()
	{
	Assert.assertEquals("List Category", 3,categoryDAO.list().size());
}
}
*/