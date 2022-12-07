<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>커뮤니티 - 베지터틀</title>
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/owl-carousel/assets/owl.theme.default.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/nouislider/nouislider.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/lightGallery-master/dist/css/lightgallery.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/market-place-1.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
</head>
<style>
	.ps-table--vendor tbody #admintr{
		background-color: #e3ee7e;
		font-weight: bold;
	}
	
</style>
<script>
	// 글쓰기 버튼 클릭시 (로그인 했거나 ,관리자여야 작동)
	function commu_write(){
		if(${sessionScope.sId != null || sessionScope.sId == 'admin'}){
			location.href="CommunityWrite.bo";	
		} else {
			alert("로그인 후 사용가능합니다!");
		}
 	};
 	
 	// 주소창 서블릿 주소 부분까지만 출력
 	$( document ).ready(function() {
		history.replaceState({}, null, location.pathname);
	});
</script>
<body>
   
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
   
   
   
    <div class="ps-page--single">
        <div class="ps-breadcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="/Code_Green">Home</a></li>
                    <li><a href="CommunityList.bo">커뮤니티</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="ps-vendor-dashboard">
        <div class="container">
            <div class="ps-section__header">
                <h3>Community</h3>
                <p>지구와 환경을 위한 발걸음, 여러분의 실천들을 공유해주세요.<br>함께하면 더욱 즐겁게 멀리 갈 수 있습니다.</p>
            </div>
            <div class="ps-section__content">
                <ul class="ps-section__links">
                    <li><a href="welcome_vegun">어서와,비건은 처음이지?</a></li>
                    <li class="active"><a href="CommunityList.bo">커뮤니티</a></li>
                </ul>
                <div class="ps-block--vendor-dashboard">
                    	<div class="ps-block__content">
		                        <div class="table-responsive">
		                            <table class="table ps-table ps-table--vendor">
		                                <thead>
		                                    <tr>
		                                        <th>말머리</th>
		                                        <th>제목</th>
		                                        <th>작성자</th>
		                                        <th>작성일</th>
		                                        <th>추천수</th>
		                                        <th>조회수</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                               	<c:forEach var="board" items="${communityList }">
		                               	<c:choose>
		                               		<c:when test="${board.board_id eq 'admin' }"><tr id="admintr"></c:when>
		                               		<c:otherwise><tr></c:otherwise>
		                               	</c:choose>
		                                        <td>[${board.board_category }]</td>
		                                        
		                                        <td>
		                                        	<!-- 댓글수가 0보다 크면 제목에 댓글수 함께 표시 -->
		                                        	<c:choose>
		                                        	<c:when test="${board.reply_cnt gt 0}">
		                                        		<a href="CommunityDetail.bo?board_idx=${board.board_idx }&pageNum=${pageInfo.pageNum}&board_id=${board.board_id}">${board.board_subject } (${board.reply_cnt })</a>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		<a href="CommunityDetail.bo?board_idx=${board.board_idx }&pageNum=${pageInfo.pageNum}&board_id=${board.board_id}">${board.board_subject }</a>
		                                        	</c:otherwise>
		                                        	</c:choose>
		                                        </td>
		                                        <td>${board.board_id }</td>
		                                        <fmt:parseDate var="dateString" value="${board.board_date}" pattern="yyyyMMdd" />
		                                        <td><fmt:formatDate value="${dateString }" type="date" pattern="yyyy.MM.dd" /></td>
		                                        <td>${board.best_cnt }</td>
		                                        <td>${board.board_readcount }</td>
		                                    </tr>
		                                 </c:forEach>
		                                </tbody>
		                            </table>
		                        </div>
                        
                  <!-- 검색 부분  -->
                    <div id="widget-search-select-together">
		                 <form class="ps-form--widget-search" action="CommunityList.bo" method="get">
	                         <select name="searchType" required>
	                               <option value="">카테고리</option>
	                               <option value="category" <c:if test="${searchType eq 'category'}">selected</c:if>>말머리</option>
	                               <option value="id" <c:if test="${searchType eq 'id'}">selected</c:if>>작성자</option>
	                               <option value="subject" <c:if test="${searchType eq 'subject'}">selected</c:if>>제목</option>
	                               <option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
	                               <option value="subject_content" <c:if test="${searchType eq 'subject_content'}">selected</c:if>>제목+내용</option>
	                          </select>
	                          <aside class="widget widget--blog widget--search">
		                            <input class="form-control" type="text"  name="keyword" value="${keyword }" placeholder="검색">
		                            <button><i class="icon-magnifier"></i></button>
	                   		 </aside>
		                  </form>
	               		<!-- 글작성 버튼 -->
	               		<div class="ps-form--quick-search--com" align="left">
	               			<button id="commu_write" onclick="commu_write()">글쓰기</button>
	               		</div>
                    </div>
                   	
   		 			<!-- 페이징 버튼들 시작 -->
   		 			<%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
                    <div class="ps-pagination">
                        <ul class="pagination">
                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="CommunityList.bo?pageNum=${pageInfo.pageNum - 1}&searchType=${searchType }&keyword=${keyword}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
                            	<c:choose>
                            		<c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="javascript:void(0);">${i }</a></li></c:when>
                            		<c:otherwise><li><a href="CommunityList.bo?pageNum=${i }&searchType=${searchType }&keyword=${keyword}">${i }</a></li></c:otherwise>
                            	</c:choose>
                            </c:forEach>
                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="CommunityList.bo?pageNum=${pageInfo.pageNum + 1}&searchType=${searchType }&keyword=${keyword}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
                        </ul>
                    </div>
                    <!-- 페이징 버튼들 끝 -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 푸터 삽입 -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- 푸터 삽입 -->
    
    
    <script src="/Code_Green/resources/plugins/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins/nouislider/nouislider.min.js"></script>
    <script src="/Code_Green/resources/plugins/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="/Code_Green/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins/imagesloaded.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/masonry.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/isotope.pkgd.min.js"></script>
    <script src="/Code_Green/resources/plugins/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins/slick/slick/slick.min.js"></script>
    <script src="/Code_Green/resources/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script src="/Code_Green/resources/plugins/slick-animation.min.js"></script>
    <script src="/Code_Green/resources/plugins/lightGallery-master/dist/js/lightgallery-all.min.js"></script>
    <script src="/Code_Green/resources/plugins/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
    <script src="/Code_Green/resources/plugins/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins/gmap3.min.js"></script>
    <!-- custom scripts-->
    <script src="/Code_Green/resources/js/main.js"></script>
</body>

</html>