package kr.smhrd.web;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.entity.Event;
import kr.smhrd.entity.Record;
import kr.smhrd.entity.RestArea;
import kr.smhrd.entity.Sms;
import kr.smhrd.entity.User;
import kr.smhrd.mapper.Mapper;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	@Autowired
	private Mapper mapper;

	@GetMapping("/distance")
	@ResponseBody
	public List<RestArea> find_RestArea(@RequestParam("lat") BigDecimal lat, @RequestParam("lng") BigDecimal lng) {
		List<RestArea> data = mapper.find_RestArea(lng, lat);
		return data;
	}
	
	@PostMapping("/startRec")
	public void startRec(HttpSession session,@RequestParam("username") String username) {
		Long data = mapper.startRec(username);
		return ;
	}
	
	@PostMapping("/endRec")
	public void endRec(@RequestParam("username") String username) {
		Long date = mapper.endRec(username);
		return ;
	}
	
	@PostMapping("/notify_sleep")
	public void notify_sleep(@RequestParam("username") String username,@RequestParam("img_path") String img_path) {
		int rec_seq =mapper.getMaxRecSeq(username);
		Event event = new Event();
		event.setRec_seq(rec_seq);
		event.setEvent_img(img_path);
		int row = mapper.addEvent(event);
		return ;
	}
	@PostMapping("/smsRecord")
	public void sms_record(@RequestParam("username")String username) {
		int rec_seq = mapper.getMaxRecSeq(username);
		System.out.println("smscon rec_seq: "+rec_seq);
		List<String> event = mapper.search_event_at(rec_seq);
		System.out.println("event확인" +event);
	    Sms sms = new Sms();
	    sms.setRec_seq(rec_seq);
	    sms.setId(username);
	    return;
	}
	
	

}