<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
    <title>공지상세조회 - 베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_admin/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
    
    
    <!--   글쓰기 게시판 API 글쓰기 게시판 API 글쓰기 게시판 API 글쓰기 게시판 API 글쓰기 게시판 API 글쓰기 게시판 API-->
    <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!--   글쓰기 게시판 API 글쓰기 게시판 API 글쓰기 게시판 API 글쓰기 게시판 API 글쓰기 게시판 API 글쓰기 게시판 API-->    
 
    
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
                    <h3>공지 상세조회</h3>
                    <p>Notice Management</p>
                </div>
                <div class="header__center">
<!--                     <form class="ps-form--search-bar" action="index.html" method="get"> -->
<!--                         <input class="form-control" type="text" placeholder="Search something" /> -->
<!--                         <button><i class="icon-magnifier"></i></button> -->
<!--                     </form> -->
                </div>
                <div class="header__right"><a class="header__site-link" href="ad_Notice"><span>목록으로 돌아가기</span><i class="icon-exit-right"></i></a></div>
            </header>
            <section class="ps-items-listing">
                <div class="ps-section__header simple">
                    <div class="ps-section__filter">
<!-- 	여기없애면 안됨 페이지 어그러짐		 여기없애면 안됨 페이지 어그러짐	 여기없애면 안됨 페이지 어그러짐-------------------------->
                    </div>
                </div>
                <div class="ps-section__content">
                    <div class="table-responsive">


<!--   <tbody>  가운데 정렬 넣음   <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음-->
<!--   <tbody>  가운데 정렬 넣음   <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음  <tbody>  가운데 정렬 넣음-->


				 <div ></div>                   
			 <table class="table table-bordered" style="text-align: center;">
				  <thead>
				    <tr>
				      <td scope="col">제목</td>
				      <td scope="col" colspan="3">${noticeDetail.board_subject }</td>
<!-- 					<th scope="col">작성일</th> -->
<!-- 					<th scope="col">Handle</th> -->
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td scope="row">작성자</td>
				      <td>${noticeDetail.board_id }</td>
				      <td>작성일</td>
				      <fmt:parseDate var="dateString" value="${noticeDetail.board_date }" pattern="yyyyMMdd" />	
                      <td><fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd"/></td>
				    </tr>
				    <tr>
				      <td scope="row" rowspan="2">내용</td>
<!-- 					<td>Jacob</td> -->
<!-- 					<td>Thornton</td> -->
<!-- 					<td>@fat</td> -->
				    </tr>
				    <tr>
<!-- 					 <th scope="row">3</th> -->
				      <td colspan="4">${noticeDetail.board_content }</td>
<!-- 				     <td>@twitter</td> -->
				    </tr>
				  </tbody>
				</table>
                    </div>
                      	<div align="right" ><button type="button" onclick="location.href='ad_Notice_Update?board_idx=${noticeDetail.board_idx }'" class="btn btn-info" style="font-size: 13px"><strong>수정하기</strong></button></div>
                </div>
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