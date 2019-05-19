package ava.control;

import java.util.List;
import javax.validation.Valid;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ava.dao.AdminDAO;
import ava.dao.UserDAO;
import ava.model.Admin;
import ava.model.Login;
import ava.model.User;
import ava.model.*;



@Controller
@RequestMapping("/Avagames")
@SessionAttributes("model")
public class Control {

	@Autowired
	private UserDAO usrdao;
	
	@Autowired
	private AdminDAO admdao;
	
	@RequestMapping("/")
	public String mainPage() {
		return "home-page";
	}
	
	@RequestMapping("/login")
	public String loginPage(Model model){
		model.addAttribute("model", new Login());
		return "login-page";
	}
	
	@RequestMapping("/prosesLogin")
	public ModelAndView prosesLogin(@Valid @ModelAttribute("model") Login data, BindingResult bindres) {
		if(bindres.hasErrors()) {
			ModelAndView mav = new ModelAndView("/Avagames/login");
			return mav;
		}
		else {
			if(data.getRole().equals("User")) {
					User user = usrdao.getUsr(data.getId());
					if(user.getPassword().equals(data.getPassword())) {
						ModelAndView mav = new ModelAndView("redirect:/usr/home-usr");
						mav.addObject("model", user);
						return mav;
					}
					else {
						ModelAndView mav = new ModelAndView("/Avagames/login");
						return mav;
					}

			}
			else if(data.getRole().equals("Admin")){
					//get adm
					Admin user = admdao.getAdm(data.getId());
					if(user.getPassword().equals(data.getPassword())) {
						ModelAndView mav = new ModelAndView("redirect:/adm/home-adm");
						mav.addObject("model", user);
						return mav;
					}
					else {
						ModelAndView mav = new ModelAndView("/Avagames/login");
						return mav;
					}
			}
			else {
				ModelAndView mav = new ModelAndView("/Avagames/login");
				return mav;
			}
			
		}
	}
	
	@RequestMapping("/signup")
	public String signupPageUser(Model model) {
		model.addAttribute("model", new User());
		return "signup-page";
	}
	
	@RequestMapping("logout")
	public String logout(SessionStatus session, ModelMap model) {
		session.setComplete();
		return "redirect:/Avagames/";
	}
	
//	@RequestMapping("/profil-usr")
//	public String editUser(@RequestParam("usrNRP") int nrp, Model theModel) {
//		
//		User iniUser = editUser.getUser(nrp);
//		
//		theModel.addAtribute("mahasiswa", iniUser);
//		
//		return "data-mahasiswa";
//	}
	
	
	
}