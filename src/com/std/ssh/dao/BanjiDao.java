package com.std.ssh.dao;

import java.util.List;

import com.std.ssh.entities.Banji;

public class BanjiDao  extends BaseDao{
	
	
	public Banji get(Integer b_id){
		return (Banji) getSession().get(Banji.class,b_id); 
	}
	public void delete(int id){
		
		String hql = "DELETE FROM Banji b where b.b_id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();

	}
	public List<Banji> getAll(){
		String hql = "FROM Banji";
		return getSession().createQuery(hql).list();
	}
	public void saveOrUpdate(Banji banji){
		getSession().saveOrUpdate(banji);
	}
	
}
