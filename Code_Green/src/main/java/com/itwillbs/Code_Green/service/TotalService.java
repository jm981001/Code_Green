package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.TotalMapper;
import com.itwillbs.Code_Green.vo.TotalVO;

@Service
public class TotalService {

	@Autowired
	private TotalMapper mapper;
	//총관리자 차트(총매출)
	public List<TotalVO> getChart() {
		// TODO Auto-generated method stub
		return mapper.selectSellChart();
	}
	//브랜드 차트(브랜드 매출 일주일동안)
	public List<TotalVO> brandChart(String manager_id) {
		// TODO Auto-generated method stub
		return mapper.selectBrandChart(manager_id);
	}
	
}
