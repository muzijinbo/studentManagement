package com.std.ssh.services;

import java.util.List;

import com.std.ssh.dao.BanjiDao;
import com.std.ssh.entities.Banji;

public class BanjiService {
	private BanjiDao banjidao;
	
	public void setBanjidao(BanjiDao banjidao) {
		this.banjidao = banjidao;
	}
	 public void delete(int id){
		 banjidao.delete(id);
	 }
	public List<Banji> getAll(){
		return banjidao.getAll();
	}
	public Banji get(Integer id){
		return banjidao.get(id);
	}
	public void saveOrUpdate(Banji banji){
		banjidao.saveOrUpdate(banji);
	}
}
