package org.ocean.controller;

import java.util.List;

import org.ocean.dao.StudentDAO;
import org.ocean.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class StudentController {

	@Autowired
	public StudentDAO dao;
	
	@RequestMapping(value = "/student/add")
	@ResponseBody
	public String add()
	{
		try
		{
			Student std = new Student();
			std.setFname("sheriff");
			std.setLname("hussain");
			std.setNumber("199191922");
			std.setTotalAbsentDay(80);
			std.setTotalPresentDay(5);
			std.setClassId(8);
			dao.save(std);
			return "success";
		}
		catch(Exception ex)
		{
			return "failure";
		}
		
		
	}
	
	@RequestMapping(value = "/student/get")
	@ResponseBody
	public List<Student> get()
	{
		return dao.findAll();
	}
	
	
	@RequestMapping(value = "/student/{id}/get")
	
	public ModelAndView getByClassId(@PathVariable ("id")int id)
	{
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("id",id);
		mv.addObject("title","Class");
		mv.addObject("UserClickClass",true);
		return mv;
	}
	
	
}
