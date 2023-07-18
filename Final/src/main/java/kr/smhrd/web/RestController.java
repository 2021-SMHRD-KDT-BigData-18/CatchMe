package kr.smhrd.web;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.RestArea;
import kr.smhrd.mapper.Mapper;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	@Autowired
	private Mapper mapper;

	@GetMapping("/distance")
	@ResponseBody
	public List<RestArea> find_RestArea(@RequestParam("lat") BigDecimal lat, @RequestParam("lng") BigDecimal lng) {
		System.out.println("lng값 : " + lng);
		System.out.println("lat값 : " + lat);
		List<RestArea> data = mapper.find_RestArea(lng, lat);
		System.out.println(data);
		return data;
	}
	
	

}