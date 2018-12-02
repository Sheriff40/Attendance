package org.ocean.controller;



import org.ocean.dao.ClassDAO;
import org.ocean.dao.StudentDAO;

import org.ocean.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@Autowired
	public ClassDAO classDAO;
	
	@RequestMapping(value = "/student/add")
	public String add(@ModelAttribute("student")Student std)
	{
		
		String message;
		try
		{
			dao.save(std);
			
			message = "Inserted the data successfully";
			return "redirect:/admin/student/get?name="+std.getStdClass().getName();
			
		}
		catch(Exception ex)
		{
			message = "Could not insert the data ";
			return "redirect:/home?message="+message;
		}
		
		
	}
	
//	@RequestMapping(value = "/student/get")
//	@ResponseBody
//	public List<Student> get()
//	{
//		return dao.findAll();
//	}
//	
	
	@RequestMapping(value = "/student/get")

	public String getByClassId(@RequestParam("name")String name, Model model)
	{
		model.addAttribute("name",name);
		model.addAttribute("title", "Class");
		model.addAttribute("student", new Student());
		model.addAttribute("UserClickClass",true);
	
		return "main";
	}
	
	@RequestMapping(value = "/view/student/{id}")
	@ResponseBody
	public ModelAndView get(@PathVariable("id")int id)
	
	{
		
		Student student = dao.getById(id);
		ModelAndView mv = new ModelAndView("main");
		
		mv.addObject("title","View Student");
		mv.addObject("UserClickViewStudent", true);
		mv.addObject("student", student);
		return mv;
	}
	
	@RequestMapping(value = "/edit/student/{id}")
	public ModelAndView editStudent(@PathVariable("id")int id,Model model)
	
	{
		
		Student student = dao.getById(id);
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("student", student);
		mv.addObject("title", "Class");
		mv.addObject("EditStudentAttendance",true);
		return mv;
	}
	
	@RequestMapping(value = "/delete/student/{id}")
	public String deleteStudent(@PathVariable("id")int id)
	{
		Student std = dao.getById(id);
		String className = std.getStdClass().getName();
		try
		{
			dao.delete(std);
			return "redirect:/admin/student/get?name="+className;
		}
		catch (Exception ex)
		{
			return ex.toString();
		}
	}
	
	@ModelAttribute
	public void getClasses(Model model)
	{
		model.addAttribute("ClassList",classDAO.findAll());
	}
	
	
}
