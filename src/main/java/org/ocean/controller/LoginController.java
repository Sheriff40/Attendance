package org.ocean.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public ModelAndView Login(@RequestParam (name = "success" , required = false)  String success, @RequestParam (name = "logout", required = false )String logout)
	{
		
		ModelAndView mv = new ModelAndView("loginPage");
		mv.addObject("success",success);
		mv.addObject("logout",logout);
		return mv;
	}
	
}
