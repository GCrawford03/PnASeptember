package com.garrett.shopofholding.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.garrett.shopofholding.models.Characters;
import com.garrett.shopofholding.services.CharacterService;
import com.garrett.shopofholding.services.UserService;

@Controller
public class CharacterController {
	
	@Autowired
	private CharacterService cService;
	
	@Autowired 
	private UserService uService;
	
	@GetMapping("/home")
	public String dashboard(Model viewModel, HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		if(userId == null)
			return"redirect:/";
		
		List<Characters> characters = this.cService.getCharacter();
		viewModel.addAttribute("user", this.uService.findById(userId));
		viewModel.addAttribute("characters", characters);
		return "dashboard.jsp";
	}
	
	@GetMapping("/character/new")
	private String newCharacter(@ModelAttribute("character") Characters character, HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user_id");
		if(userId == null)
			return"redirect:/";
		viewModel.addAttribute("user", this.uService.findById(userId));
		return "newcharacter.jsp";
	}
	
	@PostMapping("/character/new")
	private String create(@Valid @ModelAttribute("character") Characters character, HttpSession session, BindingResult result, Model viewModel) {
		if(result.hasErrors()) {
			Long userId = (Long)session.getAttribute("user_id");
			viewModel.addAttribute("user", this.uService.findById(userId));
			return "newcharacter.jsp";
		}
			this.cService.create(character);
			return "redirect:/home";
	}

}
