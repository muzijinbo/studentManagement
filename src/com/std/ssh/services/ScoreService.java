package com.std.ssh.services;

import java.util.List;
import com.std.ssh.dao.ScoreDao;
import com.std.ssh.entities.Score;


public class ScoreService {
	private ScoreDao scoreDao;
	public void setScoreDao(ScoreDao scoreDao) {
		this.scoreDao = scoreDao;
	}
	public Score get(Integer id){
		return scoreDao.get(id);
	}
	 public void delete(int id){
		 scoreDao.delete(id);
	 }
	public List<Score> getAll(){
		return scoreDao.getAll();
	}
	
	public void saveOrUpdate(Score c){
		scoreDao.saveOrUpdate(c);
	}
}
