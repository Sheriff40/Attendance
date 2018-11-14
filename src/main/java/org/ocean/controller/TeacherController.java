package org.ocean.controller;

import java.time.LocalDate;

import org.ocean.dao.TeacherAttendanceDAO;
import org.ocean.dao.TeacherDAO;
import org.ocean.dto.Teacher;
import org.ocean.dto.TeacherAttendance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class TeacherController {


	@Autowired
	private TeacherDAO teacherDAO;
	
	@Autowired
	private TeacherAttendanceDAO taDAO;
	
	
	@PostMapping(value = "/add/teacher")
	
	public String addTeacher(@ModelAttribute ("teacher") Teacher teacher)
	{
		try
		{
			teacherDAO.save(teacher);
			return "redirect:/show/teacher";
		}
		catch(Exception ex)
		{
			return ex.toString();
		}
	}
	
	@GetMapping(value = "/take/teacher/attendance")
	public ModelAndView addTeacherAttendance()
	{
		
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("title", "Teacher");
		mv.addObject("UserClickTakeTeacherAttendance", true);
		return mv;
	}
	
	@PostMapping(value = "/add/teacher/attendance/{id}")
	@ResponseBody
	public String addTeacherAttendance(@PathVariable ("id") int id, @RequestParam(name = "abs",required = false)Boolean abs)
	{
		String message = null;
		Teacher teacher = teacherDAO.getById(id);
		LocalDate date1 = LocalDate.now();
		LocalDate date2 = date1.plusDays(1);
		
		
		if(taDAO.getTeacherAttendanceList(id, date1, date2)==null)
		{
			try
			{
				TeacherAttendance ta = new TeacherAttendance();
				ta.setDate(date1);
				ta.setTeacher(teacher);
				ta.setStatus(!abs);
				taDAO.save(ta);
				message =  ta.getId() + "";
			}
			catch(Exception ex)
			{
				message =  ex.toString();
			}
			
		}
		else
		{
			message = "error";
		
		}
		
		
		 return message;
		
	}
}
