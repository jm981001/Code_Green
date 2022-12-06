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
<link rel="icon" href="/Code_Green/resources/img/favicon.png">
<title>마이페이지 - 베지터틀</title>
<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext" rel="stylesheet">
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
<link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
<link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
    
</head>
<style>

	.writeBtn{
	
		float: right;
		border: 2px solid black;
		border-radius: 20px;
		color: black;
		font-weight: bold;
		background-color: transparent;
		margin-right: 10px;
		margin-bottom: 10px;
		padding: 3px 15px;
		 
	
	}

	.btnbtnbtn .statusBtn1,.statusBtn2 {
		float: left;
		font-size: 90%;
		border: none;
		border-radius: 20px;
		color: white;
		margin-right: 10px;
		margin-bottom: 10px;
		padding: 3px 10px;
		
	}
	
	.btnbtnbtn .statusBtn1 {
		background-color: #f34a4a;
	}

	.btnbtnbtn .statusBtn2 {
		background-color: #007bff;
	}
	
	.status_wait{
		color:red;
		padding: 0.25em 0.4em;
	    font-size: 75%;
	    font-weight: 700;
	    line-height: 1;
	    text-align: center;
	}
	
	.status_complete{
		color:#007bff;
		padding: 0.25em 0.4em;
	    font-size: 75%;
	    font-weight: 700;
	    line-height: 1;
	    text-align: center;
	}
	
	.resetBtn,.submitBtn {
	
		float: right;
		border: 1px solid gray;
		border-radius: 20px;
		color: black;
		font-weight: bold;
		background-color: transparent;
		padding: 3px 15px;
		margin: 5px;
	
	}
	
	.submitBtn {
		color:white;
		background-color: #5fa30f;
		border: none;
	}
	
</style>
<body>

    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->

<!-- ==========왼쪽 사이드바=========================================================================================================     -->
	<main class="ps-page--my-account">
		<section class="ps-section--account">
			<div class="container">
				<div class="row">
					<jsp:include page="../inc/left_mypage.jsp"></jsp:include>

<!-- ==========Q&A=========================================================================================================     -->
					<div class="col-lg-8">
                       <div class="ps-section__right">
                            <div class="ps-section--account-setting">
                            
                                <div class="ps-section__header">
                                    <h3>1:1 문의하기</h3>
                                </div>
                               
                                <div class="ps-section__content">
                                    <div class="table-responsive">
                                      <div class="ps-section__right">
                                         <div class="ps-post__content">
					                   		<div class="ps-block--vendor-dashboard">
					                    		<div class="ps-block__content">
						                        	<div class="table-responsive">
					                    				<form action="WriteQnaPro.bo" method="post">
						                           		 <input type="hidden" name="qna_id" value="${sessionScope.sId }">
						                           		 <table class="table ps-table ps-table--vendor">
						                                    <tr>
						                                        <td>문의종류</td>
						                                        <td><select name="qna_category" required>
										                                <option value="">카테고리</option>
										                                <option value="배송문의">배송문의</option>
										                                <option value="상품 누락 문의">상품 누락 문의</option>
										                                <option value="상품문의">상품문의</option>
										                                <option value="이벤트/쿠폰/적립금문의">이벤트/쿠폰/적립금문의</option>
										                                <option value="주문/결제/반품/교환문의">주문/결제/반품/교환문의</option>
										                                <option value="기타 문의">기타 문의</option>
										                            </select>
										                        </td>
						                                    </tr>
						                                    <tr>
						                                        <td>제목</td>
						                                        <td><input type="text" id="qna_subject" name="qna_subject" style="width: 100%" required placeholder="제목을 입력해주세요"></td>
						                                    </tr>
						                                    <tr>
																<td>문의내용</td>
						                                    	<td><textarea name="qna_content" id="textbox" rows="10" style="width: 100%" required placeholder="** 문의글은 작성 후 수정이 불가합니다. **&#13;&#10;** 글 삭제 후 재작성만 가능합니다. **&#13;&#10;** 답변까지 시간이 다소 소요될 수 있습니다. **"></textarea></td></tr>
															<tr> 
																<td colspan="2">
																<input type="submit" value="문의등록" class="submitBtn">
																<input type="reset" value="다시쓰기" class="resetBtn" style="color:gray;">
																</td>
															</tr>
						                            	</table>
					                     			 </form> 
					                       		   </div>
					                        	</div>
					                   		  </div>
                   							</div>
                            				</div>
                            			</div>  
                           	   		</div>
                       			</div>
                    		</div>
                 	 </div> 
<!-- ==========Q&A 끝=========================================================================================================     -->					
					
				</div>
			</div>
		</section>
	</main>


	<!-- ---------------------------------------------------------- 푸터푸터 ---------------------------------------------------------- -->
     	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- ---------------------------------------------------------- 푸터푸터 끝 ---------------------------------------------------------- -->



	<!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->

	<div id="back2top">
		<i class="icon icon-arrow-up"></i>
	</div>

	<!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->


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