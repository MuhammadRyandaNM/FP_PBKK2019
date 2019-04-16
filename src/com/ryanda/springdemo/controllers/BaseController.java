package com.ryanda.springdemo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ryanda.springdemo.models.Profiles;

@Controller
public class BaseController {
	
	@RequestMapping("/home")
	public String homePage() {
		String page = "homes";
		
		return page;
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
    public ModelAndView showForm() {
        return new ModelAndView("formpage", "profiles", new Profiles());
    }
	
	@RequestMapping(value = "/form_input_output", method=RequestMethod.POST)
	public String submitInput(
			@ModelAttribute("profiles") Profiles profiles,
			BindingResult result,
			ModelMap model) {
		
		if(result.hasErrors())
			return "error";
		
		model.addAttribute("name", profiles.getName());
		model.addAttribute("nrp", profiles.getNrp());
		model.addAttribute("score", profiles.getScore());
		
		return "inputoutput";
		
	}
}
