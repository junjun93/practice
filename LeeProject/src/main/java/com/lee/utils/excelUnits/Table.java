package com.lee.utils.excelUnits;

import java.util.List;

public class Table {

	private String name;
	
	private String comment;
	
	private List<Col> colList;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public List<Col> getColList() {
		return colList;
	}

	public void setColList(List<Col> colList) {
		this.colList = colList;
	}

	@Override
	public String toString() {
		return "Table [name=" + name + ", comment=" + comment + ", colList=" + colList + "]";
	}
	
	
}
