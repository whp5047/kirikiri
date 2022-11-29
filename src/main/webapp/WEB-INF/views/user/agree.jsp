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
<title>끼리끼리</title>
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
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
<style>
/* header */
header {
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
.privacyBox {
	width: 1000px;
	height: auto;
	border: 1px solid d2e3ec;
	text-align: center;
	background-color: #d2e3ec;
	margin-bottom: 150px;
	margin-top: 70px;
    text-align: left;
}

#privacyForm {
	padding-top: 10px;
	margin-top: 30px;
	height: 100%;
	text-align: left;
	border: 1px solid d2e3ec;
	background-color: white;
}

#privacyForm > .row{
	margin: 40px;
}

input[type="checkbox"] {
  width: 20px; 
  height: 20px; 
  margin: 5px;
  margin-bottom: 10px;
}

label{
	font-size: 17px;
	font-family : 'BMJUA';
}

.term{
	width: 95%;
	border: 1px solid black;
	height: 100px;
	overflow: scroll;
	overflow-x: hidden;
	color: #222F21;
	font-size : 15px;
}

button{
	margin : 5px;
	margin-bottom: 30px;
}

#cpBtn,#backBtn{
	color: black;
	border: none;
	border-radius: 5px;
	width: 10%;
	height: 90%;
}

#cpBtn{
	background-color: #18365291;
	color: white;
}

#backBtn{
	background-color: #d8d8d891;
}

#backBtn:hover{
	color: white;
}

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
</style>
</head>
<script>
$(document).ready(function(){
	$("#backBtn").click(function(){
		location.href = "/login/toLogin";
	})
	
	$("input:checkbox[name='checkboxAll']").click(function(){ 
		
		if($(this).is(":checked")){
			$("input:checkbox[name='essential']").prop("checked", true);
		} else {
			$("input:checkbox[name='essential']").prop("checked", false);
		}
	});
	
	$("input:checkbox[name='essential']").click(function(){ 
		if($(this).is(":checked")){
			$("input:checkbox[name='checkboxAll']").prop("checked", false);
		}else {
			$("input:checkbox[name='checkboxAll']").prop("checked", false);
		}
	});
	
	$("#cpBtn").click(function(){
		let check =$("input:checkbox[name='essential']:checked").length;
		if(check == 2){
			location.href = "/signup/toSignup";
		}else{
			Swal.fire({
				  title: '약관에 모두 동의해주세요.',
				  showClass: {
				    popup: 'animate__animated animate__fadeInDown'
				  },
				  hideClass: {
				    popup: 'animate__animated animate__fadeOutUp'
				  }
				})
		}
		
	})
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
                        <li class="nav-item"><a class="nav-link" href="/board/toBoard" style="font-size:18px;">자유게시판</a></li>
                           <c:if test="${empty loginSession}">
                              <li class="nav-item"><a class="nav-link" href="/login/toLogin">로그인</a></li>
                              <li class="nav-item"><a class="nav-link" href="/signup/toSignupAgree">회원가입</a></li>
                           </c:if>
                           <c:if test = "${not empty loginSession && loginSession.user_email eq 'admin'}">
                              <li class="nav-item"><a class="nav-link" href="/mem/myPage">마이페이지</a></li>
                              <li class="nav-item"><a class="nav-link" href="/admin/toAdmin">관리자페이지 이동</a></li>
                              <li class="nav-item"><a class="nav-link" href="/login/toLogout">로그아웃</a></li>
                           </c:if>
                           <c:if test = "${not empty loginSession && loginSession.user_email ne 'admin'}">
                              <li class="nav-item"><a class="nav-link" href="/mem/myPage">마이페이지</a></li>
                              <li class="nav-item"><a class="nav-link" href="/login/toLogout">로그아웃</a></li>
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
                        <ul class="navbar-nav mb-2 mb-lg-0 me-2" style = "font-size:18px;">
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
                                 src="/resources/images/profile.jpg" alt="mdo" width="40"
                                 height="40" class="rounded-circle">
                              </a>
                              <ul class="dropdown-menu text-small"
                                 aria-labelledby="dropdownUser1">
                                 <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                                 <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a>
                                 </li>
                                 <li>
                                    <hr class="dropdown-divider">
                                 </li>
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
                                 aria-expanded="false"> <img
                                 src="/resources/images/profile.jpg" alt="mdo" width="40"
                                 height="40" class="rounded-circle">
                              </a>
                              <ul class="dropdown-menu text-small"
                                 aria-labelledby="dropdownUser1">
                                 <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                                 <li><a class="dropdown-item" href="/group/toCreateGroup">모임생성</a>
                                 </li>
                                 <li>
                                    <hr class="dropdown-divider">
                                 </li>
                                 <li><a class="dropdown-item" href="/login/toLogout">로그아웃</a></li>
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
    <div class="container privacyBox">
        <div id="privacyForm">
			<div class="row ">
				<div class="col d-flex align-items-center">
					<input type="checkbox" name="checkboxAll">
					<label for="allCheck">끼리끼리 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</label>
				</div>
			</div>
			<div class="row mb-0">
				<div class="col d-flex align-items-center">
					<input type="checkbox" name="essential" id="termsService">
					<label for="termsService">끼리끼리 이용약관 동의(필수)</label>
				</div>
			</div>
			<div class="row mt-2 mb-2">
				<div class="col d-flex align-items-center">
					<div class="term w-100">
						 여러분을 환영합니다. 끼리끼리 서비스 및 제품(이하 ‘서비스’)을 이용해
						주셔서 감사합니다. 본 약관은 다양한 끼리끼리 서비스의 이용과 관련하여
						끼리끼리 서비스를 제공하는 끼리끼리 주식회사(이하 끼리끼리)와 이를 이용하는
						끼리끼리 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,
						아울러 여러분의 끼리끼리 서비스 이용에 도움이 될 수 있는 유익한
						정보를 포함하고 있습니다. 끼리끼리 서비스를 이용하시거나 끼리끼리 서비스
						회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을
						확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐
						주시기 바랍니다.
					  </div>
				</div>
			</div>

			<div class="row mb-0">
				<div class="col d-flex align-items-center">
					<input type="checkbox" name="essential" id="termsPrivacy">
					<label for="termsPrivacy">개인정보 수집 및 이용 동의(필수)</label>
				</div>
			</div>
			<div class="row mt-2 mb-2">
				<div class="col d-flex align-items-center">
					<div class="term w-100">
						 개인정보보호법에 따라 끼리끼리에 회원가입 신청하시는 분께 수집하는
						개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및
						이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내
						드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.1. 수집하는
						개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등
						대부분의 끼리끼리 서비스를 회원과 동일하게 이용할 수 있습니다.
						이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제
						서비스를 이용하기 위해 회원가입을 할 경우, 끼리끼리는 서비스
						이용을 위해 필요한 최소한의 개인정보를 수집합니다.
					</div>
				</div>
			</div>
			<div class="row" style="text-align: center; margin-bottom: 70px;" >
				<div class="col" style="margin-bottom: 30px;">
					<button type="button" id="backBtn">취소</button>
					<button type="button" id="cpBtn">확인</button>
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
</body>
</html>