package com.itwillbs.Code_Green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.itwillbs.Code_Green.service.TotalService;
import com.itwillbs.Code_Green.vo.TotalVO;

@Controller
public class TotalController {

	@Autowired
	private TotalService service;
	
	
	//------------전체관리자 메인----------------------------
	@ResponseBody
	@RequestMapping(value = "/drawChart", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String drawChart(Model model,HttpSession session) { 

		
		
		 
		Gson gson = new Gson();
		
		List<TotalVO> sellChart = service.getChart();
//		System.out.println("총매출 차트 : " + sellChart);
//		model.addAttribute("sellChart", sellChart);
	
		return gson.toJson(sellChart);
		
	}
	
	
	//------------브랜드관리자 메인----------------------------
		@ResponseBody
		@RequestMapping(value = "/brandChart", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
		public String brandChart(Model model, HttpSession session, String manager_id) { 

			
//			System.out.println("얍얍" + manager_id);
			 
			Gson gson = new Gson();
			
			List<TotalVO> brandChart = service.brandChart(manager_id);
			System.out.println("한시간 : " + brandChart);
//			model.addAttribute("sellChart", sellChart);
		
			return gson.toJson(brandChart);
			
		}
	
	
	
	
	
	
}
