package com.niit.shoppingcart1.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	 @RequestMapping(value = "/")
	    public String init(Model model) {
	        model.addAttribute("msg", "Hello ADMIN");
	        return "admin";
	
}
}
