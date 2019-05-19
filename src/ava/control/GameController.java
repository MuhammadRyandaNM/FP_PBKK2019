package ava.control;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import ava.dao.GameDAO;
import ava.model.Admin;
import ava.model.Game;
import ava.model.User;

@Controller
@RequestMapping("game")
@SessionAttributes("model")
public class GameController {
	
	@Autowired
	private GameDAO dao;
	
	@RequestMapping("/tambahGame")
	public String tambahGamePage(Model book) {
		book.addAttribute("game", new Game());
		return "tmbh-game";
	}
	
	@RequestMapping("/insertDb")
	public ModelAndView daftarBaruGame(@Valid @ModelAttribute("game") Game game, BindingResult bindres) {
		if(bindres.hasErrors()) {
			ModelAndView mav = new ModelAndView("tmbh-game");
			return mav;
		}
		else {
			dao.tambahGame(game);
			ModelAndView mav = new ModelAndView("redirect:/adm/home-adm");
			return mav;
		}
	}
	
	@RequestMapping(value="deleteGame", method=RequestMethod.GET)
	public String deleteGame(@RequestParam("id") String ID_Game) {
		Game hapuskan = dao.getGame(ID_Game);
		dao.deleteGame(hapuskan);
		return "redirect:/adm/home-adm";
	}
	
	@RequestMapping(value="/editStatus", method=RequestMethod.GET)
	public String editStatusPage(Model game, @RequestParam("id") String ID_Game) {
		Game gamenya = dao.getGame(ID_Game);
		game.addAttribute("statusnya", gamenya);
		return "editstatgame-adm";
	}
	
	@RequestMapping("/ubahStat")
	public String editStatGame(@Valid @ModelAttribute("statusnya") Game game,BindingResult bindres) {
		if(bindres.hasErrors()) {
			return "editStatus";
		}
		else {
			dao.editStatus(game);
			return "redirect:/adm/home-adm";
		}
	}
	
}
