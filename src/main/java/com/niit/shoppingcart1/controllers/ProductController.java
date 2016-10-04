package com.niit.shoppingcart1.controllers;



import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart1.DAO.CategoryDAO;
import com.niit.shoppingcart1.DAO.ProductDAO;
import com.niit.shoppingcart1.DAO.SupplierDAO;
import com.niit.shoppingcart1.modal.Product;

@Controller
public class ProductController {


		@Autowired
	 private ProductDAO productDAO;
		
		@Autowired
		private CategoryDAO categoryDAO;
		
		@Autowired
		private SupplierDAO supplierDAO;
		
		private Path path;
		
		@RequestMapping(value="/Product",method = RequestMethod.GET)
		public ModelAndView productlandPage(@ModelAttribute("product")Product product,BindingResult result,Model model)
		{
			ModelAndView mv=new ModelAndView("/Product");
			mv.addObject("userclickedproduct", "true");
			mv.addObject("allproduct",productDAO.list());
			mv.addObject("allcategory",categoryDAO.list());
			mv.addObject("allsupplier",supplierDAO.list());
			return mv;
			
		}
		 
		/*@RequestMapping(value="/allData")
		public String getAllData(@ModelAttribute("product")Product product,BindingResult result,Model model)
		{
		
			model.addAttribute("allData",productDAO.list());
			return "Product";
		}*/

		@RequestMapping(value="/addProduct",method = RequestMethod.POST)
		public String addProduct(@ModelAttribute("product") Product product,RedirectAttributes redirectAttributes, Model model,HttpServletRequest request, MultipartFile file) throws IOException
		{
			//redirectAttributes.addAttribute("product", product);
			 this.productDAO.saveOrUpdate(product);
		    		System.out.println("Data Inserted");
		      		MultipartFile image = product.getImage();
		            String root = request.getSession().getServletContext().getRealPath("/");
		            path = Paths.get(root+"\\resources\\images\\product\\"+product.getId()+".jpg");
		            System.out.println("Path="+path);
		            System.out.println("File name = " + product.getImage().getOriginalFilename());
		          
		           if(image!=null && !image.isEmpty()){
		            
		            	try
		            	{
		            		image.transferTo(new File(path.toString()));
		            		System.out.println("Image saved  in:"+path.toString());
		            	}
		            	catch(Exception e)
		            	{
		            		e.printStackTrace();
		            		System.out.println("Image not saved");
		            	}
		           }
		    	
		            return "redirect:/Product";
					
			
}
		@RequestMapping(value="/ItemByproduct/{id}")
		public String editItem(@PathVariable("id") int id,RedirectAttributes redirectAttributes)
		{
			redirectAttributes.addFlashAttribute("product", productDAO.get(id));
			return "redirect:/Product";
			
			
	}
		@RequestMapping(value="/deleteproduct/{id}")
		public String deleteItem(@PathVariable("id") int id,Product product)
		{
			productDAO.delete(product);
			return "redirect:/Product";
			
	}
	}