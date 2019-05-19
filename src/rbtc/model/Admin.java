package rbtc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admin")
public class Admin {
	@Id
	@Column(name="ID_Admin")
	private String ID_Admin;
	
	@Column(name="nama")
	private String nama;
	
	@Column(name="password")
	private String password;
	
	@Column(name="email")
	private String email;
	
	@Column(name="no_hp")
	private String nohp;
	
	public String getID_Admin() {
		return ID_Admin;
	}
	public void setID_Admin(String ID_Admin) {
		this.ID_Admin = ID_Admin;
	}
	public String getNama() {
		return nama;
	}
	public void setNama(String nama) {
		this.nama = nama;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	
	public Admin() {}
	public Admin(String ID_Admin, String nama, String password, String email, String nohp) {
		super();
		this.ID_Admin = ID_Admin;
		this.nama = nama;
		this.password = password;
		this.email = email;
		this.nohp = nohp;
	}
	
	@Override
	public String toString() {
		return "Admin [ID_Admin=" + ID_Admin + ", nama=" + nama + ", password=" + password + ", email=" + email + ", nohp="
				+ nohp + "]";
	}
	
	
	
}
