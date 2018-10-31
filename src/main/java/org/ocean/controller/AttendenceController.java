package org.ocean.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AttendenceController {

	@GetMapping("/home")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("title", "home");
		return mv;
	}
	
}
