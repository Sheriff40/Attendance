package org.ocean.controller;

import java.time.LocalDate;

import org.ocean.dao.ClassDAO;
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
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		LocalDate date = LocalDate.now();
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("title", "Teacher");
		
		mv.addObject("date", date);
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
	
	@RequestMapping(value = "/update/teacher/attendance/{id}")
	@ResponseBody
	public String updateAttendance(@PathVariable ("id") int id)
	{
		String message = "";
		TeacherAttendance ta = taDAO.findById(id).orElse(new TeacherAttendance());
		ta.setStatus(!ta.getStatus());
		taDAO.save(ta);
		if(ta.getStatus() == true)
		{
			message = "present";
		}
		else
		{
			message = "absent";
		}
		return message;
	}
	
	@PostMapping(value = "/search/teacher/attendance")
	@ResponseBody
	public ModelAndView searchTeacherAttendance(@RequestParam ("date") String date)
	{
		
		LocalDate date1 = LocalDate.parse(date);
		LocalDate date2 = date1.plusDays(1);
		ModelAndView mv = new ModelAndView("main");
		
		mv.addObject("UserClickSearchTeacherAttendance", true);
		mv.addObject("title", "teacher");
		mv.addObject("teachers",taDAO.getTeacherAttendanceFromDate(date1, date2));
		return mv;
	}
	
	@RequestMapping(value = "/edit/teacher/{id}")
	
	public ModelAndView editAttendance(@PathVariable ("id") int id)
	{
		
		Teacher teacher = teacherDAO.getById(id);
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("title", "Teacher");
		mv.addObject("UserClickTeacherEdit", true);
		mv.addObject("teacher", teacher);
		return mv;
	}
	
}
