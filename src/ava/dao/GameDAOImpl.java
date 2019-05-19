package ava.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ava.model.Game;

@Repository
public class GameDAOImpl implements GameDAO {

	@Autowired
	private SessionFactory s;
	
	@Transactional
	@Override
	public void tambahGame(Game game) {
		Session session = s.getCurrentSession();
		session.save(game);
	}
	
	@Transactional
	@Override
	public Game getGame(String isbn) {
		Session session = s.getCurrentSession();
		Game game = session.get(Game.class, isbn);
		return game;
	}
	
	@Transactional
	@Override
	public void deleteGame(Game game) {
		Session session = s.getCurrentSession();
		session.delete(game);
	}

	@Transactional
	@Override
	public List<Game> getAllGame(){
		Session session = s.getCurrentSession();
		List<Game> game = session.createQuery("from Game").list();
		return game;
	}
	
	@Transactional
	@Override
	public void editStatus(Game game) {
		Session session = s.getCurrentSession();
		session.update(game);
	}
}
