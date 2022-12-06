<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <table class="table ps-table ps-table--notification">
       <thead>
           <tr>
              <th>종류</th>
              <th>제목</th>
              <th>작성일</th>
              <th>답변상태</th>
           </tr>
       </thead>
       <tbody>
       <c:if test="${empty mantomanList }">
       	<td colspan="4">문의내역이 없습니다.</td>
       </c:if>
       
       	<c:forEach var="mtmList" items="${mantomanList }">
           <tr>
               <td>${mtmList.qna_category }</td>
               <td onclick="location.href='QnaMtmDetail.bo?qna_idx=${mtmList.qna_idx}'" style="font-weight: bold">${mtmList.qna_subject }</td>
               <fmt:parseDate var="dateString" value="${mtmList.qna_date}" pattern="yyyyMMdd" />
               <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>
               <c:if test="${mtmList.qna_status eq '답변대기' }">
               <td><span class="status_wait">답변대기</span></td>
               </c:if>
               <c:if test="${mtmList.qna_status eq '답변완료' }">
               <td><span class="status_complete">답변완료</span></td>
               </c:if>
           </tr>
           </c:forEach>
       </tbody>
   </table>
   
    <!-- 페이징 버튼들 시작 -->
	<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
            <div class="ps-pagination">
                <ul class="pagination">
                    <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="myPageQnaList.my?pageNum=${pageInfo.pageNum - 1}&qna_status=${qna_status}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
                    <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
                    	<c:choose>
                    		<c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="javascript:void(0);">${i }</a></li></c:when>
                    		<c:otherwise><li><a href="myPageQnaList.my?pageNum=${i }&qna_status=${qna_status}">${i }</a></li></c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="myPageQnaList.my?pageNum=${pageInfo.pageNum + 1}&qna_status=${qna_status}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
                </ul>
            </div>
	<!-- 페이징 버튼들 끝 -->  