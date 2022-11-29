<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자-회원관리</title>
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
<!--알림창-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<style>
* {
	box-sizing: border-box;
	font-family: 'MICEGothic Bold';
}

/* 눈누 폰트 */
@font-face {
	font-family: 'BMJUA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'MICEGothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

.container{
   max-width: -webkit-fill-available;
   height:100%;
   padding : 0px;
}

/*사이드바*/
.sidebar {
	float: left;
	width: 15%;
	height: 1200px;
	background-color: #4e78f5;
}

.sidebar span {
	font-family: 'BMJUA';
}

.sidebar li {
	list-style: none;
	border-bottom: 3px solid rgba(255, 255, 255, 0.63);
	text-align: center;
}

.sidebar a:hover {
	color: white;
}

.logoHome span {
	color: white;
	font-size: x-large;
	font-weight: 80px;
}

#logoImg {
	width: 70%;
}

i {
	margin-top: 15px;
	margin-bottom: 15px;
}

a {
	text-decoration: none;
	font-size: larger;
	color: rgba(255, 255, 255, 0.683);
}

/*네비바*/
.navbar {
	float: right;
	height: 104px;
	width: 85%;
	background-color: white;
	position: relative;
}

.user {
	border-radius: 50%;
	width: 50px;
	height: 50px;
	position: absolute;
	right: 20px;
	background-color: white;
	border: 1px solid gainsboro;
}

.userName {
	position: absolute;
	right: 80px;
}

#user_img {
	border-radius: 50%;
	width: 50px;
	height: 50px;
}

.logOut {
	position: absolute;
	right: 19px;
	top: 28px;
	border-radius: 50%;
	width: 50px;
	height: 50px;
	background-color: gray;
	display: none;
}

.logout {
	position: absolute;
	top: -7px;
	right: 8px;
	font-size: xx-large;
	color: white;
}

/*content*/
.contents {
	background-color: rgb(224, 230, 243);
	width: 100%;
	height: 1200px;
}

/*회원관리 색 다르게*/
.memberMenu {
	background-color: #a0e4f9ac;
}

.memberMenu>a {
	color: white;
}

/*content안에*/
.title{
	width:75%;
	margin: auto;
}
.reportBox {
	margin: auto;
	width: 75%;
	height : max-content;
	max-height: 200px;
	background-color: white;
	overflow-y: scroll;
}

.reportBox::-webkit-scrollbar {
	display: none;
}

.searchBox {
	margin: auto;
	width: 75%;
	height: 70px;
	background-color: white;
}

.resultBox {
	margin: auto;
	width: 75%;
	height: max-content;
	max-height : 550px;
	background-color: white;
}

.resultBox::-webkit-scrollbar {
	display: none;
}

.resultBox span {
	height: max-content;
}

tbody tr {
	border-top: 1px solid gainsboro;
	color: rgb(103, 103, 103);
	text-align: center;
}

td{
	font-size : 12px;
}

td>a {
	color: rgb(103, 103, 103);
	font-size: 12px;
}

</style>
</head>

<body>
	<div class="container">
		<div class="sidebar">
			<ul class="p-2">
				<li class="logoHome"><a href="/admin/toAdmin"> <img
						src="/resources/images/adminLogo.png" id="logoImg"><br>
						<span>끼리끼리</span>
				</a></li>
				<li class="sidemenu memberMenu"><a
					href="/admin/toMember?curPage=1"> <i
						class="fa-solid fa-users-rectangle"></i><br> <span>회원
							관리</span>
				</a></li>
				<li class="sidemenu"><a href="/admin/toBoard?curPage=1"> <i
						class="fa-solid fa-table"></i><br> <span>게시물 관리</span>
				</a></li>
				<li class="sidemenu"><a href="/admin/toGroupAdmin?curPage=1"> <i
						class="fa-solid fa-house-user"></i><br> <span>모임 관리</span>
				</a></li>
			</ul>
		</div>
		<div class="navbar">
			<div class="userName">| &nbsp&nbsp admin</div>
			<div class="user">
				<img src="/resources/images/해삐루피.png" id="user_img">
			</div>
			<div class="logOut">
				<i class="logout fa-solid fa-arrow-right-from-bracket"></i>
			</div>
		</div>
		<div class="contents">
			<div class="row title">
				<div class="col d-flex mt-4">
					<h4 style="color: darkblue; text-shadow: 1px 1px 1px dodgerblue;">회원
						신고 관리</h4>
				</div>
				<div class="col d-flex me-3 justify-content-end align-items-center">
					<button type="button" class="btn btn-primary" id="submitBtn">블랙리스트
						등록</button>
					<button type="button" class="btn btn-secondary ms-1" id="deleteBtn">신고
						삭제</button>
				</div>
			</div>
			<div class="row reportBox">
				<span>신고 건수 <span style="color: navy">${reportList.size()}</span>개
				</span>
				<table style="margin-bottom: auto">
					<thead style="background-color: gainsboro; text-align: center;">
						<tr>
							<td><input class="form-check-input ms-2 me-1"
								type="checkbox" id="checkAll"></td>
							<td>신고자</td>
							<td>피신고자</td>
							<td>신고 사유</td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${reportList.size() == 0}">
								<tr>
									<td colspan="4">신고 내역이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${reportList }" var="dto">
									<tr>
										<td><input class="form-check-input ms-2 me-1 check"
											type="checkbox" name="seq_report"
											value="${dto.seq_report }"></td>
										<td>${dto.report_send }</td>
										<td>${dto.report_receive }</td>
										<td>${dto.report_reason }</td>
										<td class = "receive_email d-none">${dto.receive_email}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div class="row title mt-2">
				<div class="col mt-4">
					<h4 style="color: darkblue; text-shadow: 1px 1px 1px dodgerblue;">사용자
						관리</h4>
				</div>
			</div>
			<div class="row searchBox">
				<div class="d-flex align-items-center m-auto w-75">
					<select name="searchMem" class="form-select w-25 me-3">
						<option value="all" selected>ALL</option>
						<option value="user_email">Email</option>
						<option value="user_nickname">NICKNAME</option>
						<option value="user_phone">PHONE</option>
					</select> <input class="form-control me-2" name="searchKeyword"
						id="searchKeyword" type="search" placeholder="회원 검색"
						aria-label="Search">
					<button class="btn btn-outline-primary" type="button"
						id="searchBtn">Search</button>
				</div>
			</div>
			<div class="row resultBox mt-3">
				<span>총 <span id="memCnt" style="color: navy">${memCnt}</span>명
				</span>
				<table>
					<thead style="background-color: gainsboro; text-align: center;">
						<tr>
							<td>이메일</td>
							<td>닉네임</td>
							<td>휴대폰번호</td>
							<td>성별</td>
							<td>블랙리스트</td>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:choose>
							<c:when test="${list.size() == 0}">
								<tr>
									<td colspan=5>등록된 회원이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="dto">
									<tr>
										<td><a
											href="/admin/toDetailMem?user_email=${dto.user_email}"
											onclick="window.open(this.href, '_blank', 'width=600, height=1000'); return false;">
											${dto.user_email }</a></td>
										<td>${dto.user_nickname }</td>
										<td>${dto.user_phone }</td>
										<td>${dto.user_gender }</td>
										<c:if test="${dto.user_blacklist eq 'Y'}">
											<td><i class="fa-solid fa-user-large-slash"></i></td>
										</c:if>
										<c:if test="${dto.user_blacklist eq 'N'}">
											<td><i class="fa-solid fa-user-large"></i></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<!-- 검색전 pagination -->
			<div class="pagination mt-4 justify-content-center" id="page">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${naviMap.needPrev eq true}">
							<li class="page-item"><a class="page-link pageArrow"
								href="/admin/toMember?curPage=${naviMap.startNavi-1}"><</a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi }">
							<li class="page-item"><a class="page-link"
								href="/admin/toMember?curPage=${pageNum }">${pageNum }</a></li>
						</c:forEach>
						<c:if test="${naviMap.needNext eq true}">
							<li class="page-item"><a class="page-link pageArrow"
								href="/admin/toMember?curPage=${naviMap.endNavi+1}">></i></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script>
	//로그아웃 부분
    $(".user").mouseenter(function () {
        $(".logOut").css({ "display": "block", "z-index": "99" });
    })
    $(".user").mouseleave(function () {
        $(".logOut").css("display", "none");
    })
    $(".logOut").click(function () {
        Swal.fire({
            title: '정말 로그아웃 하시겠습니까?',
            showConfirmButton: false,
            showDenyButton: true,
            showCancelButton: true,
            denyButtonText: `로그아웃`,
        }).then((result) => {
        	if (result.isDenied) {
        		Swal.fire({
            	      icon:'success',
            	      title: '메인화면으로 이동합니다!',
            	      html: ' <b></b>' + '초뒤에 페이지가 이동됩니다.',
            	      timer: 1000,
            	      timerProgressBar: true,
            	      didOpen: () => {
            	        Swal.showLoading()
            	        const b = Swal.getHtmlContainer().querySelector('b')
            	        timerInterval = setInterval(() => {
            	          b.textContent = (Swal.getTimerLeft()/1000).toFixed(0)
            	        }, 100)
            	      },
            	      willClose: () => {
            	        clearInterval(timerInterval)
            	      }
            	    })
            	     setTimeout(function() {
            	    	 	location.href = "/login/toLogout";
                         },1200);
            	 
            }
        
        })
    })
	//부분 새로고침 -> 팝업 닫힌후
	window.call = function (data) {
	    if(data=="msg"){
	    	if($("#searchKeyword").val()==""){
	    		location.reload();
	    	}else{
				$("#searchBtn").trigger("click");
	    	}
	    }
	}; 
	
	//검색하는거
	$("#searchBtn").click(function(){
		makeSearchTable();
	})
	
	$("#searchKeyword").keyup(function(e){
		if(e.keyCode == 13)  makeSearchTable(); 
	})
	
	//검색하고 동적쿼리 만들어줌
	function makeSearchTable(){
		let searchType;
		let searchKeyword = $("#searchKeyword").val();
		
		if(searchKeyword!=""){ //뭐가 입력됐음
			searchType = $("select[name=searchMem] option:selected").val();
			$.ajax({
				url : "/admin/toSearch"
				, type : "post"
				, data : {searchType : searchType, searchKeyword : searchKeyword}
				, dataType : "json"
				, success: function(data){
					console.log(data);
					$("#page").css("display", "none");
					$(".resultBox").css({"overflow-y" : "scroll"});
					$("#memCnt").html(data.length);
					
					$("#tbody").empty();
					if(data.length === 0){ //아무것도 안넘어올때
						let tr = $("<tr>");
						let td = $("<td colspan=5>").html("검색된 게시글이 없습니다.");
						tr.append(td);
						$("#tbody").append(tr);
					}else{
						let icon;
						for(let dto of data){
							let tr = $("<tr>");
							let anchor = $("<a>").attr("href", "/admin/toDetailMem?user_email="+dto.user_email).html(dto.user_email);
							var js_func = "window.open(this.href, '_blank', 'width=600, height=1000'); return false;";
							var clickEvent = new Function(js_func);
							anchor.attr('onclick', '').click(clickEvent);
							let td1 = $("<td>").append(anchor);
							let td2 = $("<td>").html(dto.user_nickname);
							let td3 = $("<td>").html(dto.user_phone);
							let td4 = $("<td>").html(dto.user_gender);
							if(dto.user_blacklist == "Y"){
								icon = $("<i>").addClass("fa-solid fa-user-large-slash");
							}else if(dto.user_blacklist == "N"){
								icon = $("<i>").addClass("fa-solid fa-user-large");
							}
							let td5 = $("<td>").append(icon);
							tr.append(td1, td2, td3, td4, td5);
							$("#tbody").append(tr);
						}
					} 
					
				}, error : function(e){
					console.log(e);
				}
			})
			
		}
	}
	
	//신고 삭제버튼 누르면
	$("#deleteBtn").click(function(){
		let array = new Array();
		$("input:checkbox[name=seq_report]:checked").each(function(){
			array.push(this.value);
		})
		if(array.length==0){
			//아무것도 선택안하고 버튼 눌렀을때 아무것도 안되게하기
		}else{
			Swal.fire({
				title: '정말 삭제하시겠습니까?',
				text: "해당 유저를 블랙리스트에 등록하지않고 신고내역이 삭제됩니다.",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '그래도 삭제'
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url : "/admin/toReportDelete"
						,type : "post"
						,data : {seqArray : array}
						, success: function(data){
							console.log(data);
							if(data == "success"){
								Swal.fire(
										'Deleted!',
										'신고내역이 삭제되었습니다.',
									    'success'
									).then(function() {
										location.reload();
									});
							}else if(data == "fail"){
								Swal.fire({
									  icon: 'error',
									  title: 'Oops...',
									  text: '블랙리스트 등록에 실패했습니다.'
									})
							}
						}, error : function(e){
							console.log(e);
						}
					})
					
				}else{
					location.reload();
				}
			})
		}
	})
	
	//신고 영역 블랙리스트 등록
	$("#submitBtn").click(function(){
		let array = new Array();
		$("input:checkbox[name=seq_report]:checked").each(function(){
			array.push(this.value);
		})
		console.log(array);
		$.ajax({
				url : "/admin/toReport"
				,type : "post"
				,data : {seqArray : array}
				, success: function(data){
					console.log(data);
					if(data == "success"){
						Swal.fire({
							  position: 'top',
							  icon: 'success',
							  title: '블랙리스트에 등록했습니다!',
							  showConfirmButton: false,
							  timer: 1500
							}).then(function() {
								location.reload();
							});
					}else if(data == "fail"){
						Swal.fire({
							  icon: 'error',
							  title: 'Oops...',
							  text: '블랙리스트 등록에 실패했습니다.'
							})
					}
				}, error : function(e){
					console.log(e);
				}
			})
	})
	
	//체크박스 전체선택해제
	$("#checkAll").click(function(){
		if($("#checkAll").prop("checked")){
			$(".check").prop("checked", true);
		}else{
			$(".check").prop("checked", false);
		}
	})
	$(".check").click(function(){
		let total = $(".check").length;
		let checked = $(".check:checked").length;
		
		if(total != checked){
			$("#checkAll").prop("checked", false);
		}else{
			$("#checkAll").prop("checked", true);
		}
	})
	
    </script>
</body>

</html>