/*package com.niit.shoppingcart1.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart1.DAO.UserDAO;
import com.niit.shoppingcart1.modal.User;


@Controller
public class UserController {
	@Autowired
	UserDAO userDAO;
	@Autowired
	User user;

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value = "id") int id,
			@RequestParam(value = "password") String password,HttpSession session) {
		ModelAndView mv = new ModelAndView("Home");
		@SuppressWarnings("unused")
		String msg;
		
		if (user == null) {
			msg = "Invalid User";
		}
		if (user.getRole().equals("ROLE_ADMIN")) {
			mv = new ModelAndView("Admin");
		} else {
			session.setAttribute("welcomemsg", user.getUsername());
			session.setAttribute("userId", user.getUserId());
		}
		return mv;
	}
}*/