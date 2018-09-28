package com.lee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;


public interface CountryMapper {

	@Select("select CONCAT(name,'-',name_zh) name from t_country order by name")
	List<String> getAll();
}
