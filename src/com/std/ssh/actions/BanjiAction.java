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
import com.std.ssh.entities.Banji;
import com.std.ssh.services.BanjiService;
import net.sf.json.JSONArray;


public class BanjiAction extends ActionSupport implements RequestAware,
ModelDriven<Banji>,Preparable
{
	/**
	 * 
	 */
	private BanjiService banjiservice;
	
	private static final long serialVersionUID = 1L;
	
	

	public void setBanjiservice(BanjiService banjiservice) {
		this.banjiservice = banjiservice;
	}
	
	public void list(){
		List<Banji> list = banjiservice.getAll();
		//request.put("allBanji", list);
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
	
	
	
	private Integer b_id;
	public void setB_id(Integer b_id) {
		this.b_id = b_id;
	}
	public Integer getB_id() {
		return b_id;
	}
	
	
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}
	private String ids;
	public void setIds(String ids) {
		this.ids = ids;
	}
	public void delete(){	
		
		try {
			String[] iids = ids.split(",");
			for (int i = 0; i < iids.length; i++) {
				System.out.println(iids+"**********i");
				banjiservice.delete(Integer.parseInt(iids[i]));
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		//banjiservice.delete(id);		
		//return "delete";
	}
	public String input(){
		//request.put("depts",banjiService.getAll());
		return INPUT;
	}
	
	
		
	public void save(){	
		System.out.println(model);
		banjiservice.saveOrUpdate(model);
		String str = "{\"status\":\"ok\" , \"message\":\"操作成功!\"}";
		writeJson(str);	
	}
	
	public void prepareSave(){
		if(b_id==null){
			model=new Banji();
		}
		else{
			model=banjiservice.get(b_id);
		}
	}
	
	private Map<String, Object> request;
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request=arg0;
	}		
	private Banji model;

	public void setModel(Banji model) {
		this.model = model;
	}
	@Override
	public Banji getModel() {
		// TODO Auto-generated method stub
		return model;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
	}
}
