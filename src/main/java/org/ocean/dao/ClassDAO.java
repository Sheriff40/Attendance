package org.ocean.dao;



import org.ocean.dto.Classes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository(value = "ClassDAO")
public interface ClassDAO extends JpaRepository<Classes, Integer> {

	public Classes findByName(String name);
	
}
