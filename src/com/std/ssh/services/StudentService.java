package com.std.ssh.services;

import java.util.List;
import com.std.ssh.dao.StudentDao;
import com.std.ssh.entities.Student;


public class StudentService {
	private StudentDao studentDao;
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	public Student get(Integer id){
		return studentDao.get(id);
	}
	 public void delete(int id){
		 studentDao.delete(id);
	 }
	public List<Student> getAll(){
		return studentDao.getAll();
	}
	
	public void saveOrUpdate(Student c){
		studentDao.saveOrUpdate(c);
	}
}
