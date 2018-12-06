package org.ocean.controller;

import org.ocean.dao.ClassDAO;
import org.ocean.dto.Classes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value = "/admin")
public class ClassController {

		@Autowired
		private ClassDAO classDAO;
	
		@RequestMapping(value = "/show/classes")
		public ModelAndView getClasses()
		{
			ModelAndView mv = new ModelAndView("main");
			mv.addObject("title","Classes");
			mv.addObject("classes", new Classes());
			mv.addObject("UserClickShowClasses", true);
			return mv;
		}
		
		@GetMapping(value = "/edit/class/{id}")
		public ModelAndView editClass(@PathVariable("id") int id)
		{
			Classes classes = classDAO.findById(id).orElse(new Classes());
			ModelAndView mv = new ModelAndView("main");
			mv.addObject("title","Classes");
			mv.addObject("classes",classes);
			
			mv.addObject("UserClickEditClass", true);
			return mv;
		}
		
		@GetMapping(value = "/delete/class/{id}")
		public String deleteClass(@PathVariable("id")int id)
		{
			Classes classes = classDAO.findById(id).orElse(new Classes());
			try
			{
				classDAO.delete(classes);
				return "redirect:/admin/show/classes";
			}
			catch (Exception ex)
			{
				return ex.toString();
			}
		}
		
		@PostMapping(value = "/save/class")
		public String addClass(@ModelAttribute ("classes")Classes classes)
		{
			try
			{
				classDAO.save(classes);
				return "redirect:/admin/show/classes";
			}
			catch(Exception ex)
			{
				return ex.toString();
			}
		}
		
		@ModelAttribute
		public void getClasses(Model model)
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			model.addAttribute("ClassList",classDAO.findAll());
			model.addAttribute("userName", auth.getName());
		}
}
