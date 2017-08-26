package com.std.ssh.dao;

import java.util.List;

import com.std.ssh.entities.Banji;
import com.std.ssh.entities.Score;

public class ScoreDao  extends BaseDao{
	
	
	
	public void delete(int id){
		
		String hql = "DELETE FROM Score s where s.f_id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();

	}
	public Score get(Integer s_id){
		return (Score) getSession().get(Score.class,s_id); 
	}
	public List<Score> getAll(){
		String hql = "FROM Score";
		return getSession().createQuery(hql).list();
	}
	public void saveOrUpdate(Score score){
		getSession().saveOrUpdate(score);
	}
	
}
