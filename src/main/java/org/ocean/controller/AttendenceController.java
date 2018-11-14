package org.ocean.controller;

import java.time.LocalDate;


import org.ocean.dao.AttendanceDAO;
import org.ocean.dao.StudentDAO;
import org.ocean.dto.Attendance;
import org.ocean.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AttendenceController {

	@Autowired
	private StudentDAO dao;

	@Autowired
	private AttendanceDAO attendanceDAO;

	@GetMapping("/home")
	public ModelAndView home(@RequestParam(value = "message", required = false) String message) {
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("title", "home");
		mv.addObject("message", message);
		return mv;
	}

	@GetMapping("/home/attendance")
	public ModelAndView attendance() {
		ModelAndView mv = new ModelAndView("main");
		
		mv.addObject("title", "attendance");
		
		mv.addObject("UserClickAttendance", true);

		return mv;
	}

	@GetMapping("/attendance/take/{id}")
	public ModelAndView attendanceTake(@PathVariable("id") int id) {

		ModelAndView mv = new ModelAndView("main");
		mv.addObject("id", id);
		mv.addObject("title", "attendance");
		LocalDate date1 = LocalDate.now();
		mv.addObject("date", date1);
		mv.addObject("UserClickAttendance", true);
		return mv;
	}

	@PostMapping(value = "/add/attendance/{id}")
	@ResponseBody
	public String addAttendancePresent(@PathVariable("id") int id,
			@RequestParam(name = "abs", required = false) Boolean abs) {
		
		String message = null;
		
		Student std = dao.getById(id);
		Attendance att = new Attendance();
		
		LocalDate date1 = LocalDate.parse("2018-11-15");
		LocalDate date2 = date1.plusDays(1);
		if(!(attendanceDAO.searchByDateAndStudentId(id, date1, date2)==null))
		{
			message = "error";
		}
		else
		{
			if (abs == true) {
				att.setStatus(false);
			} else {
				att.setStatus(true);
			}
			std.setTotalPresentDay(std.getTotalPresentDay() + 1);
			att.setDate(date1);
			att.setStudent(std);
			att.setClassId(std.getClassId());
			attendanceDAO.save(att);
			message = att.getId() + "";
		}
		return message;
	}

	@PostMapping(value = "/update/attendance/{id}")
	@ResponseBody
	public String updateAttendanceAbsent(@PathVariable("id") int attId) {
		String message = null;
		Attendance att = attendanceDAO.findById(attId).orElse(new Attendance());
		Student std = att.getStudent();
		if (att.getStatus() == true) {
			std.setTotalPresentDay(std.getTotalPresentDay() - 1);
			std.setTotalAbsentDay(std.getTotalAbsentDay() + 1);
			message = "absent";
		} else {
			std.setTotalPresentDay(std.getTotalPresentDay() + 1);
			std.setTotalAbsentDay(std.getTotalAbsentDay() - 1);
			message = "present";
		}
		att.setStatus(!(att.getStatus()));
		attendanceDAO.save(att);
		return message;
	}

	@RequestMapping(value = "/show/attendace")
	@ResponseBody
	public ModelAndView getAll(@RequestParam("year")int year,@RequestParam("month")int month,
			@RequestParam("day")int day , @RequestParam("classId")int id)
	{

		LocalDate date1 = LocalDate.of(year, month, day);
		LocalDate date2 = date1.plusDays(1);
		ModelAndView mv = new ModelAndView ("main");
		mv.addObject("UserClickShowAttendance",true);
		mv.addObject("attribute",attendanceDAO.searchByDateAndId(id, date1, date2));
		mv.addObject("title","Show Attendance");
		return mv;
	}
	

	
	@RequestMapping(value = "/take/attendance/teacher")
	public ModelAndView attendanceTeacher()
	{
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("UserClickTeacherAttendance", true);
		mv.addObject("title", "Teacher");
		return mv;
	}

	
}
