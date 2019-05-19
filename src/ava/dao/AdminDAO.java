package ava.dao;

import ava.model.Admin;

public interface AdminDAO {
	
	public Admin getAdm (String ID_Admin);
	public void tambahAdm(Admin adm);
	public void editAdm(Admin adm);
}
