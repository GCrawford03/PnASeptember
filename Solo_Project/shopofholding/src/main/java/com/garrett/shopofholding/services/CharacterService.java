package com.garrett.shopofholding.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.garrett.shopofholding.models.Characters;
import com.garrett.shopofholding.models.Store;
import com.garrett.shopofholding.repositories.CharacterRepository;

@Service
public class CharacterService {
	
	@Autowired
	private CharacterRepository cRepo;
	
	public List<Characters> getCharacter() {
		return this.cRepo.findAll();
	}
	
	public Characters findById(Long id) {
		return this.cRepo.findById(id).orElse(null);
	}
	
	public Characters getOneCharacter(Long id) {
		Characters character = this.cRepo.findById(id).orElse(null);
		return character;
	}
	
	public Characters create(Characters character) {
		int carryCapacity = character.getCarryCapacity();
		character.setCarryCapacity(carryCapacity);
		return this.cRepo.save(character);
	}
	
	public Characters update(Characters updatedCharacter) {
		int carryCapacity = updatedCharacter.getCarryCapacity();
		updatedCharacter.setCarryCapacity(carryCapacity);
		return this.cRepo.save(updatedCharacter);
	}
	
	public void delete(Long id) {
		this.cRepo.deleteById(id);
	}
	
	//Add item
		public void addItem(Store store, Characters character) {
			int gold = character.getGp - store.getPriceGP();
			character.setGp(gold);
			List<Store> inventories = character.getInventories();
			inventories.add(store);
			this.cRepo.save(character);
		}
		
		// Remove item
		public void removeItem(Store store, Characters character) {
			character.getInventories().remove(store);
			this.cRepo.save(character);
		}
}
