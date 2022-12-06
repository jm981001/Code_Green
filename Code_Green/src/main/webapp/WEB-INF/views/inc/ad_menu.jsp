<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
function logout() {
    let result = confirm("로그아웃 하시겠습니까?");
    
    if(result) {
       location.href = "MemberLogout.me";
    }
 }
</script>
</head>
<body>

   <div class="ps-main__sidebar">
            <div class="ps-sidebar">
                <div class="ps-sidebar__top">
                    <div class="ps-block--user-wellcome">
                        <div class="ps-block__left"><img src="/Code_Green/resources/img/turtleinthebowl.png" width="70" height="70"></div>
                        <div class="ps-block__right">
                            <p>여기는<a href="#">총관리자</a></p>
                        </div>
                        <div class="ps-block__action"><a href="javascript:logout()"><i class="icon-exit"></i></a></div>
                    </div>
                    <div class="ps-block--earning-count"><small>총매출</small>
                        <h3><fmt:formatNumber value="${sessionScope.total }" pattern="#,###원"/></h3>
                    </div>
                </div>
                <div class="ps-sidebar__content">
                    <div class="ps-sidebar__center">
                        <ul class="menu">
                            <li><a href="AdminMain.me"><i class="icon-home"></i>매출현황조회</a></li>
                            <li><a href="ad_Cancel_Order"><i class="icon-papers"></i>결제취소관리</a></li>
                            <li><a href="ad_member_Manage"><i class="icon-users2"></i>회원관리</a></li>
                            <li><a href="ad_Manager_manage"><i class="icon-users2"></i>기업관리</a></li>
                            <li><a href="ad_Notice"><i class="icon-users2"></i>공지 관리</a></li>
                            <li><a href="ad_Board_Management"><i class="icon-papers"></i>게시판 관리</a></li>
                            <li><a href="ad_One_Board"><i class="icon-papers"></i>문의글 관리</a></li>
                            <li><a href="ad_Report_Management"><i class="icon-papers"></i>신고글 관리</a></li>
                        </ul>
                    </div>
                    <div class="ps-sidebar__footer" >
                        <div class="ps-copyright" style="margin-right: 100px"><img src="" alt="" >
                            <p>&copy;2022 VEGETURTLE:CODE-GREEN TEAM FROM ITWILL-BUSAN.<br/> All rights reversed.</p>
                        </div>`
                    </div>
                </div>
            </div>
        </div>


</body>
</html>