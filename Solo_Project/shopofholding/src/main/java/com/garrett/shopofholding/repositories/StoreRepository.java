package com.garrett.shopofholding.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.garrett.shopofholding.models.Store;

@Repository
public interface StoreRepository extends CrudRepository <Store, Long> {
	
	List<Store> findAll();

}
