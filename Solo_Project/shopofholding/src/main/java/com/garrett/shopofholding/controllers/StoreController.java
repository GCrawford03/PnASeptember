package com.garrett.shopofholding.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.garrett.shopofholding.models.Store;
import com.garrett.shopofholding.services.CharacterService;
import com.garrett.shopofholding.services.StoreService;
import com.garrett.shopofholding.services.UserService;

@Controller
@RequestMapping("/shop")
public class StoreController {
	
	
	@Autowired 
	private UserService uService;
	
	@Autowired
	private StoreService sService;
	
	@Autowired
	private CharacterService cService;
	
	
	@GetMapping("/{id}")
	public String characterShop(Model viewModel, HttpSession session, @PathVariable("id") Long charId, String keyword) {
	Long userId = (Long)session.getAttribute("user_id");
	if(userId == null)
		return"redirect:/";
	
	List<Store> stores = this.sService.getStore();
	viewModel.addAttribute("user", this.uService.findById(userId));
	viewModel.addAttribute("characters", this.cService.findById(charId));
	if(keyword != null) {
		viewModel.addAttribute("stores", sService.findByKeyword(keyword));
	}
	else {
	viewModel.addAttribute("stores", stores);
	}
	return "store.jsp";
	}
}
