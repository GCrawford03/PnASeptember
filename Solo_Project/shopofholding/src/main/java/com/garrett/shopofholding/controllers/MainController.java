package com.garrett.shopofholding.controllers;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.garrett.shopofholding.models.User;
import com.garrett.shopofholding.services.UserService;
import com.garrett.shopofholding.validators.UserValidator;

@Controller
public class MainController {
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private UserValidator uValid;
	
	
	@RequestMapping("/")
	public String index(@ModelAttribute("user") User user) {
		return "index.jsp";
	}
	
	@RequestMapping("/register")
	public String registerPage(@ModelAttribute("user") User user) {
		return "register.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("user") User newUser, BindingResult result, HttpSession session) {
		uValid.validate(newUser, result);
		if(result.hasErrors()) {
			return "register.jsp";
		}
		User user = this.uService.registerUser(newUser);
		session.setAttribute("user_id", user.getId());
		return "redirect:home";
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password, RedirectAttributes redirectAtts, HttpSession session) {
		if(!this.uService.authenticateUser(email, password)) {
			redirectAtts.addFlashAttribute("loginError", "Invalid Credentials");
			return "redirect:/";
		}
		User user = this.uService.getByEmail(email);
		session.setAttribute("user_id", user.getId());
		return "redirect:home";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
