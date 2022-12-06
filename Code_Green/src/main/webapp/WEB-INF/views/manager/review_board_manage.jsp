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
    <link href="favicon.png" rel="icon">
    <title>답변관리페이지</title>
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
    <aside class="ps-drawer--mobile">
        <div class="ps-drawer__header">
            <h4> Menu</h4>
            <button class="ps-drawer__close"><i class="icon icon-cross"></i></button>
        </div>
        <div class="ps-drawer__content">
            <ul class="menu">
                 				 <li><a class="active" href="manager_index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="orders?manager_id=${sessionScope.sId }"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="recipeboard_list?manager_id=${sessionScope.sId }"><i class="icon-users2"></i>레시피관리</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?manager_id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
            </ul>
        </div>
    </aside>
    <div class="ps-site-overlay"></div>
    <main class="ps-main">
        <div class="ps-main__sidebar">
            <div class="ps-sidebar">
                <div class="ps-sidebar__top">
                    <div class="ps-block--user-wellcome">
                        <div class="ps-block__left"><img src="img/user/admin.jpg" alt="" /></div>
                        <div class="ps-block__right">
                            <h4><strong>${sessionScope.sId }</strong> 님 환영합니다</h4>
                        </div>
                        <div class="ps-block__action"><a href="#"><i class="icon-exit"></i></a></div>
                    </div>
                    <div class="ps-block--earning-count"><small>수익</small>
                        <h3>$12,560.55</h3>
                    </div>
                </div>
                <div class="ps-sidebar__content">
                    <div class="ps-sidebar__center">
                        <ul class="menu">
                            	 <li><a class="active" href="manager_index"><i class="icon-home"></i>관리자메인페이지</a></li>
				                <li><a href="products?manager_id=${sessionScope.sId }"><i class="icon-database"></i>상품관리</a></li>
				                <li><a href="orders?manager_id=${sessionScope.sId }"><i class="icon-bag2"></i>주문관리</a></li>
				                <li><a href="sales_main"><i class="icon-papers"></i>매출관리</a></li>
				                <li><a href="qnaboard_list"><i class="icon-users2"></i>답변관리</a></li>
				                <li><a href="recipeboard_list?manager_id=${sessionScope.sId }"><i class="icon-users2"></i>레시피관리</a></li>
				                <li><a href="sales_management"><i class="icon-percent-circle"></i>정산</a></li>
								<li><a href="brand_mypage?manager_id=${sessionScope.sId }"><i class="icon-cog"></i>내브랜드정보</a></li>
	                     </ul>
                    </div>
                    <div class="ps-sidebar__footer">
                        <div class="ps-copyright"><img src="img/logo.png" alt="">
                            <p>&copy;2020 Marfury marketplace. <br/> All rights reversed.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-main__wrapper">
            <header class="header--dashboard">
                <div class="header__left">
                    <h3>답변관리</h3>
                </div>
                <div class="header__center">
                    <form class="ps-form--search-bar" action="index method="get">
                        <input class="form-control" type="text" placeholder="Search something" />
                        <button><i class="icon-magnifier"></i></button>
                    </form>
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"></i></a></div>
            </header>

 <div class="ps-main__wrapper">
  <div class="header__center">
  <form class="ps-form--search-bar" action="index.html" method="get">

 
       <table class="table ps-table">
              
                    </form>
                    <h2>게시판 답글 관리</h2>
                    <hr>
                       <thead>
                                <tr>
                                	<th>번호</th>
                                    <th>질문분류</th>
                                   	<th>제목</th>
                                    <th>작성자</th>
                                     <th>처리상태</th>
                                     <th>답변유무</th>
                                    <th>작성일</th>
                                   
                                </tr>
                            </thead>
                            <tbody>
                            
                                <tr>
                                	<td>${QnaInfo.qna_idx }</td>
                                	<td>${QnaInfo.qna_type }</td>
                                    <td>${QnaInfo.qna_subject }</td>
                                    <td>${QnaInfo.qna_id }</td>
                                    <td>${QnaInfo.qna_category }</td>
                                    <td>${QnaInfo.qna_answer }</td>
                                 </tr>   
<!--                                     <td><button type="button" class="btn btn-info" style="font-size: 13px"><strong>답변대기</strong></button>
                                    
                                    <td>${QnaInfo.qna_date }</td>
                                    <td>
                                        <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="ad_oneQnaDelete?id=${qnaList.qna_id }">Delete</a></div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
<!--                                <tr> -->
<!--                                     <td>2</td> -->
<!--                                     <td><strong>배송언제되나요?</strong></td> -->
<!--                                     <td>김김김</td> -->
<!--                                     <td>배송문의</td> -->
<!--                                     <td><span class="ps-badge success">답변대기</span> -->
<!--                                     </td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                    <tr> -->
<!--                                    <td>3</td> -->
<!--                                    <td><strong>배송문의 드려요</strong></td> -->
<!--                                    <td>김김김</td> -->
<!--                                     <td>배송문의</td> -->
<!--                                     <td><span class="ps-badge success">답변대기</span> -->
<!--                                     </td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                 <td>4</td> -->
<!--                                 <td><strong>물건이 좀 이상하네요</strong></td> -->
<!--                                  <td>김김김</td> -->
<!--                                     <td>상품문의</td> -->
<!--                                       <td><span class="ps-badge success">답변대기</span> -->
<!--                                     </td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                 <td>5</td> -->
<!--                                    <td><strong>환불했는데... 언제쯤 카드사 취소되는지 궁금...</strong></td> -->
<!--                                    <td>김김김</td> -->
<!--                                     <td>환불문의</td> -->
<!--                                     <td><span class="ps-badge success">답변대기</span> -->
<!--                                     </td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                 <td>6</td> -->
<!--                                 <td><strong>방금 주문했는데 언제받을수 있는지궁금해요</strong></td> -->
<!--                                    <td>김김김</td> -->
<!--                                     <td>배송문의</td> -->
<!--                                       <td><span class="ps-badge success">답변대기</span> -->
<!--                                     </td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                                     </td> -->
<!--                                 </tr> -->
<!--                                 <tr> -->
<!--                                 <td>7</td> -->
<!--                                 <td><strong>재입고 언제 되나요??</strong></td> -->
<!--                                 <td>김김김</td> -->
<!--                                     <td>상품문의</td> -->
<!--                                      <td><span class="ps-badge success">답변대기</span> -->
<!--                                     </td> -->
<!--                                     <td>Jul 21, 2020</td> -->
<!--                                     <td> -->
<!--                                         <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a> -->
<!--                                             <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Delete</a></div> -->
<!--                                         </div> -->
<!--                             </tbody> -->
                            
                            
                            
                            
                            
                            
                     
<!--   		</table> -->
  				
<!--   		</div> -->
                     
               
                       <div class="ps-form__left">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="Search..." />
                                </div>
                             </div>
                                <div class="form-group">
                                    <select class="ps-select">
                                        <option value="1">주문/결제/반품/교환문의</option>
                                        <option value="2">이벤트/쿠폰/적립금문의</option>
                                        <option value="3">상품문의</option>
                                        <option value="4">배송문의</option>
                                        <option value="5">상품 누락 문의</option>
                                        <option value="6">기타 문의</option>
                                    </select>
                                 <div class="ps-form__right">
                                <button class="ps-btn ps-btn--gray"><i class="icon icon-funnel mr-2"></i>Filter</button>
                            </div>
                    </div>
                    <br>
                    
				<!-- ---게시판글쓰기api -->
                <textarea id="summernote" name="editordata"></textarea>
                <!-- ---게시판글쓰기api -->
                
                     <div class="ps-form__submit text-center">
                     	<br>
                          <button class="ps-btn ps-btn--gray mr-3">취소</button>
                                    <button class="ps-btn success">답변달기</button>
                    </div>

       
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