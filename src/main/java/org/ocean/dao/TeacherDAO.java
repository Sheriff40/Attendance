package org.ocean.dao;

import org.ocean.dto.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository(value = "TeacherDAO")
public interface TeacherDAO extends JpaRepository<Teacher ,Integer>{

	@Query(value = "SELECT * FROM teacher WHERE id = ?",nativeQuery = true)	
	public Teacher getById(int id);

	
	
}
