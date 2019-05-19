package rbtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="peminjaman")
public class Peminjaman {
	
	@Id
	@Column(name="id_peminjaman")
	private int id_peminjaman;
	
	@Column(name="ID_user")
	private String ID_user;
	
	@Column(name="ID_Game")
	private String ID_Game;
	
	@Column(name="tgl_pinjam")
	private String tgl_pinjam; 
	
	@Column(name="tgl_kembali")
	private String tgl_kembali;
	
	@Column(name="status_peminjaman")
	private String status_peminjaman;
	
	@Column(name="denda")
	private long denda;
	
	@Column(name="judul_game")
	private String judulgame;
	
	public Peminjaman() {}

	public Peminjaman(int id_peminjaman, String ID_user, String ID_Game, String tgl_pinjam, String tgl_kembali,
			String status_peminjaman, long denda, String judul_game) {
		super();
		this.id_peminjaman = id_peminjaman;
		this.ID_user = ID_user;
		this.ID_Game = ID_Game;
		this.tgl_pinjam = tgl_pinjam;
		this.tgl_kembali = tgl_kembali;
		this.status_peminjaman = status_peminjaman;
		this.denda = denda;
		this.judulgame = judul_game;
	}

	public String getJudulgame() {
		return judulgame;
	}

	public void setJudulgame(String judulgame) {
		this.judulgame = judulgame;
	}

	public int getId_peminjaman() {
		return id_peminjaman;
	}

	public String getID_user() {
		return ID_user;
	}

	public void setID_user(String ID_user) {
		this.ID_user = ID_user;
	}

	public String getTgl_pinjam() {
		return tgl_pinjam;
	}

	public void setTgl_pinjam(String tgl_pinjam) {
		this.tgl_pinjam = tgl_pinjam;
	}

	public String getTgl_kembali() {
		return tgl_kembali;
	}

	public void setTgl_kembali(String tgl_kembali) {
		this.tgl_kembali = tgl_kembali;
	}

	public String getStatus_peminjaman() {
		return status_peminjaman;
	}

	public void setStatus_peminjaman(String status_peminjaman) {
		this.status_peminjaman = status_peminjaman;
	}

	public String getID_Game() {
		return ID_Game;
	}

	public void setID_Game(String ID_Game) {
		this.ID_Game = ID_Game;
	}

	public long getDenda() {
		return denda;
	}

	public void setDenda(long denda) {
		this.denda = denda;
	}

	public void setId_peminjaman(int id_peminjaman) {
		this.id_peminjaman = id_peminjaman;
	}

	@Override
	public String toString() {
		return "Peminjaman [id_peminjaman=" + id_peminjaman + ", ID_user=" + ID_user + ", ID_Game=" + ID_Game + ", tgl_pinjam="
				+ tgl_pinjam + ", tgl_kembali=" + tgl_kembali + ", status_peminjaman=" + status_peminjaman + ", denda="
				+ denda + ", judulgame=" + judulgame + "]";
	}
	
	
	
	
	
}
