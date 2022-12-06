<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
   function logout() {
      let result = confirm("로그아웃 하시겠습니까?");
      
      if(result) {
         location.href = "MemberLogout.me";
      }
   }
</script>


    <header class="header header--organic" data-sticky="true">
	<div class="header__top">

		<div class="ps-block--user-header">
			<c:choose>
				<c:when test="${empty sessionScope.sId }">
					<a href="join" style="color: green; font-weight: bold;">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
						href="login">로그인</a>
				</c:when>

				<c:when test="${sessionScope.sId eq 'admin' }">
					<a href="MemberInfo.me?member_id=${sessionScope.sId }"
						style="color: green;">${sessionScope.sId}님 </a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
						href="javascript:logout()">Logout</a>   
                 &nbsp;&nbsp;|&nbsp;&nbsp;<a href="AdminMain.me">관리자페이지</a>
				</c:when>

				<c:when test="${not empty sessionScope.sCode}">
					<a href="brand_mypage?manager_id=${sessionScope.sId }"
						style="color: green;">${sessionScope.sId}님 </a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
						href="javascript:logout()">Logout</a>
                 &nbsp;&nbsp;|&nbsp;&nbsp;<a
						href="ManagerInfo.me?manager_id=${sessionScope.sId }">기업관리자페이지</a>
				</c:when>

				<c:otherwise>
					<a href="MemberInfo.me" style="color: green;">${sessionScope.sId}님
					</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:logout()"> Logout</a>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="container">
			<div class="header__right"></div>
			<div class="header__right">
				<a class="ps-logo" href="/Code_Green">
<!-- 				<img src="/Code_Green/resources/img/logoturtle.jpg" width="230" height="100"> -->
					<img src="http://itwillbs17.cdn1.cafe24.com/logoturtle.jpg" width="230" height="100">
					</a>
			</div>
			
<!-- 관리자,기업이면 마이페이지 장바구니 안보이게 -->
			<c:choose>
				<c:when test="${sessionScope.sId eq 'admin' || not empty sessionScope.sCode}">
					<div class="header__right">
					<div class="header__actions">
						<a class="header__extra" href="myPageWishList.my?member_id=${sessionScope.sId }" style="visibility: hidden;"><i class="icon-heart"></i></a>
						<div class="ps-cart--mini">
							<a class="header__extra" href="cart?member_id=${sessionScope.sId }" style="visibility: hidden;"><i class="icon-bag2"></i> 
								<c:choose>
									<c:when test="${sessionScope.sId eq '' || sessionScope.sId eq null ||cartCount eq '' || cartCount eq null }"></c:when>
										<c:otherwise>
											<span id="cartCount"> 
												<i>${cartCount }</i>
											</span>
										</c:otherwise>
								</c:choose>
							</a>
						</div>
						<c:if test="${not empty sessionScope.sId}">
							<a class="header__extra" href="MemberInfo.me"><i class="icon-user" style="visibility: hidden;"></i></a>
						</c:if>
						<c:if test="${empty sessionScope.sId }">
							<a class="header__extra" href="login"><i class="icon-user"></i></a>
						</c:if>
					</div>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="header__right">
					<div class="header__actions">
						<a class="header__extra" href="myPageWishList.my?member_id=${sessionScope.sId }" ><i class="icon-heart"></i></a>
					<div class="ps-cart--mini">
						<a class="header__extra" href="cart?member_id=${sessionScope.sId }"><i class="icon-bag2"></i> 
							<c:choose>
								<c:when test="${sessionScope.sId eq '' || sessionScope.sId eq null ||cartCount eq '' || cartCount eq null }"></c:when>
									<c:otherwise>
										<span id="cartCount"> 
											<i>${cartCount }</i>
										</span>
									</c:otherwise>
							</c:choose>
						</a>
					</div>
					<c:if test="${not empty sessionScope.sId}">
						<a class="header__extra" href="MemberInfo.me"><i
							class="icon-user"></i></a>
					</c:if>
					<c:if test="${empty sessionScope.sId }">
						<a class="header__extra" href="login"><i class="icon-user"></i></a>
					</c:if>

					</div>
					</div>
				</c:otherwise>
			</c:choose>
			
			

			
			
			
			
			
			
			
		</div>
	</div>


	<!-- -----------------------------------------여기가 웹시작임----------------------------------------------------- -->
        <nav class="navigation">
            <div class="container">
                <div class="navigation__left">
                    <div class="menu--product-categories">
                        <div class="menu__toggle"><i class="icon-menu"></i><span>카테고리</span></div>
                        <div class="menu__content">
                            <ul class="menu--dropdown">
                                <li><a href="category_all">전체 상품</a> </li>
                                <li><a href="category_sale">특가 상품</a> </li>
                                <li><a href="category_fruit_vegi">과일 / 채소</a> </li>
                                <li><a href="category_dairy_drink">유제품 / 음료</a></li>
                                <li><a href="category_iced_easy">냉동 식품 / 간편 식품</a></li>
                                <li><a href="category_fish">해산물 </a></li>
                                <li><a href="category_snack">간식류</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="navigation__right">
                    <ul class="menu menu--organic">
                        <li class="menu-item-has-children has-mega-menu"><a href="ItemList.bo">신상품</a><span class="sub-toggle"></span> </li>                     
                        <li class="menu-item-has-children has-mega-menu"><a href="BestItemList.bo">베스트</a><span class="sub-toggle"></span></li>   
                        <li class="menu-item-has-children has-mega-menu"><a href="welcome_vegun" style="color: green;">어서와, 비건은 처음이지?</a></li>   
                        <li class="menu-item-has-children has-mega-menu"><a href="BrandMain.br">브랜드별</a><span class="sub-toggle"></span></li>   
                        <li class="menu-item-has-children has-mega-menu"><a href="recipe_main.bo">레시피</a></li>   
                        <li class="menu-item-has-children has-mega-menu"><a href="CommunityList.bo">커뮤니티</a></li>   
                    </ul>
                </div>
            </div>
        </nav>
    </header>
  