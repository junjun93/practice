package com.lee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lee.bean.Movie;
import com.lee.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private MovieService movieService;

	public MovieService getMovieService() {
		return movieService;
	}

	public void setMovieService(MovieService movieService) {
		this.movieService = movieService;
	}

	@RequestMapping("/movieIndex")
	public String movieIndex(HttpSession session) {
		List<Movie> movieList=movieService.getAll();
		session.setAttribute("movieList", movieList);
		return "movie/movieIndex";
	}
	
	@RequestMapping("/movieInfo")
	public String movieInfo1(Model model,HttpServletRequest request) {
		Integer id  = Integer.valueOf(request.getParameter("id"));
		Movie movie=movieService.selectByPrimaryKey(id);
		 model.addAttribute("movie", movie);
//		session.setAttribute("movie", movie);
//		System.out.println(movie+"————————————");
		return "movie/movieInfo";
	}
	
}
