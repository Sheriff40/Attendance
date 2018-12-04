package org.ocean.dao;

import org.ocean.dto.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository<User, Integer>{

	public User findByEmail(String email);
	
}
