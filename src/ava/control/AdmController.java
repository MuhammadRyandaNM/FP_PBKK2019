package ava.control;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import ava.dao.AdminDAO;
import ava.dao.GameDAO;
import ava.dao.PinjamDAO;
import ava.dao.UserDAO;
import ava.model.Admin;
import ava.model.Game;
import ava.model.Peminjaman;
import ava.model.Status;
import ava.model.User;

@Controller
@RequestMapping("adm")
@SessionAttributes("model")
public class AdmController {
	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private UserDAO usrdao;
	
	@Autowired
	private GameDAO gamedao;
	
	@Autowired
	private PinjamDAO pinjamdao;
	
	@RequestMapping("/home-adm")
	public ModelAndView halamanAdmin() {
		ModelAndView mav = new ModelAndView("logged-admin");
		List<Game> game = gamedao.getAllGame();
		mav.addObject("game", game);
		return mav;
	}
	
	@RequestMapping("/daftarusr-adm")
	public ModelAndView daftarusrAdmin() {
		ModelAndView mav = new ModelAndView("daftarusr-admin");
		List<User> usr = usrdao.getAllUsr();
		mav.addObject("user", usr);
		return mav;
	}
	
	@RequestMapping("/tambah-adm")
	public String tambahAdminPage(Model adm) {
		adm.addAttribute("adm", new Admin());
		return "tmbh-adm";
	}
	
	
	@RequestMapping("/daftarAdmin")
	public ModelAndView daftarBaruAdm(@Valid @ModelAttribute("adm") Admin adm, BindingResult bindres) {
		if(bindres.hasErrors()) {
			ModelAndView mav = new ModelAndView("tambah-adm");
			return mav;
		}
		else {
			dao.tambahAdm(adm);
			ModelAndView mav = new ModelAndView("redirect:/adm/home-adm");
			return mav;
		}
	}
	
	@RequestMapping("/editAdm")
	public String editAdminPage() {
		return "editdata-adm";
	}
	
	@RequestMapping("/editDb")
	public String editAdm(@Valid @ModelAttribute("model") Admin model, BindingResult bind) {
		if(bind.hasErrors()) {
			return "redirect:/adm/editAdm";
		}
		else {
			dao.editAdm(model);
			return "redirect:/adm/home-adm";
		}
	}
	
	
	//INI UNTUK NGEDIT" STATUS PEMINJAMAN
	@RequestMapping("/lihatpeminjaman")
	public ModelAndView listPinjamPage() {
		ModelAndView mav = new ModelAndView("peminjaman-adm");
		List<Peminjaman> listnya = pinjamdao.getAllDaftarPinjam();
		DateFormat d = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		for(Peminjaman item : listnya) {
			LocalDate start = LocalDate.parse(d.format(date), DateTimeFormatter.ISO_LOCAL_DATE);
			LocalDate finish = LocalDate.parse(item.getTgl_kembali(), DateTimeFormatter.ISO_LOCAL_DATE);
			Duration diff = Duration.between(finish.atStartOfDay(), start.atStartOfDay());
			long telat = diff.toDays();
			if(telat > 0) {
				long denda = telat*10000;
				item.setDenda(denda);
				item.setStatus_peminjaman("Terlambat");
				pinjamdao.updatePinjam(item);
			}
		}
		List<Peminjaman> pinjam = pinjamdao.getAllDaftarPinjam();
		mav.addObject("pinjam", pinjam);
		return mav;
	}
	
	@RequestMapping(value="statusPinjam", method=RequestMethod.GET)
	public String ubahStatPinjamPage(@RequestParam("id") int id, Model status, Model idpj) {
		status.addAttribute("status", new Status());
		idpj.addAttribute("id", id);
		return "pinjamstat-adm";
	}
	
	@RequestMapping(value="prosesPinjam", method= {RequestMethod.GET, RequestMethod.POST})
	public String ubahStatPinjam(@Valid @ModelAttribute("status") Status status, @RequestParam("id") int id, BindingResult bind) {
		if(bind.hasErrors()) {
			return "redirect:/adm/editAdm";
		}
		else {
			Peminjaman pj = pinjamdao.getSpesifik(id);
			//System.out.println(pj);
			//System.out.println(status.getMessage());
			pj.setStatus_peminjaman(status.getMessage());
			pinjamdao.updatePinjam(pj);
			if (status.getMessage().equals("Selesai") || status.getMessage().equals("Ditolak")) {
				Game game = gamedao.getGame(pj.getID_Game());
				game.setStatus("Tersedia");
				gamedao.editStatus(game);
			}
			return "redirect:/adm/lihatpeminjaman";
		}
	}
	
	
	//hehehehehe
	@RequestMapping("/histori-adm")
	public ModelAndView historiPinjamPage() {
		ModelAndView mav = new ModelAndView("historipinjam-adm");
		List<Peminjaman> list = pinjamdao.getHistoriAdm();
		mav.addObject("pinjam", list);
		return mav;
	}
}
