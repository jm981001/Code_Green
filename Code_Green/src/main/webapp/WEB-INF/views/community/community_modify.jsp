<%@page import="com.itwillbs.Code_Green.vo.BoardVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
     <script src="/Code_Green/resources/plugins/jquery.min.js"></script>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
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
    <link rel="stylesheet" href="/Code_Green/resources/css/style_main.css">
    <link rel="stylesheet" href="/Code_Green/resources/css/organic.css">
    <script src="/Code_Green/resources/plugins_community/ckeditor5/build/ckeditor.js"></script>
</head>
<style>
  	.ck-editor__editable { height: 300px; }  
   	.ck-content { font-size: 12px; }  
</style>
<body>
    
    <!-- 헤더 삽입 -->
    <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- 헤더 삽입 -->
    
   <!-- 블로그 바디 시작  -->
    <div class="ps-page--blog">
        <div class="container">
            <div class="ps-blog--sidebar">
                <div class="ps-blog__left">
                    <div class="ps-post--detail sidebar">
                    
                        <!-- 블로그 헤더 시작  -->
                        <div class="ps-post__header">
                       		<div class="colorheaderhead">
                            	<h2>글 수정</h2>
                            </div>
                        </div>
                        <!-- 블로그 헤더 끝  -->
                        
                        <!-- 블로그 본문 시작  -->
              		<div class="ps-post__content">
                   		<div class="ps-block--vendor-dashboard">
                    		<div class="ps-block__content">
	                        	<div class="table-responsive">
                    				<form action="CommunityModifyPro.bo" method="post" enctype="multipart/form-data">
                    				<input type="hidden" name="pageNum" value="${param.pageNum }">  
                    				<input type="hidden" name="board_idx" value="${board.board_idx}">  
                    				<input type="hidden" name="file1" value="${board.file1}">  
                    				<input type="hidden" name="file2" value="${board.file2}">  
                    				<input type="hidden" name="file3" value="${board.file3}">  
	                           		 <table class="table ps-table ps-table--vendor">
	                                    <tr>
	                                        <td>말머리</td>
	                                        <td><select name="board_category" required>
					                                <option value="">말머리선택</option>
					                                <option value="맛집" <c:if test="${board.board_category eq '맛집'}">selected</c:if>>맛집</option>
					                                <option value="정보" <c:if test="${board.board_category eq '정보'}">selected</c:if>>정보</option>
					                                <option value="사담" <c:if test="${board.board_category eq '사담'}">selected</c:if>>사담</option>
					                                <option value="추천" <c:if test="${board.board_category eq '추천'}">selected</c:if>>추천</option>
					                            </select>
					                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>작성자</td>
	                                        <td><input type="text" id="board_id" name="board_id" value="${board.board_id }" readonly="readonly" style="width: 50%"></td>
	                                    </tr>
	                                    <tr>
	                                        <td>제목</td>
	                                        <td><input type="text" id="board_subject" name="board_subject" value="${board.board_subject }" style="width: 100%"></td>
	                                    </tr>
	                                    <tr><td colspan="2"><textarea name="board_content" id="editor">${board.board_content }</textarea></td></tr>
	                                   
	                                   <!-- 파일 업로드 부분 -->
	                                    <tr>
	                                    	<td colspan="2"><input type="file" id="file_1" name="file_1">
	                                    	<c:if test="${board.file1 ne ''}">(기존파일:<span id="here"></span>)
		                                   		 <script>
										       		let name = '${board.file1}';
										       		let result = name.split('_');
										       		$('#here').text(result[1]);
										      	</script>
	                                    	</c:if>
	                                    	</td>
	                                    </tr>
	                                    <tr>
	                                    	<td colspan="2"><input type="file" id="file_2" name="file_2">
	                                    	<c:if test="${board.file2 ne ''}">(기존파일:<span id="here2">${board.file2 }</span>)
	                                    		 <script>
										       		let name2 = '${board.file2}';
										       		let result2 = name2.split('_');
										       		$('#here2').text(result2[1]);
										      	</script>
	                                    	</c:if>
	                                    	</td>
	                                    </tr>
	                                    <tr>
	                                    	<td colspan="2"><input type="file" id="file_3" name="file_3">
	                                    	<c:if test="${board.file3 ne ''}">(기존파일:<span id="here3">${board.file3 }</span>)
	                                    		<script>
										       		let name3 = '${board.file3}';
										       		let result3 = name3.split('_');
										       		$('#here3').text(result3[1]);
										      	</script>
	                                    	</c:if>
	                                    	</td>
	                                    </tr>
										<tr> 
											<td colspan="2"><input type="submit" value="수정하기" id="submitBtn"></td> 
										</tr>
	                            	</table>
                     			 </form> 
                     					
                       		   </div>
                        	</div>
                   		  </div>
                   		</div>
                    </div>
                </div>
                <!-- 오른쪽 메뉴 시작  -->
                <div class="ps-blog__right">
                    <aside class="widget widget--blog widget--recent-post">
	                        <div class="widget__content">
		                        <a href="/Code_Green"><i class="fi fi-rr-home"></i> 메인 홈</a>
		                        <a href="CommunityList.bo"><i class="fi fi-rr-list"></i> 목록 보기</a>
	                        </div>
                    </aside>
                </div>
                <!-- 오른쪽 메뉴 끝  -->
            </div>
        </div>
    </div>
    
    <!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
	<div id="back2top">
		<i class="icon icon-arrow-up"></i>
	</div>
	<!-- 맨위로 올라가는 화살표버튼! 지우지마세요! -->
    
    <!-- 푸터 삽입 -->
    <jsp:include page="../inc/footer.jsp"></jsp:include>
    <!-- 푸터 삽입 -->
   	
   	
   	
   	<!-- CKEditor5 관련 설정 -->
   	<script>
	    ClassicEditor
	    .create( document.querySelector( '#editor' ), {
	    	removePlugins: ['Title'],
	    	placeholder: '내용을 입력해주세요',
	    } )
	    .then( editor => {
	        console.log( editor );
	    } )
	    .catch( error => {
	        console.error( error );
	    } );
	  </script>
   
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

