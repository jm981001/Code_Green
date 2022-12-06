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
    <title>레시피 작성페이지-베지터틀</title>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/summernote/summernote-bs4.min.css">
    <link rel="stylesheet" href="/Code_Green/resources/plugins_manager/apexcharts-bundle/dist/apexcharts.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/style_manager.css">

<script type="text/javascript" src="/Code_Green/resources/js/jquery-3.6.1.js"> </script>
<script type="text/javascript">

	function myItem(value) {
		
		let subForm = document.getElementById('sub_form');
		
		let input = document.createElement('input');
		
		input.type   = 'hidden';
		
		input.name  = 'item_idx';
		
		input.value  = value;
		
		subForm.appendChild(input);
		

	}

	


</script>
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
                    <h3>레시피작성</h3>
                </div>
                <div class="header__center">
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"onclick="href=/Code_Green"></i></a></div>
             </header>
            <section class="ps-items-listing">
<%--                     <div class="ps-section__actions"><a class="ps-btn success" href="recipeboard_write?manager_id=${sessionScope.sId }"><i class="icon icon-plus mr-2"></i>레시피등록</a></div> --%>
                <div class="ps-section__header simple">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="qnaboard_list" method="get">
                            <div class="ps-form__left">
<!--                                 <div class="form-group"> -->
<!--                                     <select class="ps-select"name="searchType"> -->
<!--                                     	<option value="board_idx">글번호</option> -->
<!--                                         <option value="board_subject">제목</option> -->
<!--                                         <option value="board_content">내용</option> -->
<!--                                         <option value="board_date">작성일</option> -->
<!--                                         <option value="item_name">사용한상품</option> -->
<!--                                     </select> -->
<!--                                 </div> -->
                            </div>
                           <div class="form-group">
<!--                                     <input class="form-control" type="text" name="keyword" placeholder="Search..." /> -->
                                </div>
                            <div class="ps-form__right">
<!--                                 <button class="ps-btn ps-btn--gray"><i class="icon icon-funnel mr-2"></i>Filter</button> -->
                            </div>
                        </form>
                </div>
                    </div>
             
             
             
     <!-- 블로그 본문 시작  -->
              		<div class="ps-post__content">
                   		<div class="ps-block--vendor-dashboard">
                    		<div class="ps-block__content">
	                        	<div class="table-responsive">
                    				<form action="recipeboard_writePro.bo" method="post" enctype="multipart/form-data" id="sub_form">
	                           		 <table class="table ps-table ps-table--vendor">
	                                    <tr>
	                                        <td>작성자</td>
	                                        <td><input type="text" id="board_id" name="board_id" value="${sessionScope.sId }" readonly="readonly" style="width: 70%"></td>
	                                    </tr>
	                                    <tr>
	                                        <td>제목</td>
	                                        <td><input type="text" id="board_subject" name="board_subject" style="width: 70%" required="required"></td>
	                                    </tr>
	                                    <tr>
	                                    	<td>내용</td>
	                                    	<td colspan="2">
	                                    		<textarea name="board_content" id="board_content" name="board_content" rows="15" cols="60" style="width: 70%" cols="60" required="required" placeholder=
"* 썸네일, 본문에 업로드할 사진 한장씩 올려주세요.
* 내용엔 간단한 설명글을 올려주세요."></textarea>
	                                    		
	                                    	</td>
	                                    </tr>
	                                   <tr>
	                                   		<td>사용한 상품</td>
	                                   		<td>
		                                   		<select class="form-select" aria-label="Default select example" onchange="myItem(this.value)" style="float: none;">
												  	<option value="">선택하세요</option>
	                                   				<c:forEach  var="myItem" items="${myItem }">
												  		<option value="${myItem.item_idx }">${myItem.item_idx } ${myItem.item_name }</option>
			                                   		</c:forEach>
												</select>
	                                   		</td>
	                                   </tr>
	                                   <!-- 파일 업로드 부분 -->
	                                    <tr>
	                                    	<td>썸네일</td>
	                                    	<td colspan="2"><input type="file" id="파일선택1" name="file_1" required="required"></td>
	                                    </tr>
	                                    <tr>
	                                    	<td>본문 사진</td>
	                                    	<td colspan="2"><input type="file" id="파일선택2" name="file_2" required="required"></td>
	                                    </tr>
										<tr> 
											<td colspan="2">
												<input type="submit" value="글 등록" id="submitBtn">
											</td> 
										</tr>
	                            	</table>
                     			 </form> 
                     					
                       		   </div>
                        	</div>
                   		  </div>
                   		</div>
        
       
               </div>
            </section>
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