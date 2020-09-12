package com.garrett.shopofholding.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.garrett.shopofholding.models.Characters;
import com.garrett.shopofholding.models.User;

@Repository
public interface CharacterRepository extends CrudRepository<Characters, Long> {
	
	List<Characters> findAll();
	List<Characters> findByUser(User user);
	List<Characters> findByStrengthScore(int strengthScore);
	List<Characters> findByName(String name);
	List<Characters> findByCharClass(String charClass);
	Characters findByGp(int gp);
	Characters findBySp(int sp);
	Characters findByCp(int cp);
	Characters findOneById(Long id);
}
