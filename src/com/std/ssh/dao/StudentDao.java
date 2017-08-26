package com.std.ssh.dao;

import java.util.List;
import com.std.ssh.entities.Student;

public class StudentDao  extends BaseDao{
	
	
	
	public void delete(int id){
		
		String hql = "DELETE FROM Studnet s where s.s_id = ?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();

	}
	public Student get(Integer s_id){
		return (Student) getSession().get(Student.class,s_id); 
	}
	public List<Student> getAll(){
		String hql = "FROM Student";
		return getSession().createQuery(hql).list();
	}
	public void saveOrUpdate(Student student){
		getSession().saveOrUpdate(student);
	}
	
}
