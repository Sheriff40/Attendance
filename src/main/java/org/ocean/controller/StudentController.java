package org.ocean.controller;

import java.util.List;

import org.ocean.dao.StudentDAO;
import org.ocean.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class StudentController {

	@Autowired
	public StudentDAO dao;
	
	@RequestMapping(value = "/student/add")
	public String add(@ModelAttribute("student")Student std)
	{
		
		String message;
		try
		{
			dao.save(std);
			message = "Inserted the data successfully";
			return "redirect:/home?message="+message;
			
		}
		catch(Exception ex)
		{
			message = "Could not insert the data ";
			return "redirect:/home?message="+message;
		}
		
		
	}
	
	@RequestMapping(value = "/student/get")
	@ResponseBody
	public List<Student> get()
	{
		return dao.findAll();
	}
	
	
	@RequestMapping(value = "/student/{id}/get")

	public String getByClassId(@PathVariable ("id")int id, Model model)
	{
		model.addAttribute("id",id);
		model.addAttribute("title", "Class");
		model.addAttribute("student", new Student());
		model.addAttribute("UserClickClass",true);
	
		return "main";
	}
	
	
}
