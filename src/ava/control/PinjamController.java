package ava.control;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import ava.dao.GameDAO;
import ava.dao.PinjamDAO;
import ava.model.Game;
import ava.model.Peminjaman;
import ava.model.User;

@Controller
@RequestMapping("pinjam")
@SessionAttributes("model")
public class PinjamController {
	
	@Autowired
	PinjamDAO dao;
	
	@Autowired
	GameDAO gamedao;
	
	
	@RequestMapping(value="prosesPinjam", method=RequestMethod.GET)
	public String prosesPinjam(@RequestParam("id") String ID_Game, @RequestParam("ID_user") String ID_user) {
		Peminjaman pinjam = new Peminjaman();
		//ngatur gamenya
		Game game = gamedao.getGame(ID_Game);
		game.setStatus("Dipinjam");
		gamedao.editStatus(game);
		
		//ngatur pinjamnya
		DateFormat d = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_YEAR, 7);
		
		pinjam.setJudulgame(game.getJudul());
		pinjam.setID_Game(ID_Game);
		pinjam.setStatus_peminjaman("Menunggu");
		pinjam.setTgl_pinjam(d.format(date));
		pinjam.setTgl_kembali(d.format(c.getTime()));
		pinjam.setDenda(0);
		pinjam.setID_user(ID_user);
		dao.savePinjam(pinjam);
		return "redirect:/usr/home-usr";
	}
}
