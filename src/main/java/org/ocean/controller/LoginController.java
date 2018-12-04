package org.ocean.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/403-UnauthorizedAccess",method = RequestMethod.GET)
	public String Error(Model model)
	{
		model.addAttribute("heading","403 Unauthorized Access");
		model.addAttribute("message", "You are not authorized to access the page");
		return "Error";
	}
	
}
