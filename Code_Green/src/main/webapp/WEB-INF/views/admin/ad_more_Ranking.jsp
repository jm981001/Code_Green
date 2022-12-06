<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>랭킹 - 베지터틀</title>
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
    	#starScoreList{
    		display: none;	
    	}
    	
    	#followerList{
    		display: none;	
    	}
    	
    	
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#selectBox').change(function() {
    			
			    var result = $('#selectBox option:selected').val();
			    
			    if (result == 'topSale') {
			    	$('#topSaleList').show();
			    	$('#starScoreList').hide();
			    	$('#followerList').hide();
			    } else if (result == 'starScore') {
			    	$('#starScoreList').show();
			    	$('#topSaleList').hide();
			    	$('#followerList').hide();
			    } else {
			    	$('#followerList').show();
			    	$('#topSaleList').hide();
			    	$('#starScoreList').hide();
			    }
			    
			  }); 
    	});
    	
    	
    </script>
</head>

<body>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="/Code_Green/resources/img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
       <jsp:include page="../inc/ad_menu.jsp"></jsp:include>
       
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>순위</h3>
                    <p>Business Ranking</p>
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="index.html" method="get">
<!--                         <input class="form-control" type="text" placeholder="Search something" /> -->
<!--                         <button><i class="icon-magnifier"></i></button> -->
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="main"><span>메인페이지로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
                <div class="ps-section__header simple">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="ad_Manager_manage" method="get">
                            <div class="ps-form__left">
<!--                                 <div class="form-group"> -->
<!--                                     <input class="form-control" type="text" name="keyword" placeholder="Search..." /> -->
<!--                                 </div> -->
                                <div class="form-group">
                                    <select class="ps-select" name="searchType" id="selectBox">
                                        <option value="topSale">매출순</option>
                                        <option value="starScore">별점순</option>
                                        <option value="follower">팔로워순</option>
                                    </select>
                                </div>
                            </div>
                            <div class="ps-form__right">
                                <button class="ps-btn ps-btn--gray"><i class="icon icon-funnel mr-2"></i>Filter</button>
                            </div>
                        </form>
                    </div>
<!--                     <div class="ps-section__actions"><a class="ps-btn success" href="#"><i class="icon icon-plus mr-2"></i>입점관리</a></div> -->
                </div>
                
                <div class="ps-section__content" id="topSaleList">
                    <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                <tr>
<!--                                    <th>Top</th> -->
                                   <th>브랜드명</th>
                                   <th>매출</th>
                                   <th>팔로워</th>
                                   <th>주문건수</th>
                                   <th>판매수량</th>
                                   <th></th>
                               </tr>
                            </thead>
                            <tbody>
                           <c:forEach var="rank" items="${ranking }">
                               <tr>
<%--                                    <td>${rank.ranking }위</td> --%>
                                   <td><strong>${rank.manager_brandname }</strong></td>
                                   <td><a href="order-detail.html"><strong><fmt:formatNumber value="${rank.brandtotal }" pattern="#,###원"/></strong></a></td>
                                   <td><span class="ps-badge success">${rank.brand_follower }명</span>
                                   </td>
                                   <td><span>${rank.orderCount }건</span>
                                   </td>
                                   <td><strong>${rank.sellCount }건</strong></td>
                                   <td>

                                   </td>
                               </tr>
                           </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
<!-- 별점순 -->
               <div class="ps-section__content" id="starScoreList">
                    <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                <tr>
<!--                                    <th>Top</th> -->
                                   <th>브랜드명</th>
                                   <th>별점</th>
                                   <th>매출</th>
                                   <th>팔로워</th>
                                   <th>주문건수</th>
                                   <th></th>
                               </tr>
                            </thead>
                            <tbody>
                           <c:forEach var="star" items="${starRanking }">
                               <tr>
<%--                                    <td>${star.ranking }위</td> --%>
                                   <td><strong>${star.manager_brandname }</strong></td>
                                   <td>${star.star_score }</td>
                                   <td><a href="order-detail.html"><strong><fmt:formatNumber value="${star.brandtotal }" pattern="#,###원"/></strong></a></td>
                                   <td><span class="ps-badge success">${star.brand_follower }명</span></td>
                                   <td><span>${star.orderCount }건</span></td>
                                   <td></td>
                               </tr>
                           </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
<!-- 팔로워순 -->
				<div class="ps-section__content" id="followerList">
                    <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                <tr>
<!--                                    <th>Top</th> -->
                                   <th>브랜드명</th>
                                   <th>팔로워</th>
                                   <th>매출</th>
                                   <th>주문건수</th>
                                   <th>판매수량</th>
                                   <th></th>
                               </tr>
                            </thead>
                            <tbody>
                           <c:forEach var="follower" items="${followerRanking }">
                               <tr>
<%--                                    <td>${follower.ranking }위</td> --%>
                                   <td><strong>${follower.manager_brandname }</strong></td>
                                   <td><span class="ps-badge success">${follower.brand_follower }명</span>
                                   <td><a href="order-detail.html"><strong><fmt:formatNumber value="${follower.brandtotal }" pattern="#,###원"/></strong></a></td>
                                   <td><span>${follower.orderCount }건</span>
                                   </td>
                                   <td><strong>${follower.sellCount }건</strong></td>
                                   <td>

                                   </td>
                               </tr>
                           </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
		


            </section>
            
            
<!--              <section id="pageList"> -->
			<!-- 현재 페이지번호가 시작 페이지번호보다 클 때 현재 페이지번호 - 1 값으로 페이지 이동 -->

<%-- 			<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %> --%>
<%-- 			<input type="button" value="이전" <%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%>onclick="location.href='ad_Manager_manage?pageNum=${pageInfo.pageNum - 1}'"<%} %>> --%>
			<!-- 시작페이지(startPage) 부터 끝페이지(endPage) 까지 페이지 번호 표시 -->
<!-- 			&nbsp; -->
<%-- 			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }"> --%>
				<!-- 현재 페이지 번호와 i 값이 같을 경우 하이퍼링크 없이 페이지 번호 표시 -->
				<!-- 아니면, pageNum 파라미터를 i 값으로 설정하여 BoardList.bo 서블릿 주소 링크 -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${i eq pageInfo.pageNum }">${i }</c:when> --%>
<%-- 					<c:otherwise><a href="ad_Manager_manage?pageNum=${i }">${i }</a></c:otherwise> --%>
<%-- 				</c:choose> --%>
				&nbsp;
<%-- 			</c:forEach> --%>
		<!-- 현재 페이지번호가 끝 페이지번호보다 작을 때 현재 페이지번호 + 1 값으로 페이지 이동 -->
<%-- 		<input type="button" value="다음" <%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%>onclick="location.href='ad_Manager_manage?pageNum=${pageInfo.pageNum + 1}'"<%} %>> --%>
<!-- 	</section> -->
            
            
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