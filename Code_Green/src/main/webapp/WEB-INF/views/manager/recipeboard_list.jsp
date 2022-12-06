<%@page import="com.itwillbs.Code_Green.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="favicon.png" rel="icon">
    <title>레시피관리-베지터틀</title>
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
       function recipe_delete(value) {
          let delete_confirm = confirm('삭제하시겠습니까? 삭제하면 복구가 불가능합니다.');
          
          if(delete_confirm){
             $.ajax({
               url: "recipeboard_deletePro.bo",
               type: "POST",
               data: {
                  board_idx: value
               },
               success: function(){
                  alert("삭제가 완료되었습니다.");
                  location.href = "recipeboard_list";
               },
               fail: function () {
                  alert("삭제가 실패되었습니다. 다시 시도해 주세요.");
               }
            });
          } 
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
                    <h3>레시피관리</h3>
                </div>
                <div class="header__center">
                </div>
                <div class="header__right"><a class="header__site-link" href="/Code_Green"><span>메인페이지로 이동</span><i class="icon-exit-right"onclick="href=/Code_Green"></i></a></div>
            </header>
            <section class="ps-items-listing">
                    <div class="ps-section__actions"><a class="ps-btn success" href="recipeboard_write?manager_id=${sessionScope.sId }"><i class="icon icon-plus mr-2"></i>레시피등록</a></div>
                <div class="ps-section__header simple">
                    <div class="ps-section__filter">
                        <form class="ps-form--filter" action="recipeboard_list" method="get">
                            <div class="ps-form__left">
                                <div class="form-group">
                                    <select class="ps-select"name="searchType">
                                       <option value="board_idx">글번호</option>
                                        <option value="board_subject">제목</option>
                                        <option value="item_name">사용한상품</option>
                                        <option value="board_date">작성일</option>
                                        <option value="board_readcount">조회수</option>
                                    </select>
                                </div>
                            </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" name="keyword" placeholder="Search..." />
                                </div>
                            <div class="ps-form__right">
                                <button class="ps-btn ps-btn--gray"><i class="icon icon-funnel mr-2"></i>Filter</button>
                            </div>
                        </form>
                </div>
                    </div>
                <div class="ps-section__content">
                    <div class="table-responsive">
                        <table class="table ps-table">
                            <thead>
                                <tr>
                                   
                                   <th>글번호</th>
                                      <th>제목</th>
                                     <th>사용한상품</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                   
                                </tr>
                            </thead>
                            <tbody>
                            
                              <c:forEach var="recipeList" items="${recipeList }">
                                <tr>
                                   <td>${recipeList.board_idx }</td>
                                    <td>
                                    	<a href="recipe_detail.bo?board_idx=${recipeList.board_idx }&id=${sessionScope.sId}">
                                    		<strong>${recipeList.board_subject }</strong>
                                    	</a>
                                    </td>
                                    <td>${recipeList.item_name }</td>
                                    <td>${recipeList.board_date }</td>
                                    <td>${recipeList.board_readcount }</td>
                                    <td>
                                       <div class="dropdown"><a id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-ellipsis"></i></a>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="recipeboard_modify?manager_id=${sessionScope.sId }&board_idx=${recipeList.board_idx}">수정</a>
                                            <a class="dropdown-item" onclick="recipe_delete(${recipeList.board_idx })">삭제</a>

                                        </div>
                                        </div>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                            
                              <div class="ps-section__footer">
                   <!-- 페이징 버튼들 시작 -->
                               <%PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo"); %>
                                <div class="ps-pagination">
                                    <ul class="pagination">
                                       
                                        <li><%if(pageInfo.getPageNum() > pageInfo.getStartPage()) {%><a href="recipeboard_list?pageNum=${pageInfo.pageNum - 1}&searchType=${searchType }&keyword=${keyword}"><%}%><i class="icon-chevron-left"></i>Prev</a></li>
                                        <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
                                           <c:choose>
                                              <c:when test="${i eq pageInfo.pageNum }"><li class="active"><a href="#">${i }</a></li></c:when>
                                              <c:otherwise><li><a href="recipeboard_list?pageNum=${i }&searchType=${searchType }&keyword=${keyword}">${i }</a></li></c:otherwise>
                                           </c:choose>
                                        </c:forEach>
                                        <li><%if(pageInfo.getPageNum() < pageInfo.getMaxPage()) {%><a href="recipeboard_list?pageNum=${pageInfo.pageNum + 1}&searchType=${searchType }&keyword=${keyword}"><%}%>Next<i class="icon-chevron-right"></i></a></li>
                                    </ul>
                                </div>
              <!-- 페이징 버튼들 끝 -->

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
    <!-- custom code-->
    <script src="/Code_Green/resources/js/main_manager.js"></script>
</body>

</html>