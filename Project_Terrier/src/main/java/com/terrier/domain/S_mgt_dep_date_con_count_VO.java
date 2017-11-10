package com.terrier.domain;

public class S_mgt_dep_date_con_count_VO {

	String date;//날짜
	String controller;//ON,OFF정보
	String dep;//부서정보
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getController() {
		return controller;
	}
	public void setController(String controller) {
		this.controller = controller;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
}
