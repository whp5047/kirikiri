<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <script
     src="https://code.jquery.com/jquery-3.6.0.js"
     integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
     crossorigin="anonymous"></script>
    <!-- swal -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   <script src="sweetalert2.min.js"></script>
   <!-- Bootstrap icons-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
   <!-- fontawesome -->
   <script src="https://kit.fontawesome.com/f9358a6ceb.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>자유 게시판</title>

    <style>
       *{
          box-sizing: border-box;
       }
       
      /* header */
      header {
         font-family: 'MICEGothic Bold';
      }
      
      @media ( max-width : 768px) {
         #navLogo {
            display: none;
         }
         #myPageIcon {
            display: none;
         }
         #cartIcon {
            display: none;
         }
         #menu {
            display: none;
         }
      }
      
      /* header */
      #navLogo {
         width: 150px;
         height: 100px;
      }
      
      #logoImgs {
         width: 100%;
         height: 100%;
      }
      
      @media ( min-width : 768px) {
         #navibar {
            display: none;
         }
      }
      
      #logoImg {
         width: 50%;
      }
      /* header 반응형 끝 */
      
      
      /* 네비바 드롭다운 */
      .dropdown-toggle:hover {
         color: #83bf7b;
         border-color: aliceblue;
      }
      
      .dropdown:hover .dropdown-menu {
         display: block;
         margin-top: 0;
         font-weight: bold;
      }
      
      .groupHeaderInfo {
         height: 480px;
      }
   
      /* 게시글 영역 */
      .contentWrapper{
         font-family: 'InfinitySans-RegularA1';
      }
      
      /* 코끼리 머리*/
      #headWrapper{
         position: relative;
         padding-top: 120px;
      }
      #boardHead-img{
           position: absolute;
           left: 50%;
           transform: translate(-40%, -60%);
           width: 400px;
        }
        #head{
           font-family: 'MICEGothic Bold';
            background-color: #d2e3ec;
            height: 150px;
            border: 5px solid black;
            border-top-left-radius: 80px;
            border-top-right-radius: 80px;
        }
        /* 코끼리 다리 */
        #footWrapper{
           position: relative;
           padding-bottom: 120px;
        }
        #boardFoot-img{
           position: absolute;
           left: 50%;
           transform: translate(-40%, 100%);
           width: 400px;
        }
        #foot{
            background-color: #d2e3ec;
            height: 100px;
            border: 5px solid black;
            border-bottom-left-radius: 80px;
            border-bottom-right-radius: 80px;
        }
        
        .form-control{
            display: inline-block;
        }
        
        #boardList a{
           text-decoration: none;
           color: black;
        }
        
        /* 컨텐츠 container */
      #contentRow{
         border-left: 5px solid black;
         border-right: 5px solid black;
      }
        
        /* 사이드바 */
        #aside{
           margin-top: 150px;
           padding: 20px;
           height: 650px;
        }
        .sortBox{
           line-height: 50px;
           list-style: none;
           margin: 0;
           padding: 0;
        }
        .sortBox li{
           border: 2px solid black;
           border-radius: 10px;
           margin-bottom: 15px;
           background-color: #d2e3ec;
           text-align: center;
        }
        .sortBox li:hover{
           background-color: #d2e3ec9e;
        }
        .sortBox a{
           color: black;
           text-decoration: none;
        }
        
        /* 컨텐츠 속 */
        #content-body{
           padding: 30px;
        }
        
        /* breadcrumb */
        .breadcrumb a{
           text-decoration: none;
           color: #a6a6a6;
        }
        .breadcrumb a:hover{
           text-decoration: underline;
        }
        
        /* 페이징 */
      .page-item.active .page-link{
         background-color: #d2e3ec;
         border-color: #bfced6;
         color: black;
      }
      .page-link{
         color: black;
         border: 0px;
      }
      
      /* footer */
      /*풋터 영역*/
      .footer-imgBox img{
         max-width: 100%;
      }
      
      .footerWrapper{
         background-color: white;
         font-family: "MICEGothic Bold";
         font-size: 15px;
      }
      .footerBox {
         height: 0px;
      }
      
      footer.footer {
         padding-top: 2rem;
         padding-bottom: 2rem;
      }
      
      .footer a {
         text-decoration: none;
         color: black;
         font-weight: 40px;
         font-weight: bold;
      }
      
      .footer-imgBox>img {
         height: 100%;
         text-align:center;
      }
      .footer-imgBox {
         height: 100%;
         text-align:center;
      }
      
      /* 폰트 */
      @font-face {
            font-family: 'MICEGothic Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }
        @font-face {
          font-family: 'InfinitySans-RegularA1';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
          font-weight: normal;
          font-style: normal;
      }
      
    </style>
</head>
<body>
   <!--네비바-->
   <header class="mb-3 border-bottom"
      style="box-shadow: 2px 1px 6px 1px #bfbfbf;">
      <div class="container">
         <!-- 접혔을 때 nav -->
         <nav id="navibar" class="navbar navbar-expand-md navbar-light"
            aria-label="Main navigation">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-10">
                     <a class="navbar-brand mb-2 mb-lg-0" href="/">
                        <div class="title-box">
                           <img id="logoImg" src="/resources/images/kiri.jpg">
                        </div>
                     </a>
                  </div>
                  <!-- toggle button -->
                  <div class="col-2 d-flex align-items-center">
                     <button class="navbar-toggler" type="button"
                        data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                        aria-controls="navbarNavDropdown" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                     </button>
                  </div>
                  <!-- 메뉴 -->
                  <div class="collapse navbar-collapse justify-content-end"
                     id="navbarNavDropdown">
                     <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/board/toBoard">자유게시판</a></li>
                        <c:if test="${empty loginSession}">
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogin">로그인</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/signup/toSignupAgree">회원가입</a></li>
                        </c:if>
                        <c:if
                           test="${not empty loginSession && loginSession.user_email eq 'admin'}">
                           <li class="nav-item"><a class="nav-link"
                              href="/mem/myPage">마이페이지</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/admin/toAdmin">관리자페이지 이동</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogout">로그아웃</a></li>
                        </c:if>
                        <c:if
                           test="${not empty loginSession && loginSession.user_email ne 'admin'}">
                           <li class="nav-item"><a class="nav-link"
                              href="/mem/myPage">마이페이지</a></li>
                           <li class="nav-item"><a class="nav-link"
                              href="/login/toLogout">로그아웃</a></li>
                        </c:if>
                     </ul>
                  </div>
               </div>

            </div>
         </nav>
         <!-- 펼쳐졌을 때 nav -->
         <nav id="menu" class="navbar navbar-expand-md w-100 navbar-light"
            aria-label="Main navigation">
            <div class="row w-100 align-items-center">
               <div class="col-5 d-flex justify-content-center">
                  <ul class="navbar-nav mb-2 mb-lg-0">
                     <li class="nav-item"><a class="nav-link mx-2"
                        href="/board/toBoard" style="font-size: 18px;">자유 게시판</a></li>
                  </ul>
               </div>

               <!-- logo -->
               <div class="col-2">
                  <a href="/" id="navLogo" class="mb-2 mb-lg-0"> <img
                     id="logoImgs" src="/resources/images/kiri.jpg">

                  </a>
               </div>

               <div class="col-5">
                  <div class="row align-items-center justify-content-center">
                     <div class="col-auto">
                        <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                           <c:if test="${empty loginSession}">
                              <li class="nav-item"><a class="nav-link"
                                 href="/login/toLogin">로그인</a></li>
                              <li class="nav-item"><a class="nav-link"
                                 href="/signup/toSignupAgree">회원가입</a></li>
                           </c:if>
                        </ul>
                     </div>
                     <div class="col-auto user">
                        <c:if
                           test="${not empty loginSession && loginSession.user_email eq 'admin'}">
                           <div class="dropdown text-end">
                              <a href="/"
                                 class="d-block link-dark text-decoration-none dropdown-toggle"
                                 id="dropdownUser1" data-bs-toggle="dropdown"
                                 aria-expanded="false"> <img
                                 src="/resources/images/profile.jpg" alt="mdo" width="32"
                                 height="32" class="rounded-circle">
                              </a>
                              <ul class="dropdown-menu text-small"
                                 aria-labelledby="dropdownUser1">
                                 <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                                 <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a></li>
                                 <li><hr class="dropdown-divider"></li>
                                 <li><a class="dropdown-item" href="/admin/toAdmin">관리자
                                       페이지이동</a></li>
                                 <li><a class="dropdown-item" href="/login/toLogout">로그아웃</a></li>
                              </ul>
                           </div>
                        </c:if>
                        <c:if
                           test="${not empty loginSession && loginSession.user_email ne 'admin'}">
                           <div class="dropdown text-end">
                              <a href="/"
                                 class="d-block link-dark text-decoration-none dropdown-toggle"
                                 id="dropdownUser1" data-bs-toggle="dropdown"
                                 aria-expanded="false"> <c:if
                                    test="${loginSession.user_image eq null}">
                                    <img src="/resources/images/profile.jpg" alt="mdo"
                                       width="40" height="40" class="rounded-circle">
                                 </c:if> <c:if test="${loginSession.user_image ne null}">
                                    <img src="/profile/${loginSession.user_image }" alt="mdo"
                                       width="40" height="40" class="rounded-circle">
                                 </c:if>
                              </a>
                              <ul class="dropdown-menu text-small"
                                 aria-labelledby="dropdownUser1">
                                 <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                                 <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a>
                                 </li>
                                 <li>
                                    <hr class="dropdown-divider" style="margin: 0px;">
                                 </li>
                                 <c:if test="${loginType ne 'kakao'}">
                                    <li><a class="dropdown-item mt-2"
                                       href="/login/toLogout">로그아웃</a></li>
                                 </c:if>
                                 <c:if test="${loginType eq 'kakao'}">
                                    <li><a class="dropdown-item mt-2" href="${kakaoLogout}">로그아웃</a></li>
                                 </c:if>
                              </ul>
                           </div>
                        </c:if>
                     </div>
                  </div>
               </div>
            </div>
         </nav>
      </div>
   </header>

   <div id="Wrapper">
       <div id="headWrapper" class="container">
          <img id="boardHead-img" src="/resources/images/board/head.png">
         <div id="head" class="row text-center align-items-end pb-2">
            <h1>자유 게시판</h1>
         </div>
      </div>
       <div class="container contentWrapper" style="background-color: white;">
        
           <!-- 컨텐츠 영역 -->
         <div class="row" id="contentRow">
            
            <!-- 유형별 정렬 -->
            <aside id="aside" class="col-2">
               <div class="row justify-content-center">
                  <ul class="sortBox">
                     <a href="/board/toBoard"><li>전체</li></a>
                     <a href="#"><li>공지</li></a>
                     <a href="#"><li>수다</li></a>
                     <a href="#"><li>일상</li></a>
                     <a href="#"><li>후기</li></a>
                     <a href="#"><li>기타</li></a>
                  </ul>
               </div>
            </aside>
            
            <div id="content-body" class="col-10">
            
               <div class="row mt-4 justify-content-end">
                  <div class="col-auto">
                        <c:choose>
                           <c:when test="${loginType eq 'admin'}">
                              <button type="button" id="writeBtn" class="btn" style="background-color: #d2e3ec;">관리자 글쓰기</button>
                           </c:when>
                           <c:otherwise>
                              <button type="button" id="writeBtn" class="btn" style="background-color: #d2e3ec;">글쓰기</button>
                           </c:otherwise>
                        </c:choose>
                  </div>
               </div>
            
               <!-- breadcrumb -->
               <div class="row">
                  <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                     <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
                        <li class="breadcrumb-item text-dark" aria-current="page">자유게시판</li>
                     </ol>
                  </nav>
               </div>
            
               <!-- 게시글 -->
                 <div class="row mt-3" id="boardList">
                     <div class="col">
                         <table class="table table-hover text-center">
                             <thead>
                               <tr>
                                 <th class="col-2">구분</th>
                                 <th class="col-4">제목</th>
                                 <th class="col-2">닉네임</th>
                                 <th class="col-2">작성일</th>
                                 <th class="col-2">조회</th>
                               </tr>
                             </thead>
                             <tbody>
                                <c:choose>
                                   <c:when test="${list.size() == 0 && noticeList.size() == 0}">
                                      <tr>
                                         <td colspan="5">등록된 게시글이 없습니다.</td>
                                      </tr>
                                   </c:when>
                                   <c:otherwise>
                                      <c:forEach items="${noticeList}" var="notice">
                                         <tr>
                                               <td class="col-2">
                                                  <i class="fa-solid fa-bullhorn"></i>
                                               </td>
                                               <td class="col-5 text-start">
                                                  <a class="move" href="${notice.seq_board}">
                                                     ${notice.board_title}
                                                  </a>
                                               </td>
                                               <td class="col-2">${notice.user_nickname}</td>
                                               <td class="col-2">${notice.board_date}</td>
                                               <td class="col-1">${notice.board_count}</td>
                                         </tr>
                                        </c:forEach>
                                      <c:forEach items="${list}" var="dto">
                                         <tr>
                                            <td class="col-2">${dto.board_category}</td>
                                            <td class="col-5 text-start">
                                               <%-- /board/toDetailView?seq_board=${dto.seq_board} --%>
                                               <a class="move" href="${dto.seq_board}">
                                                  ${dto.board_title}
                                               </a>
                                            </td>
                                            <td class="col-2">${dto.user_nickname}</td>
                                            <td class="col-2">${dto.board_date}</td>
                                            <td class="col-1">${dto.board_count}</td>
                                         </tr>
                                      </c:forEach>
                                   </c:otherwise>
                                </c:choose>
                             </tbody>
                     </table>
                     </div>
                 </div>
              
                 <!-- 페이징 -->
                 <div class="row mt-4 pageInfo_wrap">
                    <div class="pageInfo_area">
                     <ul id="pageInfo" class="pageInfo pagination justify-content-center">
                        <!-- 이전 페이지 버튼 -->
                        <c:if test="${pageMaker.prev}">
                           <li class="pageInfo_btn previous page-item">
                              <a class="page-link" href="${pageMaker.startPage-1}">
                                 <i class="fa-solid fa-angle-left"></i>
                              </a>
                           </li>
                        </c:if>
                        
                        <!-- 각 번호 페이지 버튼 -->
                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                           <li class="pageInfo_btn page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
                              <a class="page-link" href="${num}">${num}</a>
                           </li>
                        </c:forEach>
                        
                        <!-- 다음 페이지 버튼 -->
                        <c:if test="${pageMaker.next}">
                                <li class="pageInfo_btn next page-item">
                                   <a class="page-link" href="${pageMaker.endPage + 1 }">
                                      <i class="fa-solid fa-angle-right"></i>
                                   </a>
                                </li>
                            </c:if> 
                     </ul>
                    </div>
                 </div>
                 <form id="moveForm" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                  <input type="hidden" name="type" value="${pageMaker.cri.type}">
                  <input type="hidden" name="category" value="${pageMaker.cri.category}">
                 </form>
              
                 <!-- 검색 -->
               <div class="search_wrap">
                  <div class="search_area row mt-4 justify-content-center">
                     <div class="col-auto">
                        <select id="type" name="type" class="form-select" aria-label="유형">
                           <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected' : ''}"/>>전체</option>
                           <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
                           <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
                           <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
                           <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 + 내용</option>
                           <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 + 작성자</option>
                        </select>
                     </div>
                     <div class="col-5">
                        <input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" class="form-control" placeholder="검색">
                     </div>
                     <div class="col-auto">
                        <button type="button" id="searchBtn" class="btn" style="background-color: #d2e3ec;">
                           <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                     </div>
                  </div>
               </div>
              </div>
         </div>
      </div>
      <div id="footWrapper" class="container">
          <img id="boardFoot-img" src="/resources/images/board/bottom.png">
         <div id="foot" class="row">
         </div>
      </div>

    </div>
    
   <!-- Footer-->
   <div class="footerWrapper mt-5" style="border-top:1px solid #e0e3e8;">
      <div class="container">
         <footer class="footer">
            <div class="row">
               <div class="col-lg-3 footer-imgBox">
                  <img src="/resources/images/kirilogo.png" alt="오류가 발생했습니다." />
               </div>
               <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                  <ul class="list-inline mb-2">
                     <li class="list-inline-item"><a href="/board/toBoard?pageNum=1&amount=10&keyword=&type=&category=공지">공지사항</a></li>
                     <li class="list-inline-item">⋅</li>
                     <c:choose>
                        <c:when test="${not empty loginSession}">
                           <li class="list-inline-item"><a href="/mem/myPage">마이페이지</a></li>
                           <li class="list-inline-item">⋅</li>
                           <c:if test="${loginType ne 'kakao'}">
                              <li class="list-inline-item"><a href="/login/toLogout">로그아웃</a></li>
                           </c:if>
                           <c:if test="${loginType eq 'kakao'}">
                              <li class="list-inline-item"><a href="${kakaoLogout}">로그아웃</a></li>
                           </c:if>
                        </c:when>
                        <c:otherwise>
                           <li class="list-inline-item"><a
                              href="/signup/toSignupAgree">회원가입</a></li>
                           <li class="list-inline-item">⋅</li>
                           <li class="list-inline-item"><a href="/login/toLogin">로그인</a></li>
                        </c:otherwise>
                     </c:choose>
                     <li class="list-inline-item">⋅</li>
                     <li class="list-inline-item">
                        <c:choose>
                           <c:when test="${not empty loginSession}">
                              <a href="/group/toCreateGroup">모임 만들기</a>
                           </c:when>
                           <c:otherwise>
                              <a href="/login/toLogin">모임 만들기</a>
                           </c:otherwise>
                        </c:choose>
                     </li>
                     <li class="list-inline-item">⋅</li>
                     <li class="list-inline-item"><a href="/privacy"
                        style="color: red; font-weight: bold;">개인정보처리방침</a></li>
                  </ul>
                  <p class="text-muted small mb-4 mb-lg-0">끼리끼리(주) 대표 : 이호준 |
                     개인정보관리책임자 : 김영완 | 사업자등록번호 : 22-02-22</p>
                  <p class="text-muted small mb-4 mb-lg-0">주소 : 서울특별시 영등포구 선유동2로
                     57 이레빌딩</p>
                  <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
                     2022. All Rights Reserved.</p>
               </div>
               <div class="col-lg-3 h-100 text-center text-lg-start my-auto">
                  <ul class="list-inline mb-0">
                     <li class="list-inline-item me-4"><a
                        href="https://ko-kr.facebook.com"><i
                           class="bi-facebook fs-3"></i></a></li>
                     <li class="list-inline-item me-4"><a
                        href="https://twitter.com/?lang=ko"><i
                           class="bi-twitter fs-3"></i></a></li>
                     <li class="list-inline-item"><a
                        href="https://www.instagram.com/"><i
                           class="bi-instagram fs-3"></i></a></li>
                  </ul>
               </div>
            </div>
         </footer>
      </div>
   </div>
    
    <script>
       // 공지사항 배경
       $(document).ready(function(){
          $(".fa-bullhorn").parents("tr").css("background-color", "#e9f2f7");
       });
       
       // 페이징
       $(".move").on("click", function(e){
          e.preventDefault();
          if($("#seq_boardInput").length == 1){
              $("#seq_boardInput").remove();
           }
          $("#moveForm").append("<input type='hidden' name='seq_board' id='seq_boardInput' value='" + $(this).attr("href")+"'>");
          $("#moveForm").attr("action", "/board/toDetailView");
          $("#moveForm").submit();
       });
       
       // 페이지 이동 번호
       $(".pageInfo a").on("click", function(e){
          e.preventDefault();
          $("#moveForm").find("input[name='pageNum']").val($(this).attr("href"));
          $("#moveForm").attr("action", "/board/toBoard");
          $("#moveForm").submit();
       });
       
       // 글쓰기 요청
       $("#writeBtn").on("click", function(){
          if("${loginSession}" == null || "${loginSession}" == ""){
             let timerInterval;
             Swal.fire({
                icon: 'warning'
                , title: 'Oops...'
                , text: '로그인 후 게시글을 작성해 보세요!'
                   , footer: '<a href="/login/toLogin">로그인 하러 가기</a>'
            })
             return;
          }
          
         location.href = "/board/toWrite";
      })
      
      // 정렬
      //let category;
      $(".sortBox a").on("click", function(e){
         let category = $(this).text();
         if(category != '전체'){
            e.preventDefault();
            
            $("#moveForm").find("input[name='category']").val(category);
            $("#moveForm").find("input[name='pageNum']").val(1);
            $("#moveForm").submit();
         }
      });
      
      // 검색
      $("#searchBtn").on("click", function(e){
         e.preventDefault();
         
         let type = $(".search_area select").val();
         let keyword = $(".search_area input[name='keyword']").val();
         
         /* if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
         } */
         
         if(!keyword){
            alert("검색어를 입력하세요.");
            return false;
         }
         
         $("#moveForm").find("input[name='type']").val(type);
         $("#moveForm").find("input[name='keyword']").val(keyword);
         $("#moveForm").find("input[name='pageNum']").val(1);
         $("#moveForm").submit();
         
      })
      
      // 게시글 목록 ajax
      function makeDynamicEl(data){
         $("tbody").empty();
         if(data.length == 0){ // 검색 결과 없음
            let tr = $("<tr>");
            let td = $("<td colspan=5>").append("검색 결과가 없습니다.");
            tr.append(td);
            tr.appendTo("tbody");
         }else{ // 검색 결과 있음
            for(let dto of data){
               let tr = $("<tr>");
               let td1 = $("<td>").addClass("col-2");
               if(dto.board_category == '공지'){
                  td1.append('<i class="fa-solid fa-bullhorn"></i>');
               }else{
                  td1.append(dto.board_category);
               }
               let td2 = $("<td>").addClass("col-5 text-start");
               let a = $("<a>").attr("href", "/board/toDetailView?seq_board="+dto.seq_board).append(dto.board_title);
               td2.append(a);
               let td3 = $("<td>").addClass("col-2").append(dto.user_nickname);
               let td4 = $("<td>").addClass("col-2").append(dto.board_date);
               let td5 = $("<td>").addClass("col-1").append(dto.board_count);
               
               tr.append(td1, td2, td3, td4, td5);
               tr.appendTo("tbody");
               
               $(".fa-bullhorn").parents("tr").css("backgroundColor", "pink");
            }   
         }
      }
       //window.close();
      //window.opener.location.reload();
    </script>
</body>
</html>