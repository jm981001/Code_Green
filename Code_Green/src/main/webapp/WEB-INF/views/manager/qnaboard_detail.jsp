<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="favicon.png" rel="icon">
    <title>답변관리페이지-베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">
<!-- 글쓰기  API -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- 글쓰기  API -->
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- 글쓰기  API -->
</head>
<body>
    <header class="header--mobile">
        <div class="header__left">
            <button class="ps-drawer-toggle"><i class="icon icon-menu"></i></button><img src="" alt="">
        </div>
        <div class="header__center"><a class="ps-logo" href="#"><img src="img/logo.png" alt=""></a></div>
        <div class="header__right"><a class="header__site-link" href="#"><i class="icon-exit-right"></i></a></div>
    </header>
   
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
    
     <jsp:include page="../inc/manager_menu.jsp"></jsp:include>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>답변관리</h3>
                </div>
                <div class="header__center">
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>

            </header>

       <div class="ps-main__wrapper">
        <div class="header__center">
<%--         <form class="ps-form--search-bar" action="qnaboard_answer?qna_idx="${QnaInfo.qna_idx }" method="get"name="answerForm"> --%>
              <input type="hidden" id="qna_idx" name="qna_idx" value="${QnaInfo.qna_idx }">
                 <input type="hidden" id="qna_id" name="qna_id" value="${QnaInfo.qna_id }">

 
       <table class="table ps-table">
              
                    <h2>게시판 답변 관리</h2>
                    <hr>
                       <thead>
                                <tr>
                                    <th>문의번호</th>
                                    <th>질문분류</th>
                                   	<th>제목</th>
                                    <th>작성자</th>
                                    <th>처리상태</th>
                                    <th>작성일</th>
                                    <th>답변</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                                <tr>
                                    <td>${QnaInfo.qna_idx }</td>
                                    <td>${QnaInfo.qna_type }</td>
                                    <td>${QnaInfo.qna_subject }</td>
                                    <td>${QnaInfo.qna_content }</td>
                                    <td>${QnaInfo.qna_id }</td>
                                    <td>${QnaInfo.qna_category }</td>
                                    <td>${QnaInfo.qna_date }</td>
                                    <td>${QnaInfo.qna_answer }</td>
                                 </tr>   
                    </tbody>
                    </table>
<!--                     </form> -->
               </div>
               </div>                                    
      <form class="ps-form--review" action="qnaboard_answer_detailPro" method="post" name="modifyForm">
            <!-- ---게시판글쓰기api -->
                <textarea id="summernote" name="qna_answer">                                                        
 <br>안녕하세요 베지터틀 입니다. 
순차적인 문의 확인으로 답변 지연이 발생된 점 깊이 사과드립니다.<br>
<br>
먼저 필요하시어 주문해주신 상품으로 불편함을 드려 죄송합니다. <br>
상품 생산 및 포장과정에서 검수가 미흡하여 불편함을 드린 부분으로 말씀주신 사항은 유관부서로 전달하여 개선 요청하겠습니다.<br>
<br>
문의해 주신 사항 관련하여 학인 및 처리 도움드렸습니다. <br>
<br>
추후 상품 문의 외 배송관련 또는 상품 CS 조치 필요할 경우 1:1문의를 통해 남겨주시면 감사하겠습니다<br>
<br>
앞으로 정확한 상품으로 베지터틀 이용에 만족을 드리고자 더욱 노력하겠습니다.<br>
<br>
감사합니다.</textarea>
                <!-- ---게시판글쓰기api -->
                <input type="hidden" name="qna_idx" value="${param.qna_idx}" />
                     <div class="ps-form__submit text-center"> 
                        <br>
                          <button class="ps-btn success" type="submit">답변등록</button>
                          <button class="ps-btn ps-btn--gray mr-3"onclick="history.back()">취소</button>
                    </div>

             
          </form>
    </main>
    <script src="/Code_Green/resources/plugins_manager/jquery.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/popper.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/jquery.matchHeight-min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/select2/dist/js/select2.full.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.js"></script>
    <script src="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.min.js"></script>
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>