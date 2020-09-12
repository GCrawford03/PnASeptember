package com.garrett.shopofholding.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.garrett.shopofholding.models.Store;

@Repository
public interface StoreRepository extends CrudRepository <Store, Long> {
	
	List<Store> findAll();
	
	@Query(value="select * from stores e where e.item_name like %:keyword% or e.type like %:keyword%", nativeQuery=true)
	List<Store> findByKeyword(@Param("keyword") String keyword);

}
