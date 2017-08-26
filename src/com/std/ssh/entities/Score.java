package com.std.ssh.entities;

public class Score {
	private Integer f_id;
	public Integer getF_id() {
		return f_id;
	}
	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}
	private Student student;
	private Course course;
	private Integer score;
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
}
