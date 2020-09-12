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
	
	public Characters update(Long id, String name, String charClass, int strengthScore ) {
		Characters updatedCharacter = this.getOneCharacter(id);
		updatedCharacter.setName(name);
		updatedCharacter.setCharClass(charClass);
		updatedCharacter.setStrengthScore(strengthScore);
		int carryCapacity = updatedCharacter.getCarryCapacity();
		updatedCharacter.setCarryCapacity(carryCapacity);
		return this.cRepo.save(updatedCharacter);
	}
	
	public void updateCoin(Long id, int gp, int sp, int cp) {
		Characters updatedCharacter = this.getOneCharacter(id);
		updatedCharacter.setGp(gp);
		updatedCharacter.setSp(sp);
		updatedCharacter.setCp(cp);
		cRepo.save(updatedCharacter);
	}
	
	public void delete(Long id) {
		this.cRepo.deleteById(id);
	}
	
	//Add item
		public String addItem(Store store, Characters character) {
			if(store.getPriceGP() > character.getGp()) {
				return "Not enough gold.";
			}
			int weight = character.getCarryCapacity() - store.getWeight();
			if(weight <= 0) {
				return "Not enough space.";
			}
			character.updateCarryCapacity(weight);
			int gold = character.getGp() - store.getPriceGP();
			character.setGp(gold);
			List<Store> inventories = character.getInventories();
			inventories.add(store);
			this.cRepo.save(character);
			return "Item purchased.";
		}
		
		// Remove item
		public void removeItem(Store store, Characters character) {
			int weight = character.getCarryCapacity() + store.getWeight();
			int gold = character.getGp() + store.getPriceGP();
			character.updateCarryCapacity(weight);
			character.setGp(gold);
			character.getInventories().remove(store);
			this.cRepo.save(character);
		}
}
