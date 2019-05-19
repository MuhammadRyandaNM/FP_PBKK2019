package rbtc.control;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import rbtc.dao.GameDAO;
import rbtc.dao.UserDAO;
import rbtc.dao.PinjamDAO;
import rbtc.model.Game;
import rbtc.model.Login;
import rbtc.model.User;
import rbtc.model.Peminjaman;
import rbtc.model.Admin;

@Controller
@RequestMapping("usr")
@SessionAttributes("model")
public class UsrController {
	
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private GameDAO gamedao;
	
	@Autowired
	private PinjamDAO pinjamdao;
	
	@RequestMapping("/prosesDaftar")
	public ModelAndView daftarBaruUsr(@Valid @ModelAttribute("model") User model, BindingResult bindres) {
		if(bindres.hasErrors()) {
			ModelAndView mav = new ModelAndView("sign-up");
			return mav;
		}
		else {
			ModelAndView mav = new ModelAndView("redirect:home-usr");
			dao.tambahUsr(model);
			mav.addObject("model", model);
			return mav;
		}
	}
	
	@RequestMapping("/home-usr")
	public ModelAndView halamanUser() {
		ModelAndView mav = new ModelAndView("logged-user");
		List<Game> game = gamedao.getAllGame();
		mav.addObject("game", game);
		return mav;
	}
	
	@RequestMapping(value="deleteUsr", method=RequestMethod.GET)
	public String deleteUser(@RequestParam("id") String ID_user) {
		User usr = dao.getUsr(ID_user);
		dao.deleteUsr(usr);
		return "redirect:/adm/daftarusr-adm";
	}
	
	@RequestMapping("/editUsr")
	public String openEditData() {
		return "editdata-usr";
	}
	
	@RequestMapping("/editDb")
	public String editUsr(@Valid @ModelAttribute("model") User model, BindingResult bind) {
		if(bind.hasErrors()) {
			return "editUsr";
		}
		else {
			dao.editUsr(model);
			return "redirect:/usr/home-usr";
		}
	}
	
	@RequestMapping(value="peminjaman-usr", method=RequestMethod.GET)
	public ModelAndView pinjamPage(@RequestParam("id") String ID_user) {
		ModelAndView mav = new ModelAndView("peminjaman-usr");
		List<Peminjaman> listnya = pinjamdao.getAllPinjamUsr(ID_user);
		DateFormat d = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		for(Peminjaman item : listnya) {
			LocalDate start = LocalDate.parse(d.format(date), DateTimeFormatter.ISO_LOCAL_DATE);
			LocalDate finish = LocalDate.parse(item.getTgl_kembali(), DateTimeFormatter.ISO_LOCAL_DATE);
			Duration diff = Duration.between(finish.atStartOfDay(), start.atStartOfDay());
			long telat = diff.toDays();
			if(telat > 0) {
				long denda = telat*1000;
				item.setDenda(denda);
				item.setStatus_peminjaman("Terlambat");
				pinjamdao.updatePinjam(item);
			}
		}
		List<Peminjaman> pinjam = pinjamdao.getAllPinjamUsr(ID_user);
		mav.addObject("pinjam", pinjam);
		//System.out.println(pinjam);
		return mav;
	}
	
	@RequestMapping(value="histori-usr", method=RequestMethod.GET)
	public ModelAndView historiPage(@RequestParam("id") String ID_user) {
		ModelAndView mav = new ModelAndView("historipinjam-usr");
		List<Peminjaman> list = pinjamdao.getHistoriUsr(ID_user);
		mav.addObject("pinjam", list);
		return mav;
	}
}
;