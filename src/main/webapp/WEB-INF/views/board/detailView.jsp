<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
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
   <!-- Bootstrap icons-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
<meta charset="UTF-8">
<title>게시글 상세보기</title>
    
    <style>
       /* header */
      header {
         font-family: 'MICEGothic Bold';
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
   
      /* 컨텐츠 영역 */
      body {
            background-color: #d2e3ec;
        }

        header+.container {
            background-color: white;
            padding-left: 80px;
            padding-right: 80px;
        }
      
      #detail{
         border-radius: 30px;
      }
      #detail{
           font-family: 'InfinitySans-RegularA1';
        }
      
        #category {
            background-color: #fce2e1;
            border-radius: 60px;
            color: black;
        }

        #title {
            font-weight: bold;
        }

        hr {
            opacity: 1;
        }
        
        #content{
           font-family: initial;
           word-wrap: break-word;
        }
          #content img{
             max-width: 100%;
             height: auto;
          }
      
      /* 좋아요 영역 */
      /* #body-like .col-auto{
         background-color: #fce2e1;
         border-radius: 50px;
      } */
      /* span.text-center{
         background-color: #fce2e1;
         border-radius: 20px;
         width: auto;
         padding: 10px;
         margin-bottom: 10px;
      } */
      
      .likeBtn{
             border: none;
             background-color: transparent;
          }
          .likeBtn img{
             width: 100px;
          }
      
      /* 댓글 영역 */
      /* #Commenttab .col-auto{
         margin-left: 10px;
         background-color: #d2e3ec;
         border-top-left-radius: 5px;
         border-top-right-radius: 5px;
      } */
      
      #commentWrapper{
         background-color: #edf6fa;
         border-radius: 10px;
      }
      
        .profileBox{
            /* background-color: gray; */
            width: 100px;
            height: 100px;
        }
        .profileBox img{
           border-radius: 50%;
            width: 100%;
            height: 100%;
        }
        .comment{
            border: none;
        }
        .defaultComment button, .afterComment button{
             border: none;
             background-color: transparent;
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

        /* 눈누 폰트 */
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

        @font-face {
            font-family: '양진체';
            src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
          font-family: 'EarlyFontDiary';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EarlyFontDiary.woff2') format('woff2');
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
   
   <!-- 디테일 뷰 -->
    <div id="detail" class="container my-5 py-5">
        <div class="row text-center">
            <div class="col-auto my-3 fs-5 py-1" id="category">${detail.boardDTO.board_category}</div>
        </div>

        <div class="row mt-3 mb-0">
            <h2 id="title" name="board_title">${detail.boardDTO.board_title}</h2>
        </div>

        <div class="row mt-4 justify-content-between align-items-center">
            <div class="col-auto" id="board-head-col">
                <i class="fa-regular fa-clock"></i>
                <span class="me-3">${detail.boardDTO.board_date}</span>
                <i class="fa-regular fa-font-awesome"></i>
                <span class="me-3">${detail.boardDTO.board_count}</span>
                <i class="fa-regular fa-comment-dots"></i>
                <span class="me-3">${detail.commentCnt}</span>
                <i class="fa-regular fa-heart"></i>
                <span>${like.likeHit}</span>
            </div>
            <div class="col-auto d-flex justify-content-end">
                <div class="fw-bold fs-4 me-2">작성자</div>
                <div class="fw-bold fs-4 me-3">|</div>
                <div class="fw-bold fs-4">${detail.boardDTO.user_nickname}</div>
            </div>
        </div>
        <hr size="4px;">
      
      <!-- 내용 -->
        <div class="row my-3">
            <div id="content">
                <p>${detail.boardDTO.board_content}</p>
            </div>
        </div>
        
        <!-- 좋아요 영역 -->
        <div class="row justify-content-center mb-3" id="body-like">
           <c:choose>
              <%-- 로그인 상태일 때 --%>
              <c:when test="${not empty loginSession.user_email}">
                 <c:choose>
                    <%-- 좋아요 안누름 --%>
                    <c:when test="${like.likeCheck == 0}">
                       <div class="col-12 text-center">
                          <button class="likeBtn" id="likeBefore" value="${detail.boardDTO.seq_board}">
                             <img src="/resources/images/board/likeText.png" alt="좋아요"><br>
                             <img src="/resources/images/board/like.png" alt="좋아요">
                          </button>
                       </div>
                       <span class="text-center">게시글에 좋아요를 눌러보세요!</span>
                    </c:when>
                    <%-- 좋아요 누름 --%>
                    <c:otherwise>
                       <div class="col-12 text-center">
                          <button class="likeBtn" id="likeAfter" value="${detail.boardDTO.seq_board}">
                             <img src="/resources/images/board/notLikeText.png" alt="좋아요"><br>
                             <img src="/resources/images/board/notLike.png" alt="좋아요취소">
                          </button>
                       </div>
                       <span class="text-center">좋아요를 취소할 수 있어요.</span>
                    </c:otherwise>
                 </c:choose>
              </c:when>
              
              <%-- 로그인 x일 때 --%>
              <c:otherwise>
                 <div class="col-auto">
                    <button class="likeBtn" id="like-notLoginBtn" value="${detail.boardDTO.seq_board}">
                       <img src="/resources/images/board/likeText.png" alt="좋아요"><br>
                       <img src="/resources/images/board/like.png" alt="좋아요">
                    </button>
               </div>
               <span class="text-center">로그인 후 좋아요를 눌러보세요!</span>
              </c:otherwise>
           </c:choose>
        </div>
      
      <!-- 댓글 영역 -->
        <div class="row" id="commentWrapper">
            <div class="col-12" id="body-comment">
                <!-- 댓글 출력 -->
                ${profile[0].USER_IMAGE}
                <c:choose>
                   <c:when test="${detail.commentList.size() == 0}">
                      <!-- 댓글 없으면 -->
                      <div class="col-12 my-3 text-center">
                         <p class="fs-4">등록된 댓글이 없습니다.</p>
                      </div>
                   </c:when>
                   <c:otherwise>
                      <c:forEach items="${detail.commentList}" var="comment">
                         <div class="row align-items-center py-3" style="border-bottom: 3px solid white;">
                            <!-- 프로필 이미지 -->
                             <div class="col-2 d-flex justify-content-center">                              
                                 <div class="profileBox">
                                    <c:if test="${comment.user_image eq null}">
                                       <!-- 기본이미지 -->
                                       <img src="/resources/images/profile.jpg">
                                    </c:if>
                                     <c:if test="${comment.user_image ne null}">
                                        <img src="/profile/${comment.user_image}">
                                        <%-- <c:if test=${comment.user_email eq profile.user_email}>
                                           <img src="/profile/${profile.user_image}">
                                        </c:if> --%>
                                    </c:if>
                                 </div>
                             </div>
                        <!-- 내용 -->
                             <div class="col-10">
                                 <div class="row mb-1 commentHead">
                                     <div class="col-auto ms-2">${comment.user_nickname}</div>
                                     <div class="col-auto ms-2">${comment.comment_date}</div>
                                     
                                     <!-- 댓글 수정/삭제 버튼 -->
                                  <c:if test="${comment.user_email eq loginSession.user_email}">
                                     <%-- 수정/삭제 --%>
                                     <div class="col-auto defaultComment">
                                        <button type="button" class="mod-commentBtn me-2" value="${comment.seq_comment}">
                                           <i class="fa-solid fa-eraser"></i>
                                        </button>
                                        <button type="button" class="del-commentBtn" value="${comment.seq_comment}">
                                           <i class="fa-solid fa-trash-can"></i>
                                        </button>
                                     </div>
                                     <%-- 완료/취소 --%>
                                     <div class="col-auto afterComment d-none">
                                        <button type="button" class="mod-completeBtn" value="${comment.seq_comment}">
                                           <i class="fa-solid fa-circle-check"></i>
                                        </button>
                                        <button type="button" class="mod-cancelBtn me-2">
                                           <i class="fa-solid fa-xmark"></i>
                                        </button>
                                     </div>
                                  </c:if>
                                 </div>
                                 <div class="row">
                              <div class="col-12">
                                 <textarea class="form-control comment" style="resize: none; background-color: transparent;" readonly>${comment.comment_content}</textarea>
                              </div>
                           </div>
                             </div>
                         </div>
                         
                      </c:forEach>
                   </c:otherwise>
                </c:choose>                
            </div>
        </div>

        <!-- 댓글 등록 -->
        <form id="commentForm" action="/comment/write" method="post">
           <div class="row mt-4 p-0 py-3" style="background-color: #f5fafc; border-radius: 10px">
              <input class="d-none" id="seq_board" name="seq_board" value="${detail.boardDTO.seq_board}">
            <div class="col-10">
               <!-- <input class="form-control" type="text" style="height: 60px" placeholder="댓글을 입력하세요."> -->
               <textarea id="inputComment" name="comment_content" style="resize: none;" class="form-control" placeholder="댓글을 입력하세요"></textarea>
            </div>
            <div class="col-2">
               <button type="button" id="write-commentBtn" class="btn w-100 h-100" style="background-color: #d2e3ec;">등록</button>
            </div>
           </div>
        </form>

       
        <!-- 게시글 수정 / 삭제 버튼 -->
        <div class="row mt-4 justify-content-center">
           <c:if test="${loginSession.user_email eq detail.boardDTO.user_email}">
               <div class="col-auto">
                   <button type="button" id="modifyBtn" class="btn" style="background-color: #d2e3ec;">수정</button>
               </div>
               <div class="col-auto">
                   <button type="button" id="deleteBtn" class="btn" style="background-color: #fce2e1;">삭제</button>
               </div>
           </c:if>
           <div class="col-auto">
              <button type="button" id="toListBtn" class="btn" style="background-color: #cfe4d8">목록으로</button>
           </div>
        </div>
      <form id="infoForm" method="get">
         <input type="hidden" id="seq_board" name="seq_board" value="${detail.boardDTO.seq_board}">
         <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
         <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
         <input type="hidden" name="type" value="${cri.type}">
         <input type="hidden" name="keyword" value="${cri.keyword}">
      </form>
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
       // 목록으로 돌아가기
       $("#toListBtn").on("click", function(){
          $("#infoForm").find("#seq_board").remove();
          $("#infoForm").attr("action", "/board/toBoard");
          $("#infoForm").submit();
       })
       
       // 게시글 수정
       $("#modifyBtn").on("click", function(){
          //location.href = "/board/toModify?seq_board=" + ${detail.boardDTO.seq_board};
          $("#infoForm").attr("action", "/board/toModify");
          $("#infoForm").submit();
       })
       
       // 게시글 삭제
       $("#deleteBtn").on("click", function(){
          Swal.fire({
             title: '정말 삭제하시겠어요?',
             text: "삭제한 게시글은 복구가 불가능해요.",
             icon: 'warning',
             showCancelButton: true,
             //confirmButtonColor: '#d2e3ec',
             //cancelButtonColor: '#fce2e1',
             confirmButtonText: '네, 삭제할래요.'
          }).then((result) => {
             if (result.isConfirmed) {
                location.href = "/board/delete?seq_board=" + ${detail.boardDTO.seq_board};
             }
          })
       })
       
       // 좋아요
       $("#body-like").on("click", ".likeBtn", function(){
          let seq_board = $(this).val();
          // 로그인 세션의 id
          let user_email = "${loginSession.user_email}";
          //let user_email = "abc123";
          
          if($(this).attr("id") == "likeBefore"){
             updateLike(seq_board, user_email);
          }else if($(this).attr("id") == "likeAfter"){
             //$(this).addClass("d-none");
             updateLike(seq_board, user_email);
          }
       })
       
       // 로그인 안한 상태에서 하트 클릭시
       $("#like-notLoginBtn").on("click", function(){
          Swal.fire({
              icon: 'warning',
              title: 'Oops...',
              text: '로그인 후 좋아요를 눌러주세요!',
              footer: '<a href="/login/toLogin">로그인 하러 가기</a>'
            })
       })
       
       // 좋아요 함수
       function updateLike(seq_board, user_email){
          $.ajax({
             type : "post"
             , url : "/like/boardLike"
             , dataType : "json"
             , data : {
                "seq_board" : seq_board
                , "user_email" : user_email
             }, success : function(likeCheck){
                console.log("ajax의 체크: " + likeCheck);
                if(likeCheck == 0){
                   Swal.fire({
                      icon: 'success',
                      title: '게시글에 좋아요를 눌렀어요!',
                      showConfirmButton: false,
                      timer: 1500
                   });
                   $("#body-like").load(location.href + " #body-like");
                   $("#board-head-col").load(location.href + " #board-head-col");
                }
                else if(likeCheck == 1){
                   Swal.fire({
                      icon: 'error',
                      title: '좋아요가 취소되었어요 ㅠ_ㅠ',
                      showConfirmButton: false,
                      timer: 1500
                   });
                   $("#body-like").load(location.href + " #body-like");
                   $("#board-head-col").load(location.href + " #board-head-col");
                }
             }, error : function(e){
                console.log(e);
             }
          });
       }
       
       
       // 댓글 등록
       $("#write-commentBtn").on("click", function(){
          if($("#inputComment").val() === ""){ // 댓글 입력창 비었으면
             Swal.fire({
               icon: 'warning'
               , title: 'Oops...'
               , text: '댓글 입력칸이 비었어요. 댓글을 입력해 보세요!'
            })
             return;
          }
          
          if("${loginSession}" == null || "${loginSession}" == ""){
             let timerInterval;
             Swal.fire({
                icon: 'warning'
                , title: 'Oops...'
                , text: '로그인 후 댓글을 작성해 주세요!'
                   , footer: '<a href="/login/toLogin">로그인 하러 가기</a>'
            })
             return;
          }
          
          let comment = $("#commentForm").serialize();
          $("#inputComment").val(""); // 댓글 입력창 초기화
          
          $.ajax({
             url : "/comment/write"
             , type : "post"
             , data : comment
             // , dataType : "json"
             , success : function(data){
                if(data === "success"){
                   Swal.fire({
                      icon: 'success',
                      title: '댓글 등록 완료!',
                      showConfirmButton: false,
                      timer: 1000
                   });
                   $("#body-comment").load(location.href + " #body-comment");
                   $("#board-head-col").load(location.href + " #board-head-col");
                }else{
                   Swal.fire({
                      icon: 'warning'
                      , title: 'Oops...'
                      , text: '댓글 등록에 실패했습니다.'
                   })
                }
             }, error : function(e){
                console.log(e);
             }
          })
       })
       
       // 댓글 수정
       $("#body-comment").on("click", ".mod-commentBtn", function(e){
          $(e.target).parents(".defaultComment").addClass("d-none");
          $(e.target).parents().next(".afterComment").removeClass("d-none");
          $(e.target).parents(".commentHead").next().find(".comment").attr("readonly", false).css("background-color", "white").focus();
       })
       
       // 댓글 수정 취소
       $("#body-comment").on("click", ".mod-cancelBtn", function(e){
          $(e.target).parents(".afterComment").addClass("d-none");
          $(e.target).parents().prev(".defaultComment").removeClass("d-none");
          $(e.target).parents(".commentHead").next().find(".comment").attr("readonly", true);
       })
       
       // 댓글 수정 완료
       $("#body-comment").on("click", ".mod-completeBtn", function(e){
          $(e.target).parents(".afterComment").addClass("d-none");
          $(e.target).parents().prev(".defaultComment").removeClass("d-none");
          $(e.target).parents(".commentHead").next().find(".comment").attr("readonly", true);
          
          let comment = $(e.target).parents(".commentHead").next().find("textarea").val();
          let seq_comment = $(e.target).parent().val();
          console.log(seq_comment);
          
          Swal.fire({
             title: '댓글을 수정하시겠어요?',
             showCancelButton: true,
             confirmButtonText: '저장',
             cancelButtonText: '취소'
          }).then((result) => {
             if (result.isConfirmed) {
                $.ajax({
                    url : "/comment/modify"
                    , type : "post"
                    , data : {
                       seq_comment : seq_comment
                       , "comment_content" : comment
                    }, success : function(data){
                       if(data === "success"){
                          Swal.fire('수정 완료!', '', 'success');
                           $("#body-comment").load(location.href + " #body-comment");
                          $("#board-head-col").load(location.href + " #board-head-col");
                       }else{
                          Swal.fire('수정 실패', '', 'error');
                       }         
                    }, error : function(e){
                       console.log(e);
                    }
                 });
             }
          });
       })
       
       // 댓글 삭제
       $("#body-comment").on("click", ".del-commentBtn", function(e){
          let seq_comment = $(e.target).parent().val();
          Swal.fire({
             title: '정말 삭제하시겠어요?',
             text: "삭제한 댓글은 복구가 불가능해요.",
             icon: 'warning',
             showCancelButton: true,
             //confirmButtonColor: '#d2e3ec',
             //cancelButtonColor: '#fce2e1',
             confirmButtonText: '네, 삭제할래요.'
          }).then((result) => {
             if (result.isConfirmed) {
                
                $.ajax({
                    url : "/comment/delete"
                    , type : "post"
                    , data : { seq_comment : seq_comment }
                    , success : function(data){
                       if(data === "success"){
                          Swal.fire('삭제 완료!', '', 'success');
                           $("#body-comment").load(location.href + " #body-comment"); 
                           $("#board-head-col").load(location.href + " #board-head-col");
                           //$("#Commenttab").load(location.href + " #Commenttab");
                       }else{
                          Swal.fire('삭제 실패', '', 'error');
                       }         
                    }, error : function(e){
                       console.log(e);
                    }
                 });
             }
          })
       })
       
    </script>
</body>
</html>