<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
   rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>끼리끼리</title>
<style>
* {
	box-sizing: border-box;
	font-family: 'MICEGothic Bold';
}

@font-face {
	font-family: 'MICEGothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'SDSamliphopangche_Outline';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
    font-family: 'RixInooAriDuriR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/RixInooAriDuriR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

            * {
               box-sizing: border-box;
               font-family: 'MICEGothic Bold';
            }

            @font-face {
               font-family: 'MICEGothic Bold';
               src:
                  url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
               font-weight: 700;
               font-style: normal;
            }

            /* header 반응형 */
            @media (max-width : 768px) {
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
header {
    font-family: 'MICEGothic Bold';
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

            @media (min-width : 768px) {
               #navibar {
                  display: none;
               }
            }

            /* header 반응형 끝 */
            #logoImg {
               width: 50%;
            }

            /*맨위 사진*/
            .topimg {
               background-color: #d2e3ec;
               width: 100%;
            }

            .txtBox div {
               color: rgba(85, 85, 95, 0.993);
            }

            .txtBox>div:first-child {
               font-size: 35px;
               color: navy;
               text-shadow: 3px 3px white;
            }

            /* 동그라미 세개 */
            .circleImg {
               width: 200px;
               height: 200px;
               background-color: #faead2;
               border-radius: 50%;
            }

            .circleTitle {
               font-size: 26px;
               color: #83c8e5;
            }

            #circle_img {
               width: 100%;
               height: 100%;
               border-radius: 50%;
            }

            /* 네모네모 영역 */
            .mainImg {
               object-fit: cover;
            }

            #bestParty {
               background-color: #e8f5ed;
               font-family: 'Do Hyeon', sans-serif;
            }

            a {
               text-decoration: none;
               color: black;
            }

            /*모임영역 카드6개*/
            /* body menu */
            .menu {
               background-color: #d2e3ec;
               width: 100%;
               height: 100px;
               align-items: center;
               margin-top: 40px;
            }

            .btn-group {
               width: 100%;
               background-color: #e0ecf3;
            }

            .active,
            .dropnav {
               font-weight: bold;
               color: #1d76c9;
               font-size: 30px;
               cursor: pointer;
            }

            .active:hover {
               transition: 0.8s ease-in;
               transform: scale(1.1);
               transform: translate(0, -5px);
            }

            .show1,
            .show {
               z-index: 1;
            }

            .dropdown-menu[data-bs-popper] {
               top: 70%;
            }

            .text {
               color: black;
               font-weight: bold;
               font-size: 30px;
               cursor: pointer;
               font-family: 'RixInooAriDuriR';
            }

            .text:hover {
               transition: 0.5s ease-in;
               transform: scale(1.1);
               transform: translate(0, -5px);
            }

            /* all, new, best 부분 css */
            .contentAll,
            .contentNew,
            .contentBest {
               width: 100%;
               margin-bottom: 0px;
               background-color: #d2e3ec42;
               margin-left: 0px;
            }

            .imgContainer {
               padding-bottom: 10px;
            }

            .card {
               width: 350px;
               border: 3px solid #b5cdd9;
               cursor: pointer;
            }

            .card-body {
               background-color: #fafdff;
               padding-bottom: 0px;
            }

            .card>img {
               width: 100%;
            }

            .card-img-top {
               width: 18rem;
               height: 13rem;
            }

            .card-text {
               height: 48px;
            }

            .card-text-category {
               width: fit-content;
               padding: 4px;
               background-color: #e26b8b;
               height: 22px;
               border-radius: 5px;
               font-size: 14px;
            }

            .card-text-site {
               height: 30px;
            }

            .more {
               width: 100%;
               height: 50px;
               text-align: center;
               margin-top: 20px;
               background-color: #e0ecf3;
               cursor: pointer;
            }

            button {
               margin-top: 50px;
               outline: none;
               height: 50px;
               width: 250px;
            }

            /*앱 광고*/

            .phoneImgBox {
               height: 400px;
            }

            .phoneImgBox img {
               height: 400px;
            }

            .phoneContainer {
               position: relative;
            }

            .appBox {
               width: 160px;
               height: 40px;
               background-color: black;
               border-radius: 6px;
               padding: 0;
            }

            .appBoxText {
               font-size: 14px;
               padding: 0;
            }

            .appleLogo {
               font-size: 30px;
            }

            .googleLogo {
               font-size: 28px;
            }

            .downLoadSmallText {
               font-size: 10px;
            }

            /* footer */
.footer-imgBox img {
	max-width: 100%;
}

.footerWrapper {
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
	text-align: center;
}

.footer-imgBox {
	height: 100%;
	text-align: center;
}

            /*모임생성 버튼*/
            @import url(https://fonts.googleapis.com/css?family=Roboto:700);

            .button {
               background: #3D4C53;
               width: 200px;
               height: 50px;
               overflow: hidden;
               text-align: center;
               transition: .2s;
               cursor: pointer;
               border-radius: 3px;
               box-shadow: 0px 1px 2px rgba(0, 0, 0, .2);
            }

            .btnTwo {
               position: relative;
               width: 200px;
               height: 100px;
               margin-top: -100px;
               padding-top: 2px;
               background: #26A69A;
               left: -250px;
               transition: .3s;
            }

            .btnText {
               color: white;
               padding-top: 13px;
               transition: .3s;
            }

            .btnText2 {
               margin-top: 60px;
               margin-right: -130px;
               color: #FFF;
            }

            .button:hover .btnTwo {
               /*When hovering over .button change .btnTwo*/
               left: -130px;
            }

            .button:hover .btnText {
               /*When hovering over .button change .btnText*/
               margin-left: 65px;
            }

            .button:active {
               /*Clicked and held*/
               box-shadow: 0px 5px 6px rgba(0, 0, 0, 0.3);
            }

            /**/
            :root {
               --bg: #3C465C;
               --primary: #6782e5;
               --solid: #fff;
               --btn-w: 300px;
               --dot-w: calc(var(--btn-w)*.2);
               --tr-X: calc(var(--btn-w) - var(--dot-w));
            }

            .btn {
               position: relative;
               margin: 0 auto;
               width: 300px;
               color: #8791b5;
               border: 0.15em solid #6782e5;
               border-radius: 5em;
               text-transform: uppercase;
               text-align: center;
               font-size: 1.3em;
               line-height: 2em;
               cursor: pointer;
            }

            .btn:hover {
               color: #b6cdef;
            }

            .dot {
               content: '';
               position: absolute;
               top: 0;
               width: 20px;
               height: 100%;
               border-radius: 100%;
               transition: all 300ms ease;
               display: none;
            }

            .dot:after {
               content: '';
               position: absolute;
               left: calc(50% - .4em);
               top: -.4em;
               height: .8em;
               width: .8em;
               background: var(--primary);
               border-radius: 1em;
               border: .25em solid var(--solid);
               box-shadow: 0 0 .7em var(--solid),
                  0 0 2em var(--primary);
            }

            .btn:hover .dot,
            .btn:focus .dot {
               animation: atom 2s infinite linear;
               display: block;
            }

            @keyframes atom {
               0% {
                  transform: translateX(0) rotate(0);
               }

               30% {
                  transform: translateX(var(--tr-X)) rotate(0);
               }

               50% {
                  transform: translateX(var(--tr-X)) rotate(180deg);
               }

               80% {
                  transform: translateX(0) rotate(180deg);
               }

               100% {
                  transform: translateX(0) rotate(360deg);
               }
            }

            *:before,
            *:after {
               box-sizing: border-box;
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
                                  <c:if test="${loginType ne 'kakao'}">
                                  	 <li><a class="dropdown-item mt-2" href="/login/toLogout">로그아웃</a></li>
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
         <div class="container">
            <!-- 그림 -->
            <div class="topimg row">
               <div class="col-md-6">
                  <img src="/resources/images/메인사진1(배경x).png" id="topimg">
               </div>
               <div class="txtBox col-md-6 d-flex flex-column align-items-center justify-content-center">
                  <div id="mainText">'끼리끼리'와 함께하는 취미생활</div>
                  <div class="mt-3 w-75">올해 하고 싶은 취미가 무엇이든 끼리끼리가 도와드릴 수 있습니다.
                     이제부터 사람들과 취미에 대해 이야기하고 싶다면 '끼리끼리'를 찾아주세요. 매일 많은 사람들과 소통하고 싶다면 가입하여
                     즐거운 시간을 보내세요.</div>
                  <div class="mt-4 w-75">취미가 없고 지루한 일상이 싫다면 모임을 가입하세요. 즐거운 모임으로
                     새로운 세상을 찾아요.</div>
                  <div class="mt-4">
                     <div class="button">
                        <p class="btnText">모임만들기</p>
                        <div class="btnTwo">
                           <p class="btnText2">Go!</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <!--동그라미세개-->
            <!--상단 텍스트 -->
            <div class="row mt-5">
               <div class="col-md-12 text-center">
                  <h3>
                     <strong>끼리끼리가 이루어지는 방식</strong>
                  </h3>
                  <p>
                     온라인과 대면 이벤트를 통해 관심사를 공유할 새로운 사람들을 만나보세요.<br>계정을 무료로 생설할 수
                     있습니다.
                  </p>
               </div>
            </div>


		<!--원그림-->
		<div class="row">
			<div
				class="circleBox col-md-4 d-flex flex-column justify-content-center align-items-center">
				<div class="circleImg" data-aos="flip-left" data-aos-duration="1000">
					<img src="/resources/images/aksu.png" id="circle_img">
				</div>
				<div class="w-100">
					<p class="text-center mt-4 circleTitle">그룹 가입하기</p>
					<p>공통된 관심사인 사람을 만나고, 자신의 커뮤니티를 찾아보세요.</p>
				</div>
			</div>
			<div
				class="circleBox col-md-4 d-flex flex-column justify-content-center align-items-center">
				<div class="circleImg" data-aos="flip-left" data-aos-duration="1000"
					data-aos-delay="100">
					<img src="/resources/images/dodbogi.png" id="circle_img">
				</div>
				<div class="w-100">
					<p class="text-center mt-4 circleTitle">이벤트 찾기</p>
					<p>자신이 생각하시는 모든 주제에 대한 이벤트가 이루어집니다!</p>
				</div>
			</div>
			<div
				class="circleBox col-md-4 d-flex flex-column justify-content-center align-items-center">
				<div class="circleImg" data-aos="flip-left" data-aos-duration="1000"
					data-aos-delay="200">
					<img src="/resources/images/update_chatting.png" id="circle_img">
				</div>
				<div class="w-100">
					<p class="text-center mt-4 circleTitle">모임간 소통</p>
					<p>사람들을 모으고 공통의 관심사를 찾기 위해 전문가가 될 필요는 없죠!</p>
				</div>
			</div>
		</div>

      <!--가입 하기 버튼-->
      <div class="row mt-2">
         <div class="signUpBox col text-center">
         <div class="btn">
             <a href="/signup/toSignupAgree" style = "color:#0a58ca;"><span>가입하기</span></a>
          <div class="dot"></div>
           </div>
         </div>
      </div>

<!-- 네모네모 -->
      <div id="bestParty" class="p-4 mt-5">
         <div class="bestTitle row justify-content-center">
            <img src="/resources/images/BestBoard.png" style="width: 50%">
         </div>
         <div class="row text-center mb-4">
            <h5 style="color: darkgreen;">끼리끼리 회원들에게 가장 많은 좋아요를 받은 게시물을
               살펴보세요!</h5>
         </div>
         <div class="content-1" data-aos="fade-left" data-aos-duration="1000">
            <div class="row g-0 align-items-center">
               <c:if test="${boardList eq null}">
                     없습니다~
               </c:if>
               <c:if test="${boardList ne null}">
                  <div class="col-xl-6 text-end px-5">

                     <div class="text-start">
                        <img src="/resources/images/gold.png" style="width: 80px;">
                        <span
                           style="font-size: 45px; font-family: 'SDSamliphopangche_Outline';">
                           BEST LIKES </span>
                     </div>
                     <div class="fs-4">
                        <i class="fa-regular fa-heart" style="color: red"></i> <span
                           class="me-3">${boardList.get(0).likehit }</span> <i
                           class="fa-regular fa-eye" style="color: gray"></i> <span>${boardList.get(0).board_count }</span>
                     </div>
                     <div class="fs-2 mt-4">${boardList.get(0).board_title }</div>
                     <div class="my-2 fs-5">by ${boardList.get(0).user_nickname }
                     </div>
                     <div>
                        <a
                           href="/board/toDetailView?seq_board=${boardList.get(0).seq_board }"
                           style="color: #6f6f6f;">자세히 <i
                           class="fa-solid fa-arrow-up-right-from-square"></i></a>
                     </div>
                  </div>
                  <div class="mainImg col-xl-6 ms-auto d-flex align-items-center">
                     <c:if test="${sysList.get(0) eq null }">
                        <img src="/resources/images/찜2.jpg"  class="img-fluid">
                     </c:if>
                     <c:if test="${sysList.get(0) ne null }">
                        <img src="/boardFile/${sysList.get(0)}" style="max-height : 400px; width : 100%;">
                     </c:if>
                  </div>
               </c:if>
            </div>
         </div>
         <!-- 게시물 뽑아오기 하기 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
         <div class="content-2 mt-3" data-aos="fade-right"
            data-aos-duration="1000">
            <div class="row g-0 mt-5 align-items-center">
               <c:if test="${boardList eq null}">
                        없습니다~
                     </c:if>
               <c:if test="${boardList.size()>=2}">
                  <div class="mainImg col-xl-6 mb-4 mb-lg-0">
                     <c:if test="${sysList.get(1) eq null }">
                        <img src="/resources/images/찜2.jpg" class="img-fluid">
                     </c:if>
                     <c:if test="${sysList.get(1) ne null }">
                        <img src="/boardFile/${sysList.get(1)}" style="max-height : 400px; width : 100%;">
                     </c:if>
                  </div>
                  <div class="col-xl-6 ms-auto pe-5 px-5">
                     <div>
                        <img src="/resources/images/silver.png" style="width: 80px;">
                        <span
                           style="font-size: 45px; font-family: 'SDSamliphopangche_Outline';">
                           BEST LIKES </span>
                     </div>
                     <div class="fs-4 mt-2 text-end">
                        <i class="fa-regular fa-heart" style="color: red"></i> <span
                           class="me-3">${boardList.get(1).likehit }</span> <i
                           class="fa-regular fa-eye" style="color: gray"></i> <span>${boardList.get(1).board_count }</span>
                     </div>
                     <div class="fs-2 mt-4 ps-2 ">${boardList.get(1).board_title }</div>
                     <div class="my-2 fs-5 ps-2 ">by
                        ${boardList.get(1).user_nickname }</div>
                     <div class="ps-2">
                        <a
                           href="/board/toDetailView?seq_board=${boardList.get(1).seq_board }"
                           style="color: #6f6f6f;">자세히 <i
                           class="fa-solid fa-arrow-up-right-from-square"></i></a>
                     </div>
                  </div>
               </c:if>
            </div>
         </div>
      </div>

		<!-- 애플리케이션 -->
		<div class="acontainer mt-5">
			<div class="row mt-3">
				<div
					class="col-md-5 phoneImgBox d-flex align-items-center justify-content-center">
					<img src="/resources/images/smartphone.png">
				</div>
				<div
					class="col-md-7 d-flex align-items-center justify-content-center">
					<div
						class="phoneTextBox d-flex flex-column justify-content-center align-items-center mt-2">
						<div class="downloadHead">
							<h1>
								<span style="font-size: 50px; color: #4285f4;">끼</span><span
									style="font-size: 50px; color: #9e9e9e;">리</span><span
									style="font-size: 50px; color: #4285f4;">끼</span><span
									style="font-size: 50px; color: #9e9e9e;">리</span> 모바일 앱 출시!
							</h1>
						</div>
						<div class="downloadTtitle mt-3">
							<strong>이제 끼리끼리를 앱에서도 사용할 수 있습니다.</strong>
						</div>
						<div class="downloadContent">
							<label><strong style="font-size: 30px;">남은 시간</strong><br></label>
							<strong id="sample01" style="color: red"></strong>
						</div>
						<div class="downloadBtn mt-3 d-flex">
							<div class="row appBox">
								<div class="col-4 text-center mt-1" style="color: #fff;">
									<i class="fa-brands fa-apple w-100 appleLogo"></i>
								</div>
								<div
									class="col-8 appBoxText d-flex flex-column justify-content-center"
									style="color: #fff;">
									<span><strong>AppStore</strong>에서</span> <span
										class="downLoadSmallText">다운로드 하기</span>
								</div>
							</div>
							<div class="row appBox ms-5">
								<div class="col-4 text-center mt-1" style="color: #fff;">
									<i class="fa-brands fa-google-play w-100 googleLogo"></i>
								</div>
								<div
									class="col-8 appBoxText d-flex flex-column justify-content-center"
									style="color: #fff;">
									<span><strong>Android</strong>에서</span> <span
										class="downLoadSmallText">다운로드 하기</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

      <!-- 모임 나타나기 -->
      <!-- menubar -->
      <div class="row menu ms-0">
         <div class="col-4 d-flex justify-content-end text allGroup">ALL</div>
         <div class="col-4 d-flex justify-content-center text newGroup">NEW</div>
         <div class="col-4 d-flex justify-content-start text bestGroup">BEST</div>
      </div>
    <!-- 모임 card 캐러셀 All -->
      <div class="row contentAll">
         <div class="col p-0">
            <div class="content2">
               <div class="imgContainer">
                  <div class="row">
                     <c:forEach items="${selectAllList}" var="dto" begin="0" end = "5">
                        <div class="col-md-4 d-flex justify-content-center p-4">
                           <div class="card" data-aos="flip-up" data-aos-duration="1000">
                                 <c:choose>
                           <c:when test="${dto.sys_name ne null}">
                              <img src="/group_profile/${dto.sys_name}" id="profile_image" class="card-img-top">
                           </c:when>
                           <c:otherwise>
                              <img src="/resources/images/메인사진2(배경).png" id="profile_image" class="card-img-top">
                           </c:otherwise>
                        </c:choose>
                        <span class="d-none seq_group">${dto.seq_group}</span>
                              <div class="card-body">
                                 <div class="card-text-category d-flex justify-content-center align-items-center" style="color:#fff;">
                                    ${dto.group_category}
                                 </div>
                                 <div class="card-text mt-1">
                                    <strong>${dto.group_title}</strong>
                                 </div>
                                 <div class="card-text-site d-flex justify-content-end align-items-center">
                                    <i class="fa-solid fa-location-dot"></i><span class="ms-2">${dto.group_site}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
             <div class="col-md-12" style="width: 100%">
               <div class="d-flex justify-content-center align-items-center more">
                  <span>더보기</span><span class = "ms-2"><i class="fa-solid fa-arrow-right-to-bracket"></i></span>
              </div>
            </div>
         </div>
      </div>

      <!-- 모임 card 캐러셀 New -->
      <div class="row contentNew d-none">
         <div class="col p-0">
            <div class="content2">
               <div class="imgContainer">
                  <div class="row">
                     <c:forEach items="${selectNewList}" var="dto" begin="0" end = "5">
                        <div class="col-md-4 d-flex justify-content-center p-4">
                           <div class="card" data-aos="flip-up" data-aos-duration="1000">
                                 <c:choose>
                           <c:when test="${dto.sys_name ne null}">
                              <img src="/group_profile/${dto.sys_name}" id="profile_image" class="card-img-top">
                           </c:when>
                           <c:otherwise>
                              <img src="/resources/images/메인사진2(배경).png" id="profile_image" class="card-img-top">
                           </c:otherwise>
                        </c:choose>
                        <span class="d-none  seq_group">${dto.seq_group}</span>
                              <div class="card-body">
                                 <div class="card-text card-text-category d-flex justify-content-center align-items-center" style="color:#fff;">
                                    ${dto.group_category}
                                 </div>
                                 <div class="card-text mt-1">
                                    <strong>${dto.group_title}</strong>
                                 </div>
                                 <div class=" d-flex card-text-site justify-content-end align-items-center">
                                    <i class="fa-solid fa-location-dot"></i><span class="ms-2">${dto.group_site}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
             <div class="col-12" style="width: 100%">
               <div class="d-flex justify-content-center align-items-center more">
                  <span>더보기</span><span class = "ms-2"><i class="fa-solid fa-arrow-right-to-bracket"></i></span>
              </div>
            </div>
         </div>
      </div>

      <!-- 모임 card 캐러셀 Best -->
      <div class="row contentBest d-none">
         <div class="col p-0">
            <div class="content2">
               <div class="imgContainer">
                  <div class="row">
                     <c:forEach items="${selectBestList}" var="dto" begin="0" end = "5">
                        <div class="col-md-4 d-flex justify-content-center p-4">
                           <div class="card" data-aos="flip-up" data-aos-duration="1000">
                                 <c:choose>
                           <c:when test="${dto.sys_name ne null}">
                              <img src="/group_profile/${dto.sys_name}" id="profile_image" class="card-img-top">
                           </c:when>
                           <c:otherwise>
                              <img src="/resources/images/메인사진2(배경).png" id="profile_image" class="card-img-top">
                           </c:otherwise>
                        </c:choose>
                        <span class="d-none  seq_group">${dto.seq_group}</span>
                              <div class="card-body">
                                 <div class="card-text card-text-category d-flex justify-content-center align-items-center" style="color:#fff;">
                                    ${dto.group_category}
                                 </div>
                                 <div class="card-text mt-1">
                                    <strong>${dto.group_title}</strong>
                                 </div>
                                 <div class="card-text-site d-flex justify-content-end align-items-center">
                                    <i class="fa-solid fa-location-dot"></i><span class="ms-2">${dto.group_site}</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
             <div class="col-12" style="width: 100%">
               <div class="d-flex justify-content-center align-items-center more">
                  <span style = "font-color:grey;">더보기</span><span class = "ms-2"><i style = "font-color:grey;" class="fa-solid fa-arrow-right-to-bracket"></i></span>
              </div>
            </div>
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
   <!-- 모임생성 고! 버튼 -->
   let check = "${loginSession.user_email}";
    $(".button").on("click", function(){
    if(check != ""){
         location.href = "/group/toCreateGroup";
      }else{
         Swal.fire({
                 icon: 'warning',
                 text: '로그인 후 사용하실수 있습니다..',
               })
      }
   })
   <!-- 가입하기 버튼 -->
   $(".btn").on("click", function(){
      location.href = "/signup/toSignupAgree";
   })
   <!-- AOS 스크립트 시작 -->
      AOS.init(); // 자바스크립트로 init()을 해야 동작한다.

      const countDownTimer = function(id, date) {
         var _vDate = new Date(date); // 전달 받은 일자
         var _second = 1000;
         var _minute = _second * 60;
         var _hour = _minute * 60;
         var _day = _hour * 24;
         var timer;

         function showRemaining() {
            var now = new Date();
            var distDt = _vDate - now;

            if (distDt < 0) {
               clearInterval(timer);
               document.getElementById(id).textContent = "해당 이벤트가 종료 되었습니다!";
               return;
            }

            var days = Math.floor(distDt / _day);
            var hours = Math.floor((distDt % _day) / _hour);
            var minutes = Math.floor((distDt % _hour) / _minute);
            var seconds = Math.floor((distDt % _minute) / _second);

            document.getElementById(id).textContent = days + "일 ";
            document.getElementById(id).textContent += hours + "시간 ";
            document.getElementById(id).textContent += minutes + "분 ";
            document.getElementById(id).textContent += seconds + "초";
         }

         timer = setInterval(showRemaining, 1000);
      };

      var dateObj = new Date();
      dateObj.setDate(dateObj.getDate() + 1);

      countDownTimer("sample01", dateObj); // 내일까지




      // 그룹영역 all, new, best d-none 주고, 풀기
      $(".allGroup").on("click", function(){
         $(".contentAll").removeClass("d-none");
         $(".contentNew").addClass("d-none");
         $(".contentBest").addClass("d-none");
      })
      $(".newGroup").on("click", function(){
         $(".contentAll").addClass("d-none");
         $(".contentNew").removeClass("d-none");
         $(".contentBest").addClass("d-none");
      })
      $(".bestGroup").on("click", function(){
         $(".contentAll").addClass("d-none");
         $(".contentNew").addClass("d-none");
         $(".contentBest").removeClass("d-none");
      })

      // 모임 card 눌러서 모임상세페이지 가기
      $(".card").on("click", function(){
         let seq_group = $(this).children('span').text();
         console.log(seq_group);
         location.href = "/group/toGroupDetail?seq_group="+seq_group;
      })

      // 그룹영역 더보기 눌러서 페이지 이동
      $(".more").on("click", function(){
         location.href = "/user/toViewAllGroupList";
      })
   </script>
      </body>

      </html>