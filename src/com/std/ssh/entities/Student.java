package com.std.ssh.entities;

import java.io.Serializable;
import java.util.Set;

public class Student implements Serializable{
	private Integer s_id;
	private String s_name;
	private String sex;
	private String birthday;
	private String password;
	private String phone;
	private String address;
	private Banji banji;
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Banji getBanji() {
		return banji;
	}
	public void setBanji(Banji banji) {
		this.banji = banji;
	}
	
	
	
	

}
                