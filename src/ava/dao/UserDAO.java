package ava.dao;

import java.util.List;

import ava.model.User;

public interface UserDAO {

	public void tambahUsr(User mhs);
	public User getUsr(String nrp);
	public void deleteUsr(User mhs);
	public List<User> getAllUsr();
	public void editUsr(User mhs);
}
