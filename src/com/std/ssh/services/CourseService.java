package com.std.ssh.services;

import java.util.List;

import com.std.ssh.dao.CourseDao;
import com.std.ssh.entities.Course;


public class CourseService {
	private CourseDao courseDao;
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}
	
	public Course get(Integer id){
		return courseDao.get(id);
	}
	 public void delete(int id){
		 courseDao.delete(id);
	 }
	public List<Course> getAll(){
		return courseDao.getAll();
	}
	
	public void saveOrUpdate(Course c){
		courseDao.saveOrUpdate(c);
	}
}
