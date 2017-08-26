package com.std.ssh.actions;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.std.ssh.entities.Course;
import com.std.ssh.services.CourseService;


public class CourseAction extends ActionSupport implements RequestAware,
ModelDriven<Course>,Preparable
{
	

	/**
	 * 
	 */
	private CourseService CourseService;
	
	private static final long serialVersionUID = 1L;
	
	

	public void setCourseService(CourseService CourseService) {
		this.CourseService = CourseService;
	}
	
	public void list(){
		System.out.println(id);
		List<Course> list = CourseService.getAll();
		//request.put("allCourse", list);
		writeJson(list);		
	}
	

	
	public String getJsonString(Object o){
		ObjectMapper om = new ObjectMapper();
		StringWriter sw = new StringWriter();
		try {
			JsonGenerator jg = new JsonFactory().createJsonGenerator(sw);
			om.writeValue(jg, o);
			jg.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sw.toString();
	}
	public void writeJson(Object o){
		String json = getJsonString(o);
		try {
			ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
			ServletActionContext.getResponse().getWriter().write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	private Integer id;
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	
	
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}
	public String delete(){	
		try {
			CourseService.delete(id);
	
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}	
		}
		return "delete";
	}
	public String input(){
		return INPUT;
	}
	
	
		
	public String save(){	
		CourseService.saveOrUpdate(model);
		return SUCCESS;
	}
	
	public void prepareSave(){
		if(id == null){
			model=new Course();
		}
		else{
			model = CourseService.get(id);
		}
	}
	
	private Map<String, Object> request;
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request=arg0;
	}

	
		
	private Course model;

	public void setModel(Course model) {
		this.model = model;
	}
	@Override
	public Course getModel() {
		// TODO Auto-generated method stub
		return model;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
	}
}
