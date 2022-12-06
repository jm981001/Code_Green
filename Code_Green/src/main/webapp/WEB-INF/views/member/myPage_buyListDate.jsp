<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                      <table class="table ps-table">
                          <thead>
                              <tr>
                                  <th>주문날짜</th>
                                  <th>주문번호</th>
                                  <th>상품갯수</th>
                                  <th>결제방법</th>
                                  <th>결제금액</th>
                                  <th>주문상태</th>
                              </tr>
                          </thead>
                          <tbody>
                          <c:if test="${empty buyList }">
                          	<td colspan="6">최근주문내역이 없습니다.</td>
                          </c:if>
                          
                              <c:forEach var="buyList" items="${buyList }">
                              <tr>
                              	<fmt:parseDate var="dateString" value="${buyList.sell_date }" pattern="yyyy-MM-dd HH:mm:ss" />
	        					<td>
	        					<span><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd HH:mm:ss" /></span>
	        					</td>
                                <td>
                                   <div class="ps-product--cart">
                                        <div class="ps-product__content"><a href="myBuyListDetail.my?sell_order_number=${buyList.sell_order_number }">${buyList.sell_order_number }</a></div>
                                    </div>
                                </td>
                                <td>${buyList.sell_amount }건</td>
                                <td>${buyList.sell_pay_type }</td>
                                <td><fmt:formatNumber value="${buyList.sell_total_price }" pattern="#,###"/>원</td>
                                <td>${buyList.sell_status }</td>
                              </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                      
		             <!-- 페이징 버튼들 시작 -->
					 <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
					       <div class="ps-pagination">
					           <ul class="pagination">
					               <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="myBuyList.my?pageNum=${pageInfo.pageNum - 1}&period=${period}&date1=&date2="><%}%><i class="icon-chevron-left"></i>Prev</a></li>
					               <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					               	<c:choose>
					               		<c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="javascript:void(0);">${i }</a></li></c:when>
					               		<c:otherwise><li><a href="myBuyList.my?pageNum=${i }&period=${period}&date1=&date2=">${i }</a></li></c:otherwise>
					               	</c:choose>
					               </c:forEach>
					               <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="myBuyList.my?pageNum=${pageInfo.pageNum + 1}&period=${period}&date1=&date2="><%}%>Next<i class="icon-chevron-right"></i></a></li>
					           </ul>
					       </div>
		      		 <!-- 페이징 버튼들 끝 -->  
