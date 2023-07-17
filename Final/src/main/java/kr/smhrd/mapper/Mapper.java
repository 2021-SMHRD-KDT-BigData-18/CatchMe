package kr.smhrd.mapper;

import java.math.BigDecimal;
import java.util.List;

import kr.smhrd.entity.RestArea;
import kr.smhrd.entity.User;

public interface Mapper {

	List<RestArea> find_RestArea(BigDecimal lat, BigDecimal lng);

	User login(User dto);

	int join(User dto);
}
