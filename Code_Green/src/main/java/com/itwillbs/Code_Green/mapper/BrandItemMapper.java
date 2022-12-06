package com.itwillbs.Code_Green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.Code_Green.vo.ItemVO;
import com.itwillbs.Code_Green.vo.ManagerVO;

public interface BrandItemMapper {
	
	// 브랜드리스트 가져와서 메인에 출력
	List<ManagerVO> selectBrandList();

	// 브랜드별 아이템리스트 출력
	List<ItemVO> selectBrandItemList(@Param("manager_idx")int manager_idx,@Param("ordering") String ordering);
	
	// 브랜드별 정보 및 아이템수 출력
	ManagerVO selectBrandDetail(int manager_idx);
	
	// 브랜드 팔로우 유무확인
	int selectBrandFollow(@Param("manager_idx")int manager_idx, @Param("member_idx") int member_idx);

	// 팔로우하기
	int insertFollow(@Param("manager_idx")int manager_idx, @Param("member_idx") int member_idx);

	// 언팔로우하기
	int deleteFollow(@Param("manager_idx")int manager_idx, @Param("member_idx") int member_idx);
	
	// 브랜드별 아이템수 카운트
	int selectBrandListCount(@Param("manager_idx") int manager_idx);

	// 멀티체크 리스팅 아이템리스트 출력 ( + 정렬 ) 
	List<ItemVO> selectBrandItemListListing(@Param("brands")List<String> brands,@Param("ordering") String ordering);

	

	
	
}
