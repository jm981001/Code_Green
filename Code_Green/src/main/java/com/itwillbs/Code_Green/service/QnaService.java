package com.itwillbs.Code_Green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.Code_Green.mapper.QnaMapper;
import com.itwillbs.Code_Green.vo.QnaVO;

@Service
public class QnaService {
	@Autowired
	private QnaMapper mapper;
	
	//상품 상세정보 조회
	public QnaVO getQna(int qna_idx) {
		return mapper.selectQna1(qna_idx);
	}
	
	//상품 문의 등록
	public int registQna(QnaVO qna) {
		return mapper.insertQna(qna);
	}

	//상품 문의 삭제
	public int removeQna(String qna_idx) {
		return mapper.deleteQna(qna_idx);
	}

	//상품 문의 수정
	public int modifyQna(QnaVO qna) {
		return mapper.updateQna(qna);
	}

	// 1:1문의 목록 출력 - 첫메인 , 답변대기, 답변완료 별
	public List<QnaVO> getMantomanList(int startRow, int listLimit, String qna_id, String qna_status) {
		return mapper.selectMantomanList(startRow, listLimit, qna_id, qna_status);
	}
	
	// 1:1문의 갯수카운트 - 첫메인 , 답변대기, 답변완료 별 갯수카운트
	public int getMantomanListCount(String qna_id, String qna_status) {
		return mapper.selectMantomanListCount(qna_id,qna_status);
	}
	
	// 1:1 문의글 작성
	public int writeMtmQna(QnaVO qna) {
		return mapper.insertMtmQna(qna);
	}

	// 1:1 문의글 내용보기
	public QnaVO getMantomanDetail(int qna_idx) {
		return mapper.selectMtmDetail(qna_idx);
	}

	// 1:1 문의글 내용삭제
	public int deleteMantoman(int qna_idx) {
		return mapper.deleteMtm(qna_idx);
	}

	

	


}
