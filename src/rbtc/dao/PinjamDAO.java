package rbtc.dao;

import java.util.List;

import rbtc.model.Peminjaman;

public interface PinjamDAO {

	public void savePinjam(Peminjaman pinjam);
	public List<Peminjaman> getAllPinjamUsr(String ID_user);
	public List<Peminjaman> getAllDaftarPinjam();
	public void updatePinjam(Peminjaman pinjam);
	public Peminjaman getSpesifik(int id);
	
	public List<Peminjaman> getHistoriUsr(String ID_user);
	public List<Peminjaman> getHistoriAdm();
	
}
