package com.lee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping(value={"","/","index"})
	public String admin() {
			return "admin/admin";
	}
	
	@RequestMapping("/{page}")
	public String snake(@PathVariable String page) {
		return "admin/" + page;
	}

	
    
}
