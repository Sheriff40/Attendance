package org.ocean.dao;




import java.util.List;

import org.ocean.dto.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository("StudentDAO")
public interface StudentDAO extends JpaRepository<Student, Integer> {

	@Query(value = "Select * FROM Student WHERE id = ?1 ", nativeQuery = true)
	public Student getById(int id);
	
	
	List<Student> findByClassId(int id);
	
}
