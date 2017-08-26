package com.std.ssh.entities;

public class Banji {
	
	private Integer b_id;
	public Integer getB_id() {
		return b_id;
	}
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}	
	public String getB_name() {
		return b_name;
	}
	@Override
	public String toString() {
		return "Banji [b_id=" + b_id + ", b_name=" + b_name + "]";
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	private String b_name;
	
}
