package com.lee.service;

import java.util.List;

import com.lee.bean.Movie;
import com.lee.bean.User;

public interface MovieService {

	 int deleteByPrimaryKey(Integer id);

	    int insert(Movie record);

	    int insertSelective(Movie record);

	    Movie selectByPrimaryKey(Integer id);

	    int updateByPrimaryKeySelective(Movie record);

	    int updateByPrimaryKey(Movie record);
	    
	    List<Movie> getAll();
}
