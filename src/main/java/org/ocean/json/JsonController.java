package org.ocean.json;


import java.util.List;

import org.ocean.dao.StudentDAO;
import org.ocean.dao.TeacherDAO;
import org.ocean.dto.Student;
import org.ocean.dto.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RestController
@RequestMapping("/json")
public class JsonController {

	@Autowired
	private StudentDAO dao;
	
	@Autowired
	private TeacherDAO teacherDAO;
	
//	@RequestMapping("/{id}/student")
//	public List<Student> studenyByClass(@PathVariable ("id") int id)
//	{
//		return serv.StudentByClassId(id);
//	}
//	
	@GetMapping("/get/student")
	public List<Student> studentByClass(@RequestParam("name")String name)
	{	
		return dao.findByStdClassName(name);
	}
	
	@GetMapping("/attendance")
	public List<Student> listStudents(@RequestParam("name")String name)
	{
		return dao.findByStdClassName(name);
	}
	
	@GetMapping("/get/teachers")
	public List<Teacher> getTeachers()
	{
		return teacherDAO.findAll();
	}
}
