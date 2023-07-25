package kr.smhrd.web;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	public void startRec(HttpSession session, @RequestParam("username") String username) {
		Long data = mapper.startRec(username);
	}

	@PostMapping("/endRec")
	public void endRec(@RequestParam("username") String username) {
		Long date = mapper.endRec(username);
	}

	@PostMapping("/notify_sleep")
	public void notify_sleep(@RequestParam("username") String username, @RequestParam("img_path") String img_path) {
		int rec_seq = mapper.getMaxRecSeq(username);
		Event event = new Event();
		event.setRec_seq(rec_seq);
		event.setEvent_img(img_path);
		int row = mapper.addEvent(event);
	}

	@PostMapping("/smsRecord")
	public void getMaxRecSeq(@RequestParam("username") String username) {
		int rec_seq = mapper.getMaxRecSeq(username);
		List<Event> data = mapper.search_event_at(rec_seq);
		if (data == null) {
			System.out.println("데이터 null");
		} else {
			for (Event event : data) {
				Sms sms = new Sms();
				sms.setId(username);
				sms.setRec_seq(rec_seq);
				sms.setEvent_at(event.getEvent_at());
				sms.setSms_content(event.getEvent_content());
				int row = mapper.sms_record(sms);
				if (row > 0) {
					System.out.println("sms 저장완료");
				} else {
					System.out.println("sms 저장실패");
				}
			}

		}

	}
}