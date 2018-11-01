package org.ocean.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AttendenceController {

	@GetMapping("/home")
	public ModelAndView home(@RequestParam (value = "message",required= false)String message)
	{
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("title", "home");
		mv.addObject("message",message);
		return mv;
	}
	
}
