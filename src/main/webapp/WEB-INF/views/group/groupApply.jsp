<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link
   href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
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
<!-- 깃허브 alert -->
<!-- swal -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<title>그룹 가입신청</title>
<style>

@font-face {
    font-family: 'MICEGothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
@font-face {
    font-family: 'MICEGothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}


/* header */
header {
   font-family : 'MICEGothic Bold';
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

/*테이블 배경 및 범위*/
.tableinfo {
   margin-top: 50px;
}
/*버튼 및 테이블*/
.rowBtn {
   border: 5px solid #d2e3ec;
   width: 60%;
   margin: auto;
   margin-top: 50px;
   padding: 30px;
}

.btnBox {
   text-align: center;
   margin-bottom: 10px;
}

/*테이블*/
.table {
   width: 80%;
   margin: auto;
   margin-top: 40px;
   margin-bottom: 40px;
   font-size:20px;
   font-family:MICEGothic;
}

tr {
   text-align: center;
}

/*테이블 배경 및 범위*/
.tableinfo {
   margin-top: 50px;
}
.table-primary{
   font-weight:bold;
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
ul {
   list-style: none;
   padding: 0;
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

/*버튼4개*/
.btn-3d {
  position: relative;
  font-size: 22px;
  padding: 10px 15px;
  color: white;
  margin: 20px 10px 10px;
  border-radius: 6px;
  transition: top .01s linear;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
  cursor:pointer;
}
.btn-3d.blue:hover{
   background-color: #699DD1;
}
.btn-3d:active {
  top: 9px;
}
.btn-3d.blue:not(.applyBtn) {
  background-color: #6DA2D9;
  box-shadow: 0 0 0 1px #6698cb inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 rgba(110, 164, 219, .7),
        0 8px 0 1px rgba(0,0,0,.4),
        0 8px 8px 1px rgba(0,0,0,0.5);
}
/*가입신청 버튼 색 변경*/
.applyBtn{
   background-color: #aed6ff;
    box-shadow: 0 0 0 1px #6698cb inset, 0 0 0 2px rgb(255 255 255 / 15%) inset, 0 8px 0 0 rgb(110 164 219 / 70%), 0 8px 0 1px rgb(0 0 0 / 40%), 0 8px 8px 1px rgb(0 0 0 / 50%);
}
/*버튼 승인,거절*/
.btn-text {
    width: 200px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 55px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 50px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-text:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-text:focus {
    outline: none;
}
.btn-text.color-8 {
    background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
    box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);
}
.btn-text.color-11 {
   background-image: linear-gradient(to right, #eb3941, #f15e64, #e14e53, #e2373f);  
   box-shadow: 0 5px 15px rgba(242, 97, 103, .4);
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
      <div class="container-btn">
         <!-- 버튼 그룹 -->
         <div class="row rowBtn">
         <div class="col-md-3 btnBox">
            <div id = "groupApply" class="btn-3d blue applyBtn" style="font-weight: bold;">가입 신청</div>
         </div>
         <div class="col-md-3 btnBox">
            <div id="groupMember" class="btn-3d blue" style="font-weight: bold;">멤버 관리</div>
         </div>
         <div class="col-md-3 btnBox">
            <div id="groupModify" class="btn-3d blue" style="font-weight: bold;">모임 수정</div>
         </div>
         <div class="col-md-3 btnBox">
            <div id="groupDelete" class="btn-3d blue" style="font-weight: bold;">모임 해산</div>
         </div>
         </div>

         <!-- 테이블 -->
         <div class="row tableinfo">
            <div class="col-12 d-flex justify-content-center">
               <table class="table table-hover table-bordered">
                  <thead>
                     <tr class="table-primary">
                        <td>닉네임</td>
                        <td>소개</td>
                        <td>성별</td>
                        <td>생년월일</td>
                        <td>선택</td>
                     </tr>
                  </thead>
                  <tbody>
                     <c:if test="${map.MemberDTO.size() == 0}">
                        <tr>
                           <td colspan="5">가입신청 이력이 없습니다.</td>
                        </tr>
                     </c:if>
                     <c:if test="${map.MemberDTO.size() > 0}">
                        <c:forEach items="${map.MemberDTO}" var="list">
                           <tr>
                              <td>${list.user_nickname}</td>
                              <td>${list.user_intro}</td>
                              <td>${list.user_gender}</td>
                              <c:set var="date" value="${list.user_bd}" />
                              <c:set var="subDate" value="${fn:substring(date, 0, 10)}" />
                              <td>${subDate}</td>
                              <td><input class="form-check-input checkUser_email"
                                 type="checkbox" name="checkUser_email"
                                 value="${list.user_email}"></td>
                           </tr>
                        </c:forEach>
                     </c:if>
                  </tbody>
               </table>
            </div>
            <!-- 그룹번호 숨겨서 받기 -->
            <div class="d-none">
               <input type="text" value="${seq_group}" name="seq_group" id="seq_group">
               <input type="text" value="${count}" name="group_people"
                  id="group_people"> <input type="text"
                  value="${groupCount}" name="groupCount" id="groupCount">
            </div>
            <div class="row">
               <div class="col d-flex justify-content-center">
                     <button type = "submit" class="btn-text color-8" id="applyBtn">가입 승인</button>
                <button type = "button" class="btn-text color-11" id="denyBtn">가입 거절</button>
               </div>
            </div>
         </div>
      </div>
   </div>
  <!-- Footer-->
   <div class="footerWrapper" style="border-top:1px solid #e0e3e8; margin-top:200px;">
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
</body>
<script>

// 멤버관리 이동
$("#groupMember").on("click", function(){
   location.href = "/group/toGroupMember?seq_group="+$("#seq_group").val();
})
// 모임가입 이동
$("#groupApply").on("click", function(){
   location.href = "/group/toGroupApply?seq_group="+$("#seq_group").val();
})
   // 모임수정 이동
   $("#groupModify").on("click", function(){
      location.href = "/group/toModifyGroup?seq_group="+$("#seq_group").val();
   })
// 모임해산 이동
$("#groupDelete").on("click", function(){
   location.href = "/group/toGroupDelete?seq_group="+$("#seq_group").val();
})

   // 그룹 승인하기
   $("#applyBtn").on("click", function(){
      let count = $("#group_people").val();
      let groupCount = $("#groupCount").val();
      let seq_group = $("#seq_group").val();
      let checkBoxArr = [];
      $("input[name=checkUser_email]:checked").each(function(){
         checkBoxArr.push($(this).val());
      })
      if(checkBoxArr.length < 1){
          Swal.fire({
              icon: 'warning',
              text: '선택된 항목이 없습니다..',
            })
      }else{
         var jsonData = {
            "userEmails" : JSON.stringify(checkBoxArr),
            "seq_group" : seq_group
         };
         var jsonString = JSON.stringify(jsonData);

          $.ajax({
            url:"/group/completeApply?&group_people="+count+"&groupCount="+groupCount,
            headers: {'Content-Type': 'application/json'},
            type : "post",
            data: jsonString,
            success:function(data){
               if(data == "success"){
                     Swal.fire({
                          icon: 'success',
                          text: '승인이 완료되었습니다.',
                        })
               }else if(data == "error"){
                  Swal.fire({
                       icon: 'error',
                       title: 'Oops...',
                       text: '인원수를 확인해주세요!',
                     })
               }
               setTimeout(function() {
                       window.location.href = "";
                   },1500);
            },error : function(e){
               console.log(e);
            }
         })
      }
   })

   // 그룹 승인 거절하기
   $("#denyBtn").on("click", function(){
     let seq_group = $("#seq_group").val();
      let checkBoxArr = [];
      $("input[name=checkUser_email]:checked").each(function(){
         checkBoxArr.push($(this).val());
      })
      if(checkBoxArr.length < 1){
          Swal.fire({
              icon: 'warning',
              text: '선택된 항목이 없습니다.',
            })
      }else{
         var jsonData = {
            "userEmails" : JSON.stringify(checkBoxArr),
            "seq_group" : seq_group
         };
         var jsonString = JSON.stringify(jsonData);

          $.ajax({
            url:"/group/denyApply",
            headers: {'Content-Type': 'application/json'},
            type : "post",
            data: jsonString,
            success:function(data){
               Swal.fire({
                    icon: 'success',
                    text: '거절이 완료되었습니다.',
                  })
                  setTimeout(function() {
                          window.location.href = "";
                      },1500);
            },error : function(e){
               console.log(e);
            }
         })

      }
   })

</script>
</html>