package com.garrett.shopofholding.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.garrett.shopofholding.models.User;
import com.garrett.shopofholding.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository uRepo;
	
	public User findById(Long id) {
		return this.uRepo.findById(id).orElse(null);
	}
	
	public List<User> allUser() {
		return this.uRepo.findAll();
	}
	
	public User getByEmail(String email) {
		return this.uRepo.findByEmail(email);
	}
	
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return uRepo.save(user);
	}
	
	public boolean authenticateUser(String email, String password) {
		User user = this.uRepo.findByEmail(email);
		if(user == null) {
			return false;
		} else {
			if (BCrypt.checkpw(password, user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}

}
