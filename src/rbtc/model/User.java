package rbtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	
	@Column(name="nama")
	private String nama;
	
	@Id
	@Column(name="ID_user")
	private String ID_user;
	
	@Column(name="email")
	private String email;
	
	@Column(name="no_hp")
	private String nohp;
	
	@Column(name="password")
	private String password;
	
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNama() {
		return nama;
	}
	public void setNama(String nama) {
		this.nama = nama;
	}
	public String getID_user() {
		return ID_user;
	}
	public void setID_user(String ID_user) {
		this.ID_user = ID_user;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNohp() {
		return nohp;
	}
	public void setNohp(String nohp) {
		this.nohp = nohp;
	}
	
	public User() {}
	public User(String nama, String ID_user, String email, String nohp, String password) {
		super();
		this.nama = nama;
		this.ID_user = ID_user;
		this.email = email;
		this.nohp = nohp;
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "User [nama=" + nama + ", ID_user=" + ID_user + ", email=" + email + ", nohp=" + nohp + ", password="
				+ password + "]";
	}
	
	
	
}
