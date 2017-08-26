package com.std.ssh.dao;

import java.util.List;
import com.std.ssh.entities.Course;

public class CourseDao  extends BaseDao{
	
	
	
	public void delete(int id){
		
		String hql = "DELETE FROM Course s where s.c_id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();

	}
	public Course get(Integer s_id){
		return (Course) getSession().get(Course.class,s_id); 
	}
	
	public List<Course> getAll(){
		String hql = "FROM Course";
		return getSession().createQuery(hql).list();
	}
	public void saveOrUpdate(Course c){
		getSession().saveOrUpdate(c);
	}
	
}
