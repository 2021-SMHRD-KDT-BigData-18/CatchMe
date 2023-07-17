package kr.smhrd.mapper;

import java.math.BigDecimal;
import java.util.List;

import kr.smhrd.entity.RestArea;
import kr.smhrd.entity.User;

public interface Mapper {

	List<RestArea> find_RestArea(BigDecimal lat, BigDecimal lng);

	String login(User dto);

	String join(User dto);
}
