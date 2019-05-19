package ava.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ava.model.Game;
import ava.model.Peminjaman;

@Repository
public class PinjamDAOImpl implements PinjamDAO {
	
	@Autowired
	private SessionFactory s;
	
	
	@Transactional
	@Override
	public void savePinjam(Peminjaman pinjam) {
		Session session = s.getCurrentSession();
		session.save(pinjam);
	}
	
	@Transactional
	@Override
	public List<Peminjaman> getAllPinjamUsr(String ID_user){
		Session session = s.getCurrentSession();
		String sql = "from Peminjaman as pj where pj.ID_user = '"+ID_user+"' and (pj.status_peminjaman = 'Menunggu' or pj.status_peminjaman = 'OK' or pj.status_peminjaman = 'Terlambat')";
		List<Peminjaman> pinjams = session.createQuery(sql).list();
		//System.out.println(pinjams);
		return pinjams;
	}
	
	@Transactional
	@Override
	public List<Peminjaman> getAllDaftarPinjam(){
		Session session = s.getCurrentSession();
		String sql = "from Peminjaman as pj where pj.status_peminjaman = 'Menunggu' or pj.status_peminjaman = 'OK' or pj.status_peminjaman = 'Terlambat'";
		List<Peminjaman> pinjam = session.createQuery(sql).list();
		//System.out.println(pinjam);
		return pinjam;
	}
	
	@Transactional
	@Override
	public Peminjaman getSpesifik(int id) {
		Session session = s.getCurrentSession();
		Peminjaman pj = session.get(Peminjaman.class, id);
		return pj;
	}
	
	@Transactional
	@Override
	public void updatePinjam(Peminjaman pinjam) {
		Session session = s.getCurrentSession();
		session.update(pinjam);
	}
	
	@Transactional
	@Override
	public List<Peminjaman> getHistoriUsr(String ID_user){
		Session session = s.getCurrentSession();
		String sql= "from Peminjaman as pj where pj.ID_user = '"+ID_user+"' and (pj.status_peminjaman = 'Selesai' or status_peminjaman = 'Ditolak')";
		List<Peminjaman> list = session.createQuery(sql).list();
		return list;
	}
	
	@Transactional
	@Override
	public List<Peminjaman> getHistoriAdm(){
		Session session = s.getCurrentSession();
		String sql = "from Peminjaman as pj where pj.status_peminjaman = 'Selesai' or pj.status_peminjaman = 'Ditolak'";
		List<Peminjaman> pinjam = session.createQuery(sql).list();
		return pinjam;
	}
}
