package rbtc.dao;

import java.util.List;

import rbtc.model.Game;

public interface GameDAO {

	public void tambahGame(Game game);
	public Game getGame (String isbn);
	public void deleteGame(Game game);
	public List<Game> getAllGame();
	public void editStatus(Game game);
}
