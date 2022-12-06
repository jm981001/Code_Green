<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link rel="icon" href="/Code_Green/resources/img/favicon.png">
    <title>주문취소요청 - 베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
    
    <style type="text/css">
    .header--dashboard .header__left {
    	max-width: 400px;
    }
    
    .header--dashboard > * {
    	flex-basis: 130%;
    	}
    #cancelSuccessList {
    	display: none;
    }
    
    
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#selectBox').change(function() {
    			
			    var result = $('#selectBox option:selected').val();
			    
			    if (result == 'cancelRequest') {
			    	$('#cancelRequestList').show();
			    	$('#cancelSuccessList').hide();
			    } else if (result == 'cancelSuccess') {
			    	$('#cancelSuccessList').show();
			    	$('#cancelRequestList').hide();
			    } 
			    
			  }); 
    	});
    	
    	
    	function approval(idx, status) {
    		
    		let result = confirm("결제취소를 승인하시겠습니까?");
    		
    		if(result) {
    			location.href="ad_statusChange?sell_idx=" + idx + "&sell_cancel_status=" + status;
    		}
    	}
    	
    	
    </script>
</head>

<body>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="/Code_Green/resources/img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="main"><i class="icon-exit-right"></i></a></div>
    </header>
  
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
        <jsp:include page="../inc/ad_menu.jsp"></jsp:include>
        
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3><a href="ad_Cancle_Order">결제취소요청</a></h3>
                    <p>Cancle Order</p>
                </div>
                <div class="header__center">
                </div>
                <div class="header__right"><a class="header__site-link" href="main"><span>메인페이지로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
                <div class="ps-section__header simple">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="ad_One_Board" method="get">
                        
                            <div class="ps-form__left">
                               <div class="form-group">
                                    <select class="ps-select" name="searchType" id="selectBox">
                                        <option value="cancelRequest">취소요청</option>
                                        <option value="cancelSuccess" onclick="ad_cancelSuccess">승인목록</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
<!--                     <div class="ps-section__actions"><a class="ps-btn success" href="#"><i class="icon icon-plus mr-2"></i>Add Customer</a></div> -->
                </div>
                <div class="ps-section__content" id="cancelRequestList">
                    <div class="table-responsive">
                        <table class="table ps-table" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th>금액</th>
                                    <th>주문번호</th>
                                    <th>작성자(아이디)</th>
                                    <th>결제일</th>
                                    <th>취소요청</th>
                                </tr>
                            </thead>
                            <tbody >
                            <c:forEach var="cList" items="${CancelRequest }">
                                <tr>
                                	<td><fmt:formatNumber value="${cList.sell_total_price }" pattern="#,###원"/></td>
                                    <td onclick="location.href='#'"><strong>${cList.sell_order_number }</strong></td>
                                    <td>${cList.member_id }</td>
                                    <fmt:parseDate var="dateString" value="${cList.sell_pay_date }" pattern="yyyy-MM-ddHH:mm:ss" />	
                      				<td><fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd"/></td>
                                    <td><button type="button" class="btn btn-info" onclick="approval('${cList.sell_idx }','${cList.sell_cancel_status }')" style="font-size: 13px">
                                    <strong>${fn:replace(cList.sell_cancel_status, '취소요청', '승인하기')}</strong></button>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">반려하기</a></div>
                                        </div>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
<!-- 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료 승인완료-->
                
                 <div class="ps-section__content" id="cancelSuccessList">
                    <div class="table-responsive">
                        <table class="table ps-table" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th>금액</th>
                                    <th>주문번호</th>
                                    <th>작성자(아이디)</th>
                                    <th>결제일</th>
                                    <th>취소요청</th>
                                </tr>
                            </thead>
                            <tbody >
                            <c:forEach var="csList" items="${cancelSuccess }">
                                <tr>
                                	<td><fmt:formatNumber value="${csList.sell_total_price }" pattern="#,###원"/></td>
                                    <td onclick="location.href='#'"><strong>${csList.sell_order_number }</strong></td>
                                    <td>${csList.member_id }</td>
                                    <fmt:parseDate var="dateString" value="${csList.sell_pay_date }" pattern="yyyy-MM-ddHH:mm:ss" />	
                      				<td><fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd"/></td>
                                    <td><button type="button" class="btn btn-info" style="font-size: 13px">
                                    	<strong>${fn:replace(csList.sell_cancel_status, '취소승인', '승인완료')}</strong></button>
                                    </td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">반려하기</a></div>
                                        </div>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                

<!--                <div class="ps-section__footer"> -->
<!--                    페이징 버튼들 시작 -->
<%-- 				                   <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %> --%>
<!-- 				                    <div class="ps-pagination"> -->
<!-- 				                        <ul class="pagination"> -->
				                           
<%-- 				                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="ad_Cancle_Order?pageNum=${pageInfo.pageNum - 1}&searchType=${searchType }&keyword=${keyword}"><%}%><i class="icon-chevron-left"></i></a></li> --%>
<%-- 				                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }"> --%>
<%-- 				                               <c:choose> --%>
<%-- 				                                  <c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="#">${i }</a></li></c:when> --%>
<%-- 				                                  <c:otherwise><li><a href="ad_Cancle_Order?pageNum=${i }&searchType=${searchType }&keyword=${keyword}">${i }</a></li></c:otherwise> --%>
<%-- 				                               </c:choose> --%>
<%-- 				                            </c:forEach> --%>
<%-- 				                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="ad_Cancle_Order?pageNum=${pageInfo.pageNum + 1}&searchType=${searchType }&keyword=${keyword}"><%}%><i class="icon-chevron-right"></i></a></li> --%>
<!-- 				                        </ul> -->
<!-- 				                    </div> -->
<!-- 				  페이징 버튼들 끝 -->
<!--                 		</div> -->
            </section>
        </div>
    </main>
    <script src="/Code_Green/resources/plugins_admin/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <!-- custom code-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>