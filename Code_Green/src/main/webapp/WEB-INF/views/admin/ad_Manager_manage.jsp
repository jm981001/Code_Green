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
    <title>기업관리 - 베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
     <script type="text/javascript">
	function confirmDelete(id) {
		// confirm() 함수를 사용하여 "삭제하시겠습니까?" 메세지로 확인받아 result 변수에 저장 후
		// result 변수값이 true 일 경우 MemberDelete.me 서블릿 주소 요청(파라미터로 id 전달)
		let result = confirm(id + "을 추방하시겠습니까?");
		
		if(result) {
			location.href="ad_ManagerDelete?id=" + id;
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
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
     <jsp:include page="../inc/ad_menu.jsp"></jsp:include>
     
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>기업 관리 | <a href="ad_Manager_auth">승인 대기</a></h3>
                    <p>Business Management</p>
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
                                <div class="form-group">
                                    <input class="form-control" type="text" name="keyword" placeholder="Search..." />
                                </div>
                                <div class="form-group">
                                    <select class="ps-select" name="searchType">
                                        <option value="brandName">기업명</option>
                                        <option value="name">이름</option>
                                        <option value="id">아이디</option>
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
                
                <div class="ps-section__content">
                    <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                <tr>
                                    <th>기업명</th>
                                     <th>아이디</th>
                                    <th>이름</th>
                                    <th>전화번호</th>
                                    <th>이메일</th>
                                    <th>가입일</th>
                                    <th>승인상태</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="mgList" items="${managerList }">
                                <tr>
<!-- A태그 추가 클릭시 - 상세 정보 조회 페이지로 이동  -->
                                
                                    <td><a href="ad_Manager_detail?id=${mgList.manager_id }&auth=${mgList.manager_adminauth }"><strong>${mgList.manager_brandname }</strong></a></td>
                                    <td>${mgList.manager_id }</td>
                                    <td>${mgList.manager_name }</td>
                                    <td>${mgList.manager_phone }</td>
                                    <td>${mgList.manager_email }</td>
<!--                                     <td><span class="ps-badge success">active</span> -->
<!--                                     </td> -->
										<fmt:parseDate var="dateString" value="${mgList.manager_date }" pattern="yyyyMMddHH:mm:ss" />	
                                    <td><fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd"/></td>
                                    <td><button type="button" class="btn btn-info" style="font-size: 13px"><strong>${fn:replace(mgList.manager_adminauth, 'Y', '승인완료')}</strong></button></td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">상품목록</a>
                                            <a class="dropdown-item" onclick="confirmDelete('${mgList.manager_id}')">탈퇴시키기</a></div>
                                        </div>
                                    </td>
                                </tr>
                             </c:forEach>
                                   
                            </tbody>
                        </table>
                    </div>
                </div>
                <div align="right" style="margin-top: 50px">
                   <!-- 페이징 버튼들 시작 -->
				                   <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
				                    <div class="ps-pagination">
				                        <ul class="pagination">
				                           
				                            <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="ad_Manager_manage?pageNum=${pageInfo.pageNum - 1}&searchType=${searchType }&keyword=${keyword}"><%}%><i class="icon-chevron-left"></i></a></li>
				                            <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				                               <c:choose>
				                                  <c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="#">${i }</a></li></c:when>
				                                  <c:otherwise><li><a href="ad_Manager_manage?pageNum=${i }&searchType=${searchType }&keyword=${keyword}">${i }</a></li></c:otherwise>
				                               </c:choose>
				                            </c:forEach>
				                            <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="ad_Manager_manage?pageNum=${pageInfo.pageNum + 1}&searchType=${searchType }&keyword=${keyword}"><%}%><i class="icon-chevron-right"></i></a></li>
				                        </ul>
				                    </div>
				  <!-- 페이징 버튼들 끝 -->
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