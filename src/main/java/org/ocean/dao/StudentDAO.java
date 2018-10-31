package org.ocean.dao;




import java.util.List;

import org.ocean.dto.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;


@Repository("StudentDAO")
public interface StudentDAO extends JpaRepository<Student, Integer> {

	
	List<Student> findByClassId(int id);
	
}
