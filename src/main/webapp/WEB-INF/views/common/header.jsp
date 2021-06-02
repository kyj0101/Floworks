<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<!--tablib-->

    
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title}</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/main.css">
	
	<!-- jquery -->    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	
	<!-- icon -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    <!--특정 아이콘 추가 : https://fontawesome.com/icons?d=gallery&p=2 메일박스, 메시지-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
    
    <!-- sockJS사용을 위해서 js추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js" integrity="sha512-hsqWiVBsPC5Hz9/hy5uQX6W6rEtBjtI8vyOAR4LAFpZAbQjJ43uIdmKsA7baQjM318sf8BBqrMkcWsfSsaWCNg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    
</head>
<body>
	<div id="container">
		<header>
			<nav class="navbar navbar-default" style="padding: 0px;">
				<div class="container-fluid" style="padding: 0px;">
					<div class="mainHeader">
						<nav class="navbar" style="padding: 0px;">
							<!-- 로고 & 프젝명 -->
							<a class="navbar-brand" href="${pageContext.request.contextPath}/home"
								style="font-size: 2.7rem; color: #000;"> <img alt="logo"
								src="${pageContext.request.contextPath }/resources/images/logo_transparent22.png"
								style="width: 56px; height: 50px;"> <strong>Floworks</strong>
							</a>
						</nav>
						<!-- 검색바 -->
                        <!-- mr : margin right -->
                        <div class="mainHeader mr-5">
                            <nav class="navbar navbar-expand-mg">
                                <form class="form-inline">
                                    <div class="input-group form-inline">
                                        <div class="input-group-prepend">
                                          <button type="button" class="btn btn-outline-secondary" id="select-search" disabled="disabled">검색태그</button>
                                          <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" id="select-search-menu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                          </button>
                                          <div class="dropdown-menu">
                                            <button class="dropdown-item menu-btn" type="button" >게시판</button>
										    <button class="dropdown-item menu-btn" type="button" >게시판 파일</button>
										    <button class="dropdown-item menu-btn" type="button" >보낸 이메일</button>
										    <button class="dropdown-item menu-btn" type="button" >받은 이메일</button>
										    <button class="dropdown-item menu-btn" type="button" >보낸 이메일 파일</button>
										    <button class="dropdown-item menu-btn" type="button" >받은 이메일 파일</button>
                                          </div>
                                        </div>
                                        <input type="text" class="form-control" id="input-search" aria-label="" placeholder="검색어를 입력하세요.">
                                    </div>
                                    <button class="btn btn-outline-secondary search-btn header-search-btn" type="button">
                                    	검색
                                    </button>
                                </form>
                                <p style="margin: 5px auto; padding-left: 30px;"></p>
                            </nav>
                        </div>

						<!-- 로그아웃 & 마이페이지 -->
						<!-- 로그인 전/ 후 달라져야함  -->
						<div class="mainHeader dropdown mr-2">
							<form:form type="hidden" method="post" action="${pageContext.request.contextPath }/logout" id="logout-form"></form:form>
							
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								메뉴 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="${pageContext.request.contextPath}/member/mypage?id=<sec:authentication property="principal.id"/>">마이페이지</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="${pageContext.request.contextPath}/address/list?owner=<sec:authentication property="principal.id"/>">주소록</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1" href="#" id="logout-a">로그아웃</a></li>
							</ul>
						</div>

						<div class="mainHeader mr-3">
							<!-- Button trigger modal -->
							<button type="button" class="btn" data-toggle="modal"
								data-target="#exampleModal">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
									fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                                    <path
										d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                                </svg>
								<span id="alarm_badge" class="badge badge-danger"></span>
							</button>
						</div>

						<!-- Modal -->
                        <!--버튼을 클릭했을 때, 공지, 메일만을 분류할 수 있는 기능 script로 추가 구현하기-->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                        
                                        <h5 class="modal-title col-md-7" id="exampleModalLabel">Notification</h5>
                                        
                                        <div class="d-grid gap-2 d-md-block col-md-4">
                                            <div class="row">
                                                <i class="fas fa-clipboard-list col-md-3" style="color: #000;"></i>
                                               
                                                <button class="btn btn-outline-secondary col-md-3" type="button">
                                                    공지
                                                </button>
                                                
                                                <i class="fas fa-mail-bulk col-md-3" style="color: #000;"></i>
                                               
                                                <button class="btn btn-outline-secondary col-md-3" type="button">                                                
                                                    메일
                                                </button>
                                            </div>

                                        </div>
                                        <button type="button" class="close col-md-1" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                            <!--------------------Modal Body : ------------------------------------------------------------->
                                    <div class="modal-body">
                                        <div class="d-flex flex-column align-items-stretch bg-white">
                                              <div id="modal_body_for_alarm" class="list-group list-group-flush border-bottom scrollarea">
                                              
                                              <!-- script구문으로 추가 -->
                                                                                       
                                            </div>
                                          </div>

                                    </div>
                          <!-- --------------------------------------------------------------------------------------------------- -->          
                                    
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>

						<div class="mainHeader">
							<!-- 로그인한 사용자의 프로필 -->
							<%-- <img src="${pageContext.request.contextPath }/resources/upload/profile/<sec:authentication property="principal.profileFileRename"/>" alt="프로필사진" class="img-circle" --%>
								style="width: 45px; height: 45px; margin: 15px auto; border-radius: 50%;">
							<p style="margin: 30px 5px; width: 50px;"><sec:authentication property="principal.name"/></p>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</nav>

		</header>

		<script>
$(function(){
	$("#logout-a").click(function(){
		$("#logout-form").submit();
	});
	
	if("${msg}" != ""){
		alert("${msg}");
	}
	
	$(".menu-btn").click(function(){
		const type = $(this).text();
		const $inputSearch = $("#input-search");
		
		$("#select-search").text(type);
		
		if(type === "게시판"){
			$inputSearch.attr("placeholder", "글쓴이,부서명,제목,내용,날짜로 검색하세요.");
		}
		
		if(type === "보낸 이메일"){	
			$inputSearch.attr("placeholder", "수신자,제목,내용,날짜로 검색하세요.");
		}
		
		if(type === "받은 이메일"){
			$inputSearch.attr("placeholder", "발송인,수신자,제목,내용,날짜로 검색하세요.");		
		}
		
		if(type === "게시판 파일" || type === "보낸 이메일 파일" || type === "받은 이메일 파일"){
			$inputSearch.attr("placeholder", "파일 이름으로 검색하세요.");
		}
	});
	
	
	$(".header-search-btn").click(function(){

		const type = $("#select-search").text();
		const keyword = $("#input-search").val();
		const id = "<sec:authentication property='principal.id'/>"
		const workspaceId =  "<sec:authentication property='principal.workspaceId'/>"
		
		if(type === "게시판"){
			location.href="${pageContext.request.contextPath}/search/post?keyword=" + keyword + "&workspaceId=" + workspaceId;
		
		}else if(type === "보낸 이메일"){	
			location.href="${pageContext.request.contextPath}/search/email/sent?keyword=" + keyword + "&id=" + id;
		
		}else if(type === "받은 이메일"){
			location.href="${pageContext.request.contextPath}/search/email/inbox?keyword=" + keyword + "&id=" + id;	
		
		}else if(type === "게시판 파일"){
			location.href="${pageContext.request.contextPath}/search/file/post?keyword=" + keyword + "&workspaceId=" + workspaceId;
		
		}else if(type === "보낸 이메일 파일"){
			location.href="${pageContext.request.contextPath}/search/file/email/sent?keyword=" + keyword + "&id=" + id;	
		
		}else if(type === "받은 이메일 파일"){
			location.href="${pageContext.request.contextPath}/search/file/email/inbox?keyword=" + keyword + "&id=" + id;	
		
		}else{
			
			alert("검색태그를 설정하세요.");
			
			return false;
		}
	});
});
</script>

<script>

//WebsocketConfiguration 함수랑 연결

//알람 업로드
const ws = new SockJS("http://" + location.host + "${pageContext.request.contextPath}/alarm_for_member");
var payload;
var alarmList;
var alarm_count=0;
var email_count=0;

var id;
//헤더에 있기 때문에 페이지 이동시 마다 업로드 됨 -> 여기서 서버에 있는 알람 가져올 예정
ws.onopen = e => {
	console.log("onopen : ", e);
	var login_id = null;
	
	<sec:authorize access="isAuthenticated()">
		login_id = '<sec:authentication property="Principal.id"/>';
	</sec:authorize>
		
	console.log("접속 id :", login_id);	
	sessionStorage.setItem('id',login_id);
	ws.send(login_id);
	
}

ws.onmessage = e => {
	console.log("onmessage : ", e);
	const obj = JSON.parse(e.data);
	console.log(obj);
	alarmList=obj.alarmList;
	payload=obj.payload;
	alarm_count =obj.count;
	id=obj.id
	
	console.log("payload:",payload," count:",alarm_count," alarmList: ",alarmList," id:",id);
	
	const $badge =$("#alarm_badge");
	const $ebadge =$("#badge_for_email");
	
	var $modal_for_alarm = $("#modal_body_for_alarm");
	
	$badge.text(alarm_count);
	
	if(alarm_count ==0){
		$badge.css("visibility","hidden");
		$ebadge.css("visibility","hidden");
		$modal_for_alarm.html("");
	}
	else{
		$badge.css("visibility","visible");
		$ebadge.css("visibility","visible");
		
		for(var i=0; i < alarm_count;i++){
			
			if(alarmList[i].category=="e-mail"){
				email_count+=1;
			}
			
			var a_tag='<a class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true" onclick="AlarmErase('
			
			var tmp="";
			tmp = tmp+a_tag+"'"+alarmList[i].alarmLink+"'"+');">'
			tmp+='<div class="row">';
			tmp+='<div class="col-md-1">';
			tmp+='<i class="fas fa-user-circle" style="color: pink;"></i>';
			tmp+='</div>';
			tmp+='<div class="col-md-11">';
			tmp+='<div class="d-flex w-100 align-items-center justify-content-between">';
			tmp+='<strong class="mb-1">'+'From : '+alarmList[i].fromId+'</strong>';
			tmp+='<small>'+alarmList[i].alarmTime+'</small>';
			tmp+='</div>';
			tmp+='<div class="col-10 mb-1 small">'+alarmList[i].title+'</div>';
			tmp+='</div>';
			tmp+='</div>';
			tmp+='</a>';
			$modal_for_alarm.append(tmp);
		}
		
		$ebadge.text(email_count);
		
	}
	
}


ws.onerror = e => {
	
	console.log("onerror : ", e);
}

ws.onclose = e => {
	console.log("onclose : ", e);
}

function AlarmErase(link){
	
	
	const ws_change = new SockJS("http://" + location.host + "${pageContext.request.contextPath}/alarm_for_changeView");
	
	ws_change.onopen = e => {
		var login_id = null;
		
		<sec:authorize access="isAuthenticated()">
			login_id = '<sec:authentication property="Principal.id"/>';
		</sec:authorize>
		
		sessionStorage.setItem('id',login_id);
		
		console.log("접속 id :", login_id);	
		ws_change.send(login_id+"$"+link);
		
	}
	
	location.href="${pageContext.request.contextPath}/"+link;
		
};


</script>