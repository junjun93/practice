package com.lee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/game")
public class GameController {

	@RequestMapping("/gameIndex")
	public String gameIndex() {
		return "game/gameIndex";
	}

	@RequestMapping("/{page}")
	// 如果参数名一样可以不用定义value
	public String snake(@PathVariable(value = "page") String page) {
		return "game/" + page + "/index";
	}

	@RequestMapping("/g2048")
	public String g2048() {
		return "game/2048/index";
	}
}
