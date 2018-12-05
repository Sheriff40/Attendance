package org.ocean.controller;

import org.ocean.dao.ClassDAO;
import org.ocean.dao.UserDAO;
import org.ocean.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class UserController {

	@Autowired
	public ClassDAO classDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@Bean
	public PasswordEncoder passwordEncoder()
	{
		return new BCryptPasswordEncoder();
	}   
	
	@RequestMapping("/admin/add/user/form")
	public ModelAndView addForm ()
	{
		ModelAndView mv = new ModelAndView("main");
		User user = new User();
		mv.addObject("UserClickAddUser", true);
		mv.addObject("title", "Add User");
		mv.addObject("users", userDAO.findAll());
		mv.addObject("user",user);
		return mv;
	}
	
	@PostMapping("/user/save/user")
	public String saveUser(@ModelAttribute("user")User user)
	{
		int userId = user.getId();
		if(userId == 0)
		{
			String encodedPass = passwordEncoder().encode(user.getPassword());
			user.setPassword(encodedPass);
			user.setActive(true);
		}
		try
		{
			userDAO.save(user);
			if(userId ==0)
			{
				return "redirect:/admin/add/user/form";
				
			}
			else
			{
				return "redirect:/user/show/session";
			}
			
		}
		catch(Exception ex)
		{
			return ex.toString();
		}
		
	}
	
	@RequestMapping("/admin/delete/user/{id}")
	
	public String deleteUser(@PathVariable ("id") int id)
	{
		User user = userDAO.findById(id).orElse(new User());
		userDAO.delete(user);
		return "redirect:/admin/add/user/form";
		
		
	}
	
	@RequestMapping("/user/show/session")

	public ModelAndView showUser()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userDAO.findByEmail(auth.getName());
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("UserClickProfile", true);
		mv.addObject("title", "Profile");
		mv.addObject("user", user);
		return mv;
		
	}
	
	@PostMapping("/user/change-password")
	
	public String changePassword(@RequestParam("password") String password,Model model)
	{
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userDAO.findByEmail(auth.getName());
		if(passwordEncoder().matches(password, user.getPassword()))
		{
			model.addAttribute("UserClickChangePassword", true);
			model.addAttribute("title","Change Password");
			return "main";
		}
		else
		{
			model.addAttribute("heading", "Error");
			model.addAttribute("message", "The passwords do not match");
			return "Error";
		}
	}
	
	@PostMapping(value = "/user/new/password")
	public String newPassword(@RequestParam("password") String password)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userDAO.findByEmail(auth.getName());
		user.setPassword(passwordEncoder().encode(password));
		try
		{
			userDAO.save(user);
			return "redirect:/user/show/session";
		}
		catch(Exception ex)
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
