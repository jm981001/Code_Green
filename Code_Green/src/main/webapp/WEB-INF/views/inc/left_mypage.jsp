<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    
</head>
<body>

	<div class="col-lg-3">
						<div class="ps-section__left">
							<aside class="ps-widget--account-dashboard">
								<div class="ps-widget__header">
									<img src="/Code_Green/resources/img/turtleinthebowl.png"/>
									<figure>
										<figcaption>${sessionScope.sId}</figcaption>
										<p>${sessionScope.sEmail }</p>
									</figure>
								</div>
								<div class="ps-widget__content">
									<ul>
									 	<li><a href="MemberInfo.me"><i class="icon-store"></i> 마이페이지</a></li>
										<li><a href="myPageWishList.my?member_id=${sessionScope.sId }"><i class="icon-heart"></i>찜한 상품</a></li>
										<li><a href="myPageFollowingList.my"><i class="icon-star"></i>팔로우 브랜드</a></li>
										<li><a href="myPageEmoney.my?member_id=${sessionScope.sId}"><i class="icon-list"></i>적립금내역</a></li>
										<li><a href="myBuyList.my"><i class="icon-papers"></i>주문내역</a></li>
										<li><a href="myPageReview.my?member_id=${sessionScope.sId}"><i class="icon-papers"></i>상품후기</a></li>
										<li><a href="myPageQnaList.my"><i class="icon-question"></i>1:1 문의</a></li>
										<li><a href="myPageBoard.my?member_id=${sessionScope.sId} "><i class="icon-pen"></i>나의 글</a></li>
										<li><a href="myPageReportList.my"><i class="icon-alarm"></i>신고내역</a></li>
										<li><a href="myPage_userInfo"><i class="icon-user"></i>개인정보 수정</a></li>
										<li><a href="MemberLogout.me"><i class="icon-power-switch"></i>Logout</a></li>
									</ul>
								</div>
							</aside>
						</div>
					</div>

</body>
</html>