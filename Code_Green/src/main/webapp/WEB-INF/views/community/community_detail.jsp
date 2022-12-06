<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
    <title>커뮤니티 - 베지터틀</title>
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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
	
	#rep_delBtn {
		float: right;
		color: #4b810c;
	}
	
	#rereBox {
		width: 700px; height: 40px;
		border: 1px solid lightgray;
		margin: 10px 10px;
	}
	
	#goReReply {
		
		color: white;
		background-color: #5FA30F;
		border: none;
		border-radius: 20px;
		padding: 5px 15px 5px 15px;
	
	}
	
	#reId{
		font-weight: bold;
		font-size: 16px;
	}
	
</style>
<script>

// ============================ 신고하기 로그인 확인 ===================================	
	function checkReport(){
		if(${sessionScope.sId == null}){
			
			alert("로그인 후 사용가능합니다!");
			
		} else {
			$("#modal").fadeIn();
			$("#modal_close_btn").click(function(){
				$("#modal").fadeOut();
			});
		} 
		
	}
		
// ============================ 신고하기 완료알림 ===================================	
	function checkS() {
		alert("신고가 완료되었습니다!\n관리자의 확인 후 처리됩니다. 감사합니다.");
	};
	
// ============================ 댓글삭제여부 확인 =====================================	
	function deleteCheck(reply_idx){
// 		let check = confirm("삭제하시겠습니까?\n삭제 시 복구가 불가능합니다.");
		
			$.ajax({
				url:"replyDelete.re",
				type:"GET",
				data:{reply_idx : reply_idx},
				success:function(msg){
					replyCount();
					getReplyList();			
				},
			})
		
	};
	
// ============================ 추천기능 ==========================================	
	$(function(){
			// 추천버튼 클릭시(추천 추가 또는 추천 제거)
			$("#bestcnt_update").click(function(){
				if(${sessionScope.sId == null}){
					
					alert("로그인 후 사용가능합니다!");
					
				} else {
					
					$.ajax({
						url: "BestCountUpdate.bo",
						type: "POST",
						data: {
							rf_board_idx: ${cBoard.board_idx},
							member_id: '${sessionScope.sId}'
						},
						success: function(msg){
							bestCount();
							alert(msg);
						},
					})
				}	
			})
			
			// 게시글 추천수
			function bestCount(){
				$.ajax({
					url: "BestCounting.bo",
					type: "POST",
					data:{
						rf_board_idx: ${cBoard.board_idx}
					},
					success: function(count){
						$(".bestcnt_count").html(count);
					},
				})
			};
		
		bestCount();	// 처음 시작했을때 실행되도록 해당 함수 호출
		
	});
// ============================ 페이지 로딩시 댓글목록 불러오기 ===================================		
	$(document).ready(function(){
		getReplyList();			
		replyCount();
	});

// ================================== 댓글목록 출력 ==========================================	
	function getReplyList(){
		
		$.ajax({
			url:"ReplyList.re",
			type:"POST",
			dataType:"json",
			data:{
				
				reply_bo_ref : ${cBoard.board_idx }		// 원본게시글번호 전달
			},
			success: function(result){
				let commentsResult="";
				
				if(result.length < 1){
					commentsResult = "등록된 댓글이 없습니다.";
				} else {
					let idNum = 0;
					$(result).each(function(){
						
						let comments="";
						let space ="";
						
						if(this.reply_re_lev > 0) {
							for(let i = 0; i < this.reply_re_lev; i++) {
								space += '&nbsp;&nbsp;&nbsp;&nbsp;';
							}
							
							space += '<img src="<%=request.getContextPath() %>/resources/img/re.png" width="20px" height="20px">&nbsp;';
						}
						
						comments +=  space + '<span id="commentPart"><b>'+this.reply_id+'</b>&nbsp;<img src="/Code_Green/resources/img/turtleturtle.png" width="25px" height="25px"/>&nbsp;&nbsp;&nbsp;<small>' + this.reply_date+ '</small>';
						
						if(this.reply_re_lev > 0) {
							var arrow = '&nbsp;&nbsp;&nbsp;&nbsp;';
							comments = arrow.concat(comments);
							
						}
						
						comments +=  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + this.reply_content;
						comments +=  '<a class="reply_write_btn" id="rep_delBtn" onclick="reReplyWrite('+ idNum +')" > &nbsp;답글 </a>';
                        
						<!-- 로그인한 사람과 댓글작성자가 같을 경우 삭제버튼 표시 -->
                        if(('${sessionScope.sId}' == this.reply_id) || ('${sessionScope.sId}' == 'admin') ){
	                        comments +=  '<span id="reply_del_btn"><a class="ps-block__reply" href="#" id="rep_delBtn" onclick="deleteCheck('+ this.reply_idx +');return false;"><img src="<%=request.getContextPath() %>/resources/img/cross.png" width="23px" height="23px">  | </a></span>';
	                        }
                        <!-- 대댓글 작성을 위한 폼 -->
						comments += '<div id="reReplyBox'+ idNum++ +'" style="display:none">'
									+ '<form action="#" method="post" id="form'+ idNum +'">'
									+ '<input type="hidden" name="reply_bo_ref" value="'+ this.reply_bo_ref +'">'
									+ '<input type="hidden" name="reply_re_ref" value="'+ this.reply_re_ref +'">'
									+ '<input type="hidden" name="reply_re_lev" value="'+ this.reply_re_lev +'">'
									+ '<input type="hidden" name="reply_re_seq" value="'+ this.reply_re_seq +'">'
									+ '<input type="hidden" name="reply_id" value="${sessionScope.sId}">'
									+ '<input type="hidden" name="pageNum" value="${param.pageNum}">'
									+ '<input type="text" id ="rereBox" name="reply_content" placeholder="댓글을 입력하세요.">&nbsp;&nbsp;'
									+ '<input type="button" id="goReReply" value="작성" onclick="callreReply('+ idNum +')"></form></div>';
                        comments += '</span><hr>';
                        commentsResult += comments;
					});
				};
				
				$("#replyList").html(commentsResult);
			}
		});
	};	
// ========================= 대댓작성을 위한 비동기 처리 ================================================
	function callreReply(idNum){
		if(${sessionScope.sId == null}){
			
			alert("로그인 후 사용가능합니다!");
			
		} else {
			$.ajax({
				url:"reReplyWrite.re",
				type:"POST",
				data: $("#form" + idNum).serialize(),
				datatype:"json",
				success:function(){
					replyCount();
					getReplyList();
				},
			})
	   }
	};
// ============================ 답글버튼(대댓글) 클릭시 숨김/표시 처리 ===================================
	function reReplyWrite(idNum){
		 if ($('#reReplyBox' + idNum).css('display') == 'none') {
	          $('#reReplyBox'+ idNum).css('display', 'block');
	     } else {
	            $('#reReplyBox'+ idNum).css('display', 'none');
	     }
	}
	
	
// ============================ 댓글쓰기 ===================================
	$(function(){		// 댓글쓰기 버튼 클릭시 수행
		$("#replyWrite").click(function(){
			if(${sessionScope.sId == null}){
				
				alert("로그인 후 사용가능합니다!");
				
			} else {
				
					if($("#reply_content").val() == '' || $("#reply_content").val() == null){
						
						alert("댓글 내용을 입력해주세요!");
						
					} else { 
					
					$.ajax({
						url:"ReplyWrite.re",
						type: "POST",
						dataType:"json",
						data:{
							reply_content : $("#reply_content").val(), 	// 댓글내용
							reply_id : '${sessionScope.sId}',				// 댓글작성자
							reply_bo_ref : ${cBoard.board_idx }		// 원본참조게시글번호	
						},
						success: function(result){
							getReplyList();					// 댓글목록불러오는 함수
							replyCount();
							$("#reply_content").val('');
							// 댓글칸 비우기
						}
						, error: function(error){
							console.log("에러 : " + error);
						}
					})
				 }
			  }
			})
			
			// 로딩시 자동실행되서 댓글수 카운팅
			replyCount();
	});

// =========================== 댓글 수 카운팅 ================================================================
	function replyCount(){
	
		$.ajax({
			url: "ReplyCounting.bo",
			type: "POST",
			data:{
				reply_bo_ref: ${cBoard.board_idx}
			},
			success: function(rCount){
				$(".reply_count").html(rCount);
			},
		})
	};



// ============================ 오른쪽 사이드바: 새글쓰기 로그인여부 확인 ===================================
	function writeNew(){
		if(${sessionScope.sId != null || sessionScope.sId == 'admin'}){
			location.href="CommunityWrite.bo";	
		} else {
			alert("로그인 후 사용가능합니다!");
		}
 	};
	
</script>

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
                            <h2>${cBoard.board_subject }</h2>
	                            <p>
		                            [${cBoard.board_category }] 
		                    		<fmt:parseDate var="dateString" value="${cBoard.board_date}" pattern="yyyyMMdd" />
			                        / <fmt:formatDate value="${dateString }" pattern="yyyy.MM.dd" />
		                            / ${cBoard.board_id }
		                            / 조회수 ${cBoard.board_readcount }
		                            / 댓글(<span class="reply_count"></span>) 
		                            / 추천수 <span class="bestcnt_count"></span>
	                            </p>
                            </div>
                        </div>
                        <!-- 블로그 헤더 끝  -->
                        <!-- 블로그 본문 시작  -->
                        <div class="ps-post__content">
                        	<p>${cBoard.board_content }</p>
	                       		<img src="/Code_Green/resources/commUpload/${cBoard.file1}" style="max-width:90%"  onerror="this.style.display='none'">
	                       		<img src="/Code_Green/resources/commUpload/${cBoard.file2}" style="max-width:90%"  onerror="this.style.display='none'">
	                       		<img src="/Code_Green/resources/commUpload/${cBoard.file3}" style="max-width:90%"  onerror="this.style.display='none'">
                        </div>


					   <!-- 신고하기 / 추천하기 버튼 시작 -->
						
						<div class="form-group-comm">
							<button class="ps-btn-report" onclick="checkReport()">신고</button>
								<div id="modal">
								   <div class="modal_content">
								   	  <button type="button" id="modal_close_btn">X</button><br>
								   	   <h3>신고하기</h3>
								   	  <form action="ReportBoard.re" method="post" onsubmit="checkS()">
								   	  	<input type="hidden" value="${cBoard.board_idx }" name="board_idx" id="board_idx">
								   	  	<input type="hidden" value="${param.pageNum }" name="pageNum" id="pageNum">
								   	  	<input type="hidden" value="${cBoard.board_id }" name="board_id" id="board_id">
								   	  	<table>
								   	  		<tr>
								   	  			<td>게시판</td>
								   	  			<td><input type="text" value="커뮤니티" disabled="disabled" ></td>
								   	  		</tr>
								   	  		<tr>
								   	  			<td>신고글</td>
								   	  			<td><input type="text" value="${cBoard.board_subject }" name="report_subject" readonly="readonly"></td>
								   	  		</tr>
								   	  		<tr>
								   	  			<td>신고자</td>
								   	  			<td><input type="text" value="${sessionScope.sId }" name="reporter"  readonly="readonly"></td>
								   	  		</tr>
								   	  		<tr>
								   	  			<td>신고사유</td>
								   	  			<td><textarea name="report_content" id="report_content" cols="30" rows="3" placeholder="신고사유를 입력해주세요."></textarea></td>
								   	  		</tr>
								   	  		<tr>
								   	  			<td colspan="2"><input type="submit" value="신고서 제출"></td>
								   	  		</tr>
									   	  </table>
								   	  </form>
								   </div>	
								</div>
		                    <button class="ps-btn-best" id="bestcnt_update">추천 <span class="bestcnt_count"></span></button>
		                </div>
					   <!-- 신고하기 / 추천하기 버튼 끝 -->
					   <!-- ========================================= 댓글 영역 시작 ========================================= -->
		               <div class="ps-post-comments">
					   <!-- 댓글쓰기 영역 -->
			                    <h4>댓글 쓰기</h4>
			                    <div class="form-group">
			                        <textarea id="reply_content" class="form-control" rows="3" placeholder="댓글을 입력하세요" required="required"></textarea>
			                    </div>
			                    <div class="form-group submit">
			                        <button type="button" class="ps-btn" id="replyWrite"> 댓글쓰기</button>
			                    </div>
			            <!-- 댓글쓰기 영역 -->
		                <h4> 댓글(<span class="reply_count"></span>) </h4>
		       
		                <div class="ps-block--comment">
			            	<div class="ps-block__content" id="replyList"></div>
		                </div>
	         			</div>
             <!-- ========================================= 댓글 영역 끝 ========================================= -->
             		</div>
             	</div>
                <!-- 오른쪽 메뉴 시작  -->
                <div class="ps-blog__right">
                    <aside class="widget widget--blog widget--recent-post">
	                        <div class="widget__content">
		                        <a href="/Code_Green"><i class="fi fi-rr-home"></i> 메인 홈</a>
		                        <a href="CommunityList.bo"><i class="fi fi-rr-list"></i> 목록 보기</a>
		                        <a href="javascript:void(0);" onclick="writeNew();"><i class="fi fi-rr-edit"></i> 새글 쓰기</a>
		                        <c:if test="${cBoard.board_id eq sessionScope.sId || sessionScope.sId eq 'admin'}">
			                        <a href="CommunityModify.bo?board_idx=${cBoard.board_idx }&pageNum=${param.pageNum }"><i class="fi fi-rr-scissors"></i> 글 수정</a>
			                        <a href="CommunityDelete.bo?board_idx=${cBoard.board_idx }&pageNum=${param.pageNum }" onclick="return deleteCheck();"><i class="fi fi-rr-cross-circle"></i> 글 삭제</a>
		                        </c:if>
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
    
    ﻿
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