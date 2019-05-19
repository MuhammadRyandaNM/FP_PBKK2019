package rbtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="game")
public class Game {
	@Id
	@Column(name="ID_Game")
	private String ID_Game;
	
	@Column(name="judul")
	private String judul;
	
	@Column(name="developer")
	private String developer;
	
	@Column(name="tahun_terbit")
	private String tahun_terbit;
	
	@Column(name="edisi")
	private String edisi;
	
	@Column(name="status")
	private String status;
	
	public String getID_Game() {
		return ID_Game;
	}
	public void setID_Game(String ID_Game) {
		this.ID_Game = ID_Game;
	}
	public String getJudul() {
		return judul;
	}
	public void setJudul(String judul) {
		this.judul = judul;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getTahun_terbit() {
		return tahun_terbit;
	}
	public void setTahun_terbit(String tahun_terbit) {
		this.tahun_terbit = tahun_terbit;
	}
	public String getEdisi() {
		return edisi;
	}
	public void setEdisi(String edisi) {
		this.edisi = edisi;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Game(String ID_Game, String judul, String developer, String tahun_terbit, String edisi, String status) {
		super();
		this.ID_Game = ID_Game;
		this.judul = judul;
		this.developer = developer;
		this.tahun_terbit = tahun_terbit;
		this.edisi = edisi;
		this.status = status;
	}
	
	public Game() {}
	
	@Override
	public String toString() {
		return "Buku [ID_Game=" + ID_Game + ", judul=" + judul + ", developer=" + developer + ", tahun_terbit=" + tahun_terbit
				+ ", edisi=" + edisi + ", status=" + status + "]";
	}
	
}
