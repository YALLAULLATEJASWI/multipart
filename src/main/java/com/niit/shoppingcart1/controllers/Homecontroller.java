package com.niit.shoppingcart1.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart1.DAO.CategoryDAO;
import com.niit.shoppingcart1.DAO.ProductDAO;
import com.niit.shoppingcart1.modal.Product;

@Controller
public class Homecontroller {
 
 @Autowired
 ProductDAO productDAO;
 
 @Autowired
 CategoryDAO categoryDAO;
    
 
@RequestMapping(value={"/Home"})
public String homepage(Model m){
 m.addAttribute("userclickedhome", "true");
 m.addAttribute("product",new Product());
 m.addAttribute("allcategory", categoryDAO.list());
 m.addAttribute("allproduct",productDAO.list());
 
 return "Home";
}
@RequestMapping(value ="ShowProduct/{id}" )
public String ShowProduct(@PathVariable("id") int id,RedirectAttributes attributes,Model m) {
m.addAttribute("Clickedshowproduct", "true");
 m.addAttribute("IndividualProduct", productDAO.getproduct(id));
 return "ShowProduct";
}
}