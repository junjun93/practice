package com.lee.bean;

import java.io.Serializable;

public class PersonalSetting implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String font ;
	private String theme;


	public PersonalSetting(String font, String theme) {
		super();
		this.font = font;
		this.theme = theme;
	}


	public String getFont() {
		return font;
	}


	public void setFont(String font) {
		this.font = font;
	}


	public String getTheme() {
		return theme;
	}


	public void setTheme(String theme) {
		this.theme = theme;
	}


	public PersonalSetting() {
		super();
	}


	@Override
	public String toString() {
		return "PersonalSetting [font=" + font + ", theme=" + theme + "]";
	}
	
	
}
