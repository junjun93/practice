package com.lee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.lee.dao.CountryMapper;

@RestController
public class SpringBootController {

	@Autowired
	private CountryMapper countryMapper;
	
	@RequestMapping("/getCountrys")
	public List<Map<String, Object>> getCountrys() {
		List<String> cs = countryMapper.getAll();
		List<Map<String, Object>> ls = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < cs.size(); i++) {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("name", cs.get(i));
			ls.add(result);
		}
		return ls;
	}
}
