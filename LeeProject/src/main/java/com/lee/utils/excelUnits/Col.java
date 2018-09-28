package com.lee.utils.excelUnits;

/**
 * 字段名
 * @author Lee
 *
 */
public class Col {

	private String name;
	
	private String comment;
	
	private String type;
	
	private String colLength;
	
	private String pk;

	public String getPk() {
		return pk;
	}

	public void setPk(String pk) {
		this.pk = pk;
	}

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getColLength() {
		return colLength;
	}

	public void setColLength(String colLength) {
		this.colLength = colLength;
	}

	@Override
	public String toString() {
		return "Col [name=" + name + ", comment=" + comment + ", type=" + type + ", colLength=" + colLength + ", pk="
				+ pk + "]";
	}
	
	
}
