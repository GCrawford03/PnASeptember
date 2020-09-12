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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.garrett.shopofholding.models.Characters;
import com.garrett.shopofholding.models.Store;
import com.garrett.shopofholding.services.CharacterService;
import com.garrett.shopofholding.services.StoreService;
import com.garrett.shopofholding.services.UserService;

@Controller
public class CharacterController {
	
	@Autowired
	private CharacterService cService;
	
	@Autowired 
	private UserService uService;
	
	@Autowired
	private StoreService sService;
	
	
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
	
	@GetMapping("/new")
	private String newCharacter(@ModelAttribute("character") Characters character, HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user_id");
		if(userId == null)
			return"redirect:/";
		viewModel.addAttribute("user", this.uService.findById(userId));
		return "newcharacter.jsp";
	}
	
	@PostMapping("/new")
	private String create(@Valid @ModelAttribute("character") Characters character, HttpSession session, BindingResult result, Model viewModel) {
		if(result.hasErrors()) {
			Long userId = (Long)session.getAttribute("user_id");
			viewModel.addAttribute("user", this.uService.findById(userId));
			return "newcharacter.jsp";
		}
			this.cService.create(character);
			return "redirect:/home";
	}
	
	@GetMapping("/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		this.cService.delete(id);
		return "redirect:/home";
	}
	
	@GetMapping("/{id}")
	public String edit(@PathVariable("id") Long id, HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user_id");
		if(userId == null) {
			return "redirect:/";
		} else {
			Characters character = this.cService.findById(id);
			viewModel.addAttribute("character", character);
			viewModel.addAttribute("user", this.uService.findById(userId));
			return "edit.jsp";
		}
	}
	
	@RequestMapping(value = "/{id}", method=RequestMethod.PUT)
	public String update(@Valid @RequestParam("name") String name, @RequestParam("strengthScore") int strengthScore, @RequestParam("charClass") String charClass, @RequestParam("id") Long charId) {
//		Long userId = (Long)session.getAttribute("user_id");
//		if(result.hasErrors()) {
//			viewModel.addAttribute("user", userId);
//			return "edit.jsp";
//		} else {
			cService.update(charId, name, charClass, strengthScore);
			return "redirect:/home";
		}
//	}
	
	@GetMapping("/{id}/coin")
	public String editCoin(@PathVariable("id") Long id, HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user_id");
		if(userId == null) {
			return "redirect:/";
		} else {
			Characters character = this.cService.findById(id);
			viewModel.addAttribute("character", character);
			viewModel.addAttribute("user", this.uService.findById(userId));
			return "editcoin.jsp";
		}
	}
	
//	@RequestMapping(value = "/{id}/coin", method=RequestMethod.PUT)
//	public String updateCoin(@Valid @ModelAttribute("character") Characters updatedCharacter, Store store, BindingResult result, HttpSession session, Model viewModel) {
//		Long userId = (Long)session.getAttribute("user_id");
//		if(result.hasErrors()) {
//			viewModel.addAttribute("user", userId);
//			return "editcoin.jsp";
//		} else {
//			cService.updateCoin(updatedCharacter);
//			return "redirect:/home";
//		}
//	}
	
	@RequestMapping(value = "/{id}/coin", method=RequestMethod.PUT)
	public String updateNew(@Valid @RequestParam("gp") int gp, @RequestParam("sp") int sp, @RequestParam("cp") int cp, @RequestParam("id") Long charId) {
//		Long userId = (Long)session.getAttribute("user_id");
//		if(result.hasErrors()) {
//			viewModel.addAttribute("user", userId);
//			return "edit.jsp";
//		} else {
		//Characters character = this.cService.getOneCharacter(charId);
		cService.updateCoin(charId, gp, sp, cp);
		return "redirect:/character/{id}";
		}
//	}
	
	
	@GetMapping("/character/{id}")
	public String show(@PathVariable("id") Long id, Model viewModel, HttpSession session) {
		Long userId = (Long)session.getAttribute("user_id");
		if(userId == null)
			return"redirect:/";
		
		List<Store> stores = this.sService.getStore();
		viewModel.addAttribute("stores", stores);
		viewModel.addAttribute("character", cService.getOneCharacter(id));
		viewModel.addAttribute("user_id", this.uService.findById(userId));
		return "view.jsp";
		}
	
	@GetMapping("/add/{charId}/{itemId}")
	public String add(@PathVariable("charId") Long charId, @PathVariable("itemId") Long itemId, HttpSession session, Model viewModel, String keyword) {
		Long userId = (Long)session.getAttribute("user_id");
		Store characterItems = this.sService.findById(itemId);
		Characters inventories = this.cService.getOneCharacter(charId);
		List<Store> stores = this.sService.getStore();
		String result = this.cService.addItem(characterItems, inventories);
		if(keyword != null) {
			viewModel.addAttribute("stores", sService.findByKeyword(keyword));
		}
		else {
		viewModel.addAttribute("stores", stores);
		}
		viewModel.addAttribute("characters", cService.getOneCharacter(charId));
		viewModel.addAttribute("buyResult", result);
		viewModel.addAttribute("user_id", this.uService.findById(userId));
		return "store.jsp";
	}
	
	@GetMapping("/remove/{charId}/{itemId}")
	public String add(@PathVariable("charId") Long charId, @PathVariable("itemId") Long itemId, HttpSession session) {
		Store characterItems = this.sService.findById(itemId);
		Characters inventories = this.cService.getOneCharacter(charId);
		this.cService.removeItem(characterItems, inventories);
		return "redirect:/shop/{charId}";
	}

}
