<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자-모임관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js" crossorigin="anonymous"></script>
<!--알림창-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<style>
body,html{
	height : 1100px;
}
.container {
   max-width: -webkit-fill-available;
   height: 100%;
   padding: 0px;
}
.table > tbody > tr > td {
     vertical-align: middle;
}
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

/*모임관리 색 다르게*/
.groupMenu {
	background-color: #a0e4f9ac;
}

.groupMenu>a {
	color: white;
}

/*content안에*/
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
				<li class="logoHome sidemenu"><a href="/admin/toAdmin"> <img
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
				<li class="sidemenu groupMenu"><a href="/admin/toGroupAdmin?curPage=1"> <i
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
			<div class="row title mt-2">
				<div class="col mt-4">
					<h4 style="color: darkblue; text-shadow: 1px 1px 1px dodgerblue; margin-left : 75px;">
						모임 관리</h4>
				</div>
			</div>
                <div class="row searchBox">
                    <div class="d-flex align-items-center m-auto w-75">
                    <select name="searchGroup" class="form-select w-25 me-3">
						<option value="all" selected>전체</option>
						<option value="group_title">모임명</option>
						<option value="group_category">카테고리</option>
					</select>
                        <input class="form-control me-2" name="searchKeyword"
                            id="searchKeyword" type="search" placeholder="모임 검색"
                            aria-label="Search">
                        <button class="btn btn-outline-primary" type="button"
                            id="searchBtn">Search</button>
                    </div>
                </div>
			<div class="row resultBox mt-3">
				<span style = "font-size:20px;">총 모임<span id="groupCnt" style="color: navy">${groupCnt}</span>개
				</span>
				<table class="table table-bordered">
					<thead style="text-align: center; background-color : gainsboro;">
						<tr>
							<td>모임장</td>
							<td>모임명</td>
							<td>카테고리</td>
							<td>모임 인원</td>
							<td>지역</td>
							<td>모임 삭제</td>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:choose>
							<c:when test="${groupList.size() == 0}">
								<tr>
									<td colspan=5>개설된 모임이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${groupList}" var="groupList">
									<tr>		
										<td>${groupList.user_email}</td>
										<td><a href = "/group/toGroupDetail?seq_group=${groupList.seq_group}">${groupList.group_title}</a></td>
										<td>${groupList.group_category}</td>
										<td>${groupList.group_people}</td>
										<td>${groupList.group_site}</td>
										<td><a href ="/admin/toDeleteGroup?seq_group=${groupList.seq_group}"><i class="fa-solid fa-trash"></i></a></td>
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
							<li class="page-item"><a class="page-link"
								href="/admin/toGroupAdmin?curPage=${naviMap.startNavi-1}"><i
									class="fa-solid fa-angle-left"></i></a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi }">
							<li class="page-item"><a class="page-link"
								href="/admin/toGroupAdmin?curPage=${pageNum }">${pageNum }</a></li>
						</c:forEach>
						<c:if test="${GroupNaviMap.needNext eq true}">
							<li class="page-item"><a class="page-link"
								href="/admin/toGroupAdmin?curPage=${naviMap.endNavi+1}"><i
									class="fa-solid fa-angle-right"></i></a></li>
						</c:if>
					</ul>
				</nav>
			</div> 
		</div>
	</div>
</body>
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
	console.log($("#searchKeyword").val());
})

//검색하고 동적쿼리 만들어줌
function makeSearchTable(){
	let searchType;
	let searchKeyword = $("#searchKeyword").val();
	
	if(searchKeyword!=""){ //뭐가 입력됐음
		searchType = $("select[name=searchGroup] option:selected").val();
		$.ajax({
			url : "/admin/toGroupSearch"
			, type : "post"
			, data : {searchType : searchType, searchKeyword : searchKeyword}
			, dataType : "json"
			, success: function(data){
				console.log(data);
				$("#page").css("display", "none");
				$(".resultBox").css({"overflow-y" : "scroll"});
				$("#groupCnt").html(data.length);
				
				$("#tbody").empty();
				if(data.length === 0){ //아무것도 안넘어올때
					let tr = $("<tr>");
					let td = $("<td colspan=6>").html("검색된 모임이 없습니다.");
					tr.append(td);
					$("#tbody").append(tr);
				}else{
					
					for(let groupList of data){
						let tr = $("<tr>");
						let td1 = $("<td>").html(groupList.user_email);
						let td2 = $("<td>").html(groupList.group_title);
						let td3 = $("<td>").html(groupList.group_category);
						let td4 = $("<td>").html(groupList.group_people);
						let td5 = $("<td>").html(groupList.group_site);
						let icon = $("<i>").addClass("fa-solid fa-trash");
						let anchor = $("<a>").attr("href", "/admin/toDeleteGroup?seq_group="+groupList.seq_group).append(icon);
						let td6 = $("<td>").append(anchor);
						
						tr.append(td1, td2, td3, td4, td5, td6);
						$("#tbody").append(tr);
					}
				} 
				
			}, error : function(e){
				console.log(e);
			}
		})
		
	}
}

</script>
</html>
