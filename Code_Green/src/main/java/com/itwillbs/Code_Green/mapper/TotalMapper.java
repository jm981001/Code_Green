package com.itwillbs.Code_Green.mapper;

import java.util.List;

import com.itwillbs.Code_Green.vo.TotalVO;

public interface TotalMapper {
	//총관리자 차트(총매출)
	List<TotalVO> selectSellChart();
	//브랜드 차트(브랜드 매출 일주일동안)
	List<TotalVO> selectBrandChart(String manager_id);

}
