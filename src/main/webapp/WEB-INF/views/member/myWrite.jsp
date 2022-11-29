<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f9358a6ceb.js" crossorigin="anonymous"></script>
<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>자유 게시판</title>

    <style>
    	* {
			box-sizing: border-box;
			font-family: 'MICEGothic Bold';
		}
    	/* header 반응형 */
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
		#logoImg {
	     width: 50%;
	 }
	
	 /* 맨 위 프로필+게시글 수 부분 */
	 .topHeader {
	     background-color: #e7f3fad0;
	     width: 100%;
	     padding : 30px;
	 }
	 
	 .profiles{
	     background-color: #ffffff8e;
	     width:auto;
	     min-width:500px;
	     padding : 35px;
	     height: max-content;
	     border-radius:20px;
	 }
	.profileTitle {
		position: relative;
	}
	
	.line {
		border: none;
		background-color: rgb(102, 154, 209, 0.5);
		margin : auto;
		position:relative;
		bottom:20px;
		width: 100%;
		height: 20px;
		box-shadow: 3px 2px 2px rgb(25, 104, 184);
	}
	
	
	h1 {
		margin: 0;
		font-weight: 600;
		z-index: 9999;
	}
	 .profile {
	     margin: auto;
	 }
	 
	 #profile_image {
	     width: 100%;
	     height: 100%;
	     border-radius: 50%;
	 }
	
	 #profilePic {
	     border: 0.1rem solid black;
	     margin: auto;
	     width: 230px;
	     height: 230px;
	     border-radius: 50%;
	     box-shadow: 3px 3px 5px 5px rgb(182, 181, 181);
	 }
	
	 #profilePic:hover {
	     transition: 0.8s ease-in;
	     transform: scale(1.1);
	 }
	
	 #profilePic:not(:hover) {
	     transition: 0.8s ease-out;
	 }
	
	 #profileName {
	     font-size: 1.5em;
	     border-bottom: 3px solid navy;
	     padding-bottom: 9px;
	     margin-bottom: 12px;
	     min-width: 350px;
	     max-width: 460px;
	     text-align: center;
	 }
	
	 hr {
	     margin-top: 20px;
	     margin-bottom : 0;
	 }
	
	 /* body */
	 .contentBox{
	 	padding : 50px;
	 	margin-left : 20px;
	 	margin-right : 20px;
	 }
	 .pagination {
	     justify-content: center;
	 }
	
	 #memberDelete {
	     cursor: pointer;
	 }
	
	 .table {
	     --bs-table-striped-bg: rgba(23, 109, 167, 0.05);
	 }
	
	 .Board {
	     cursor: pointer;
	 }
	
	 .contentBox{
         padding : 50px;
         margin-left : 20px;
         margin-right : 20px;
     }
		
		/* 코끼리 머리*/
		#headWrapper{
			position: relative;
			padding-top: 120px;
		}
		#boardHead-img{
        	position: absolute;
        	left: 50%;
        	transform: translate(-10%, -40%);
        	width: 400px;
        }
        #headTab ul{
        	list-style:none;
        	margin:0px;
        	margin-left:60px;
        	padding:0px;
        	border-bottom: none;
        }
        #headTab li{
        	display:inline;
			border: 3px solid black;
			padding: 7px;
			margin-right:7px;
			font-size: 30px;
			border-bottom: none;
			border-top-left-radius:20px;
			border-top-right-radius:20px;
			background-color:#d2e3ec;
			cursor:pointer;
        }
        #head{
        	height: 90px;
        	font-family: 'MICEGothic Bold';
            background-color: #d2e3ec;
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
        
          .tomyPage{
         width:10%;
         height:50%;
         margin-right:100px;
         background-color:#18365291;
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
   <header class="mb-3 border-bottom" style="box-shadow: 2px 1px 6px 1px #bfbfbf;">
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
                        <li class="nav-item"><a class="nav-link" href="">자유게시판</a></li>
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
                        href="/board/toBoard" style="font-size:18px;">자유 게시판</a></li>
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
               <c:if test = "${not empty loginSession && loginSession.user_email eq 'admin'}">
                         <div class="dropdown text-end">
                           <a href="/" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                           <img src="/resources/images/profile.jpg" alt="mdo" width="32" height="32" class="rounded-circle">
                           </a>
                           <ul class="dropdown-menu text-small"
                              aria-labelledby="dropdownUser1">
                              <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                              <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a></li>
                              <li><hr class="dropdown-divider"></li>
                              <li><a class="dropdown-item" href="/admin/toAdmin">관리자 페이지이동</a></li>
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
                                 aria-expanded="false"> 
                                 <c:if test="${loginSession.user_image eq null}">
                                    <img src="/resources/images/profile.jpg" alt="mdo" width="40" height="40" class="rounded-circle">
                                 </c:if>
                                 <c:if test="${loginSession.user_image ne null}">
                                    <img src="/profile/${loginSession.user_image }" alt="mdo" width="40" height="40" class="rounded-circle">
                                 </c:if>
                              </a>
                              <ul class="dropdown-menu text-small"
                                 aria-labelledby="dropdownUser1">
                                 <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                                 <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a>
                                 </li>
                                 <li>
                                    <hr class="dropdown-divider" style="margin:0px;">
                                 </li>
                                 <li><a class="dropdown-item mt-2" href="/login/toLogout">로그아웃</a></li>
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
   <!-- header 부분 -->
	<div class="row m-0 topHeader">
		<div class="row profileTitle mb-5 justify-content-center" style="font-family: 'Mochiy Pop One', sans-serif;">
		 <div class="col-auto">
			 <h1 style="font-family: 'Do Hyeon', sans-serif;">내가 쓴 글</h1>
			 <div class="line"></div>
		 </div>
	 </div>
	 <div class="row justify-content-center">
		 <div class="col-4 mt-3 mb-4">
			<div id="profilePic">
				<c:choose>
					<c:when test="${empty memberdto.user_image}">
						<img src="/resources/images/profile.jpg" id="profile_image">
					</c:when>
					<c:otherwise>
						<img src="/profile/${memberdto.user_image}" id="profile_image">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="col-8 profiles">
			<div class="col-12" id="profileName">
				<strong>${memberdto.user_nickname}</strong> 
				<span style="font-size: 15px">님</span>
			</div>
			<div class="col-12 p-2" id="totalCount">
				<i class="fa-solid fa-file-pen"></i> 
				<span> 전체 게시글 : </span> 
				<span>${totalBoardCount} 건</span>
			</div>
			<div class="col-12 p-2" id="boardCount">
				<i class="fa-solid fa-file-pen"></i> 
				<span> 일반 게시글 : </span> 
				<span>${selectBoardCount} 건</span>
			</div>
			<div class="col-12 p-2" id="roomCount">
				<i class="fa-solid fa-file-pen"></i> 
				<span> 모임 게시글 : </span> 
				<span>${selectGroupBoardCount} 건</span>
			</div>
		</div>
	 </div>
   </div>
 <hr/>
  <div id="Wrapper">
  	<div id="headWrapper" class="container">
     <img id="boardHead-img" src="/resources/images/내가쓴글코끼리.png"> 
     <div id="headTab">
		<ul>
			<li class="general">일반</li>
			<li class="meeting">모임</li>
		</ul>  
   	</div>
	<div id="head" class="row text-center align-items-center">
		
	</div>
</div>
  	<div class="container contentWrapper" style="background-color: white;">
       <!-- 컨텐츠 영역 -->
	<div class="row" id="contentRow">
		<div id="content-body" class="col-12">
			<form id="searchForm">
				<div class="row">	
					<div class="col-12 mt-2" style="display:flex; justify-content:end;">
						<input class="d-none" type="text" id="user_email" value="${memberdto.user_email}">
						<select class="form-select me-3" aria-label="Default select example"
							name="category" id="category" style="width: 100px;">
							<option value="board_all">전체</option>
							<option value="board_category">유형</option>
							<option value="board_title">제목</option>
						</select>		
						<input type="text" name="keyword" class="form-control keyword me-3" placeholder="검색" style="width: 250px;">		
						<button type="button" class="btn btn-outline-secondary" id="searchBtn" style="width: 70px;">검색</button>
					</div>
				</div>	
				<!-- breadcrumb -->
				<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item"><a href="#">myPage</a></li>
						<li class="breadcrumb-item text-dark" aria-current="page">내가 쓴 글</li>
					</ol>
				</nav>
			</form>
				
			<!-- 게시글 -->
       			<div class="row mt-3" id="boardList">
          <div class="col">
              <table class="table table-striped memberTable text-center mt-3" id="tableBox">
				<thead>
					<tr>
				        <th class="col-1">유형</th>
						<th class="col-4">제목</th>
						<th class="col-4">작성일</th>
						<th class="col-1">조회수</th>
						<th class="col-2">삭제</th>
			   		</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="selectBoardList">
					 	<tr>
					 		<td>${selectBoardList.board_category}</td>
							<td><a href="/board/toDetailView?seq_board=${selectBoardList.seq_board}" style="color:black; text-decoration:none;">${selectBoardList.board_title}</a></td>
							<td>${selectBoardList.board_date}</td>
							<td>${selectBoardList.board_count}</td>
							<td id="icon"><span class="text-center boardDelete" style="cursor:pointer;"									id="boardDelete"><i class="fa-solid fa-trash"></i></span></td>
							<td class="d-none" id="seq_board">${selectBoardList.seq_board}</td>
						</tr>
					</c:forEach>
				</tbody>
			  </table>
		<input type = "text" class="d-none" id="user_email" value="${memberdto.user_email}"></div>
	</div>
		    <!-- 검색전 pagination -->    
			<div class="pagination mt-4 justify-content-center" id="page">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${naviMap.needPrev eq true}">
							<li class="page-item"><a class="page-link"
								href="/mem/myWrite?curPage=${naviMap.startNavi-1}"><i
									class="fa-solid fa-angle-left"></i></a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi}">
							<li class="page-item"><a class="page-link"
								href="/mem/myWrite?curPage=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${naviMap.needNext eq true}">
							<li class="page-item"><a class="page-link"
								href="/mem/myWrite?curPage=${naviMap.endNavi+1}"><i
									class="fa-solid fa-angle-right"></i></a></li>
						</c:if>
					</ul>
				</nav>
			</div>            
        </div>
	</div>
</div>
	<div id="footWrapper" class="container">
      <div id="foot" class="row justify-content-end" style="align-items:center;">
         <button type="button" class="btn btn-outline tomyPage">이전페이지로</button>
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
 // tomyPage 이동
    $(".tomyPage").on("click", function(){
      location.href="/mem/myPage"
    })
		/* enter키 event */
		 $(".keyword").on("keyup",function(key){  
			if(key.keyCode==13) {     
				 $("#searchBtn").click();
			}     
		});
		/* 첫 번째 selectBox 함수 */
		function selectBoardList(url,type){
			let user_email = $("#user_email").val();
			console.log(url,type);
			const curPage = 1;
			$.ajax({
				url,
				type:"post",
				data: {"user_email":user_email, "curPage": curPage},
				dataType: "json",
				success:function(data){
					makeDynamicEl(data, curPage, type);
				},
				error: function(e){
					console.log(e);
				}
			}); 
		}
		let selectedCategory = 'normal'
		$(".general").on("click",function(){
			$(".general").css({"padding-top":"10px", "padding-bottom":"10px"});
			$(".meeting").css({"padding-top":"0", "padding-bottom":"0"});
			selectBoardList("/mem/genalBoard","일반");
			selectedCategory = 'normal';
		})
		$(".meeting").on("click",function(){
			$(".general").css({"padding-top":"0", "padding-bottom":"0"});
			$(".meeting").css({"padding-top":"10px", "padding-bottom":"10px"});
			selectBoardList("/mem/meetingBoard","모임");
			selectedCategory = 'meeting';
		})
		/* 첫 번째 selectBox */
		$('.title').on('change', function() {
			selectedCategory = this.value;
			if (selectedCategory =="normal") {
				selectBoardList("/mem/genalBoard","일반");
			} else if(selectedCategory =="meeting") {
				selectBoardList("/mem/meetingBoard","모임");
			}
		})
		
		/* 검색 기능 */
		$("#searchBtn").on("click",function(){
			let data = $("#searchForm").serialize();
			let keyword = $(".keyword").val();
			let user_email = $("#user_email").val();
			let curPage = 1;
			let url;
			let type;
			if(selectedCategory === 'normal') {
				url = "/mem/normalSearch?user_email=" + user_email + "&curPage=" + curPage;
				type = '일반'; 
			} else {
				url = "/mem/meetingSearch?user_email=" + user_email + "&curPage=" + curPage;
				type = '모임';
			}
			 $.ajax({
				url,
				type:"get",
				data: data,
				dataType:"json",
				success:function(data){
					 makeDynamicEl(data, curPage, type, keyword); 
				},
				error: function(e){
					console.log(e);
				}
			}); 					
			})
		
		// 동적으로 함수로 다른 값 파라미터 받고 함수로 만들기
		 function makeDynamicEl(data, curPage, type, keyword){
			$("tbody").empty();
			$(".pagination").empty();
			
			if(data.length == 0){
				let tr=$("<tr>");
				let td = $("<td colspan=6>").append("검색 결과가 없습니다.");
				tr.append(td);
				tr.appendTo("tbody");
			} else {
				const startPage = 1;
				const endPage = Math.ceil(data.length / 10);
				const ul = $(".pagination");
				
				if(curPage > startPage) {
					const li = $("<li>");
					const a = $("<a>");
					const i = $("<i>");
					
					li.addClass('page-item');
					a.addClass('page-link');
					a.attr("href", "/mem/myWrite?curPage=" + Number(curPage - 1));
					ajaxPagination(data, curPage - 1, a, type, keyword);
					i.addClass("fa-solid fa-angle-left");
					
					a.append(i);
					li.append(a);
					ul.append(li);
				}
				
				for (let i = startPage; i <= endPage; i++) {
					const li = $("<li>");
					const a = $("<a>");
					
					li.addClass('page-item');
					a.addClass('page-link');
					a.attr("href", "/mem/myWrite?curPage=" + i);
					ajaxPagination(data, i, a, type, keyword);
					
					a.append(i);
					li.append(a);
					ul.append(li);
				}
				
				if(curPage < endPage) {
					const li = $("<li>");
					const a = $("<a>");
					const i = $("<i>");
					
					li.addClass('page-item');
					a.addClass('page-link');
					a.attr("href", "/mem/myWrite?curPage=" + Number(curPage + 1));
					ajaxPagination(data, curPage + 1, a, type, keyword);
					i.addClass("fa-solid fa-angle-right");
					
					a.append(i);
					li.append(a);
					ul.append(li);
				}
				
				const startIdx = (curPage - 1) * 10;
				let endIdx;
				if (curPage * 10 < data.length) {
					endIdx = curPage * 10;
				} else {
					endIdx = data.length;
				}
				
				 for (let i=startIdx; i < endIdx; i++) {
						const dto = data[i];
						let tr = $("<tr>");
						let td1;
						let td2;
						let td3;
						let td4;
						let td5;
						let td6;
						let a;
						let span= $("<span>");
						if (type === "일반") {
							td1 = $("<td>").append(dto.board_category);
							td2 = $("<td>");
							a = $("<a>");
							a.attr('href','/board/toDetailView?seq_board=' + dto.seq_board);
							a.css({
								"color":"black",
								"text-decoration":"none",
							});
							a.append(dto.board_title);
							a.appendTo(td2);
							
							td3 = $("<td>").append(dto.board_date);
							td4 = $("<td>").append(dto.board_count);
							td5 = $("<td>");
							td5.attr("id", "icon");
	
							let i = $("<i>");
							i.addClass("fa-solid fa-trash");
							span.append(i);
							td5.append(span);
	
							td6 = $("<td>").append(dto.seq_board);
							td6.addClass("d-none");
							td6.attr("id", "seq_board");
	
							span.addClass("text-center boardDelete");
							span.css("cursor", "pointer");
							span.on("click", function () {
							  boardDelete(this, "/mem/boardDelete", "seq_board");
							});
						  } else if (type === "모임") {
							td1 = $("<td>").append(dto.gboard_category);
							td2 = $("<td>");
							a = $("<a>");
							a.attr('href','/Gboard/toDetailView?seq_group_board=' + dto.seq_group_board);
							a.css({
								"color":"black",
								"text-decoration":"none",
							});
							a.append(dto.gboard_title);
							a.appendTo(td2);
							
							td3 = $("<td>").append(dto.written_date);
							td4 = $("<td>").append(dto.view_count);
							td5 = $("<td>");
							td5.attr('id', 'icon');
	
							let i = $("<i>");
							i.addClass("fa-solid fa-trash");
							span.append(i);
							td5.append(span);
	
							td6 = $("<td>").append(dto.seq_group_board);
							td6.addClass("d-none");
							td6.attr('id', 'seq_group_board');
	
							span.addClass("text-center boardGroupDelete");
							span.css("cursor", "pointer");
							span.on("click", function () {
							  boardDelete(this, "/mem/groupBoardDelete", "seq_groud_board");
							});
						  }
	
					
					tr.append(td1, td2, td3, td4, td5, td6);
					tr.appendTo("tbody");
				}
			}
		} 
		
		/* genal 동적 el가져다가 ajax로 받은거 사용하기 */
		function ajaxPagination(data, curPage, target, type, keyword) {
			console.log(data, curPage, target, type, keyword);
			let url;
			if (type === '일반') {
				if (!keyword) {
					url = "/mem/genalBoard"
				} else {
					url = "/mem/normalSearch"
				}
			} else if (type === '모임') {
				if (!keyword) {
					url = "/mem/meetingBoard"
				} else {
					url = "/mem/meetingSearch"
				}
			}
			target.on("click", function(e) {
				e.preventDefault();
				let category = $("#category option:selected").val();
				let user_email = $("#user_email").val();
				$.ajax({
					url,
					type:"get",
					data: {"category": category,"user_email": user_email, "curPage": curPage, "keyword": keyword},
					dataType: "json",
					success:function(data){
						if (type === '일반') {
							if (!keyword) {
								makeDynamicEl(data, curPage, type);
							} else {
								makeDynamicEl(data, curPage, type, keyword);
							}
						} else if (type === '모임') {
							if (!keyword) {
								makeDynamicEl(data, curPage, type);
							} else {
								makeDynamicEl(data, curPage, type, keyword);
							}
						}
					},
					error: function(e){
						console.log(e);
					}
				}); 
			})
		}
		/* 게시글 삭제 */
	// targetId = "#seq_group_board"
	// url = "/mem/boardDelete"
	// dataType = "seq_board"
	function boardDelete(target, url, dataType){
		let seq_board = +$(target).parent().next().text();
		let user_email = $("#user_email").val();
		Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  text: "다시 복구 할수 없습니다.!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      '삭제 완료!',
		      '희망 모임을 삭제하였습니다.',
		      'success'
		    ).then(function() {
		     	 $.ajax({
					url,
					type: "post",
					data: dataType === 'seq_board' ? {"seq_board": seq_board} : {"seq_group_board": seq_board},
					success:function(data){
						if(data =='success'){
							$(target).parent().parent().remove();
						}
					},
					error: function(e){
						console.log(e);
					}
				})  
               });
		  }
		})
	}
	$(".boardDelete").on("click", function() {
		boardDelete(this, "/mem/boardDelete", "seq_board")
	});
	
	$(".boardGroupDelete").on("click", function() {
		boardDelete(this, "/mem/groupBoardDelete", "seq_groud_board")
	});
	
	</script>
</body>
</html>