package com.garrett.shopofholding.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.garrett.shopofholding.models.Store;
import com.garrett.shopofholding.repositories.StoreRepository;

@Service
public class StoreService {
	
	@Autowired
	private StoreRepository sRepo;
	
	public List<Store> getStore() {
		return this.sRepo.findAll();
	}
	
	public Store findById(Long id) {
		return this.sRepo.findById(id).orElse(null);
	}
 
}
