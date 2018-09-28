package com.lee.service.Impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lee.bean.Movie;
import com.lee.dao.MovieMapper;
import com.lee.jedis.JedisClient;
import com.lee.service.MovieService;
import com.lee.utils.JSONUtil;

@Service("movieService")
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieMapper movieDao;
	
	@Autowired
	private JedisClient client;

	public MovieMapper getMovieDao() {
		return movieDao;
	}

	public void setMovieDao(MovieMapper movieDao) {
		this.movieDao = movieDao;
	}

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insert(Movie record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSelective(Movie record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Movie selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return movieDao.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(Movie record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateByPrimaryKey(Movie record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Movie> getAll() {
		// 添加缓存不能影响正常的业务逻辑,捕捉异常
		// 判断 是否redis中有数据 如果有 直接从redis中获取数据 返回
		try {
			String jsonstr = client.hget("movie","all");// 从redis数据库中获取内容分类下的所有的内容。
			// 如果存在，说明有缓存
			if (StringUtils.isNotBlank(jsonstr)) {
				System.out.println("这里有缓存啦！！！！！");
				return JSONUtil.string2ObjectArray(Movie.class, jsonstr);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		// 如果redis中没有缓存就从数据库中取
		List<Movie> list =movieDao.getAll();

		// 将数据写入到redis数据库中

		// 注入jedisclient 
		// 调用方法写入redis key - value
		try {
			System.out.println("没有缓存！！！！！！");
			client.hset("movie","all", JSONUtil.object2String(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}