<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet">
<title>회원가입성공</title>
<!--꽃가루-->
<script
	src="https://tistory4.daumcdn.net/tistory/3134841/skin/images/confetti_v2.js"></script>
<style>
/* header */
* {
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

.border-bottom{
    background-color: white;
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

/* header 반응형 끝 */
#logoImg {
   width: 50%;
}

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

/* 바디*/
body {
	background-color: #d2e3ec;
}
.signupBox { /* 컨텐츠 전체박스*/
	margin-top: 100px;
	width: 1000px;
	height: 1120px;
	border: 1px solid d2e3ec;
	text-align: center;
	margin: auto;
	background-color: #d2e3ec;
}

#userInfoBox { /* 흰색 영역*/
	padding-top: 3px;
	margin-top: 100px;
	width: 90%;
	margin: auto;
	border: 1px solid d2e3ec;
	background-color: white;
}

/*회원 가입 단계*/
.circleLine:only-child {
	display: inline-block;
}

.circle {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: white;
}

.circleLine>div[class*=col] {
	margin: 0;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
}

.circleLine>div[class*=col]>span {
	color: black;
	font-size: 20px;
}

.circleLine-line {
	height: 10%;
	width: 100%;
	background-color: white;
}

.circleLine-text {
	margin: auto;
	text-align: center;
	margin-bottom: 70px;
	margin-top: 10px;
}

.circleLine-text span {
	font-size: 17px;
}

/* 회원단계 1*/
#signup-3 {
	color: #030087;
	text-shadow: 1px 1px 2px darkblue;
}

.circelLine-text-right {
	color: #030087;
	text-shadow: 1px 2px 2px white;
	font-weight: bold;
	margin-left: 15px;
}

/*공통요소*/
p {
	margin-top: 10px;
}

button {
	margin: 40px;
	margin-bottom: 70px;
	width: 25%;
	height: 40%;
}

span {
	color: white;
	font-size: 0.05rem;
}

#kiri{
	width: 300px;
	height: 300px;
	margin-top : 40px;
	margin-bottom: 70px; 
}
h2{
	font-family: 'BMJUA';
	font-size : 40px;
}
/*풋터 영역*/
.footerBox {
	height: 0px;
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
   background-color: white;
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
/* 꽃가루 css */
canvas {
	z-index: 10;
	pointer-events: none;
	position: fixed;
	top: 0;
	transform: scale(1.1);
}
</style>
</head>
<script>
    $(document).ready(function(){

        $("#toLoginBtn").click(function(){
            location.href = "/login/toLogin";
        });


    })
</script>
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
	<!--바디-->
	<div class="container signupBox">
		<div class="row">
			<div class="col">
				<h1>회원 가입</h1>
			</div>
		</div>
		<div class="row circleLine justify-content-center">
			<div class="col-1 circle">
				<span id="signup-1">1</span>
			</div>
			<div class="col-3">
				<div class="circleLine-line"></div>
			</div>
			<div class="col-1 circle">
				<span id="signup-2">2</span>
			</div>
			<div class="col-3">
				<div class="circleLine-line"></div>
			</div>
			<div class="col-1 circle">
				<span id="signup-3">3</span>
			</div>
		</div>
		<div class="row circleLine-text justify-content-center">
			<div class="col-2">
				<span class="circelLine-text-left">회원 정보 입력</span>
			</div>
			<div class="col-5">
				<span id="circelLine-text-middle">회원 프로필 입력</span>
			</div>
			<div class="col-2">
				<span class="circelLine-text-right">회원가입 완료</span>
			</div>
		</div>
		<!-- info 영역-->
		<div id="userInfoBox">
			<div class="row mt-2">
				<div class="col">
					<img src="/resources/images/kirilogo.png" alt="오류가 발생했습니다">
				</div>
			</div>
			<div class="row">
				<div class="col pt-3">
					<h2>
						<br> 끼리끼리에 오신 것을 환영합니다!!
					</h2>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<img src="/resources/images/profileno.png"  id="kiri" alt="오류가 발생했습니다." />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<button type="button" id="toLoginBtn" class="btn" style="background-color: white; font-size: 20px;">로그인
					후 즐기기</button>
			</div>
		</div>
	</div>

<!-- Footer-->
  <div class="footerWrapper" style="border-top:1px solid #e0e3e8;">
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
                  <li class="list-inline-item"><a href="/signup/toSignupAgree">회원가입</a></li>
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
            <p class="text-muted small mb-4 mb-lg-0">
              끼리끼리(주) 대표 : 이호준 | 개인정보관리책임자 : 김영완 |
              사업자등록번호 : 22-02-22
            </p>
            <p class="text-muted small mb-4 mb-lg-0">
              주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩
            </p>
            <p class="text-muted small mb-4 mb-lg-0">
              &copy; Your Website 2022. All Rights Reserved.
            </p>
          </div>
          <div class="col-lg-3 h-100 text-center text-lg-start my-auto">
            <ul class="list-inline mb-0">
            <li class="list-inline-item me-4"><a
               href="https://ko-kr.facebook.com"><i class="bi-facebook fs-3"></i></a></li>
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

	<!--꽃가루-->
	<div class="buttonContainer d-none">
		<button class="canvasBtn" id="stopButton">Stop Confetti</button>
		<button class="canvasBtn" id="startButton">Drop Confetti</button>
	</div>

	<canvas id="canvas"></canvas>





	<script>



        // 꽃가루 실행
        $(document).ready(function(){

          function reAction(){
              $("#startButton").trigger("click");
              setTimeout(function(){
                  $("#stopButton").trigger("click");
              }, 6000);
          }
          reAction();
        });
        </script>


</body>
</html>