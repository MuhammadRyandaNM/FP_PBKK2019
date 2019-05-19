package ava.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ava.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory s;
	
	@Transactional
	@Override
	public void tambahUsr(User usr) {
		Session session = s.getCurrentSession();
		session.save(usr);
	}

	@Transactional
	@Override
	public User getUsr(String nrp) {
		Session session = s.getCurrentSession();
		User usr = session.get(User.class, nrp);
		return usr;
	}
	
	@Transactional
	@Override
	public void deleteUsr(User usr) {
		Session session = s.getCurrentSession();
		session.delete(usr);
	}
	
	@Transactional
	@Override
	public List<User> getAllUsr(){
		Session session = s.getCurrentSession();
		List<User> usr = session.createQuery("from User").list();
		return usr;
	}
	
	@Transactional
	@Override
	public void editUsr(User usr) {
		Session session = s.getCurrentSession();
		session.update(usr);
	}
}
