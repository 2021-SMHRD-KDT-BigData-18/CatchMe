package kr.smhrd.mapper;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

import kr.smhrd.entity.Event;
import kr.smhrd.entity.Record;
import kr.smhrd.entity.RestArea;
import kr.smhrd.entity.User;

public interface Mapper {

	List<RestArea> find_RestArea(BigDecimal lat, BigDecimal lng);

	User login(User dto);

	int join(User dto);
	
	Long startRec(String id);

	Long endRec(String username);

	Long getMaxRecSeq(String username);

	int addEvent(Event event);

	User sendSms(String username);
}
