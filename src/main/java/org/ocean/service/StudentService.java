package org.ocean.service;

import java.util.List;

import org.ocean.dao.StudentDAO;
import org.ocean.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("StudentService")
public class StudentService {

	@Autowired
	StudentDAO dao;
	
	public List<Student> StudentByClassId(int id)
	{
		return dao.findByClassId(id);
	}
	
}
