<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<aside>
	<!-- 아이콘 -->
	<!-- https://icons.getbootstrap.kr/#%EC%95%84%EC%9D%B4%EC%BD%98 -->
	<ul class="nav flex-column navbar-nav">
		<li class="nav-item">
		<li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath }/home"> <i
				class="bi bi-house-door"></i>홈으로
		</a></li>
		<li class="nav-item"><a class="nav-link " href="#sidebarEmail"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="sidebarDashboards"> <i class="bi bi-envelope"></i>이메일<span
				class="badge badge-pill badge-danger">0</span>
		</a>
			<div class="collapse hide" id="sidebarEmail"
				style="padding-left: 35px;">
				<ul class="nav nav-sm flex-column">
					<li class="nav-item"><a href="${pageContext.request.contextPath }/email/compose" class="nav-link active"> 이메일 작성 </a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/email/inbox?id=<sec:authentication property="principal.id"/>" class="nav-link "> 받은 메일 </a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/email/sent?id=<sec:authentication property="principal.id"/>" class="nav-link "> 보낸 이메일 </a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/email/drafts?id=<sec:authentication property="principal.id"/>" class="nav-link "> 임시 보관함 </a></li>
				</ul>
			</div></li>
		<li class="nav-item">
			<a class="nav-link" href="#sidebarCal"
				data-toggle="collapse" role="button" aria-expanded="true"
				aria-controls="sidebarCal"> <i class="bi bi-calendar-check"></i>일정
			</a>
				<div class="collapse hide" id="sidebarCal" style="padding-left: 35px;">
					<ul class="nav nav-sm flex-column">
						<li class="nav-item"><a href="${pageContext.request.contextPath }/calendar/calendarMain" class="nav-link active">일정관리 </a></li>
						<li class="nav-item"><a href="#" class="nav-link "> 메뉴2 </a></li>
					</ul>
				</div>
		</li>
		<li class="nav-item"><a class="nav-link" href="#sidebarCommu"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="sidebarCommu"> <i class="bi bi-megaphone"></i>커뮤니티
		</a>
			<div class="collapse hide" id="sidebarCommu"
				style="padding-left: 35px;">
				<ul class="nav nav-sm flex-column">
					<li class="nav-item"><a href="${pageContext.request.contextPath }/board/boardList?boardNo=1&dept=부" class="nav-link active"> 공지게시판 </a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath }/board/boardList?boardNo=2&dept=부" class="nav-link "> 자유게시판 </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="#sidebarAtten"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="sidebarAtten"> <i class="bi bi-person-check"></i>근태관리
		</a>
			<div class="collapse hide" id="sidebarAtten"
				style="padding-left: 35px;">
				<ul class="nav nav-sm flex-column">
					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/attendance/view?workspaceId=<sec:authentication property="principal.workspaceId"/>&id=<sec:authentication property="principal.id"/>" class="nav-link active">내 근태 관리</a>
					</li>

					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/attendance/list?id=<sec:authentication property="principal.id"/>" class="nav-link "> 내 근태 조회 </a>
					</li>

					<li class="nav-item">
						<a href="${pageContext.request.contextPath}/leave/request" class="nav-link "> 휴가신청 </a>
					</li>
				</ul>
			</div>
		</li>			
			
		<li class="nav-item"><a class="nav-link" href="#sidebarChart"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="sidebarChart"> <i class="bi bi-diagram-3"></i>조직도
		</a>
			<div class="collapse hide" id="sidebarChart"
				style="padding-left: 35px;">
				<ul class="nav nav-sm flex-column">
					<li class="nav-item"><a href="#" class="nav-link active">
							조직도 </a></li>
					<li class="nav-item"><a href="#" class="nav-link "> 메뉴 </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="#sidebarAppr"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="sidebarAppr"> <i class="bi bi-vector-pen"></i>전자결재<span
				class="badge badge-pill badge-danger">2</span>
		</a>
			<div class="collapse hide" id="sidebarAppr"
				style="padding-left: 35px;">
				<ul class="nav nav-sm flex-column">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/approval/apvlProgress" class="nav-link">진행중인 결재</a></li>
					<li class="nav-item"><a href="#" class="nav-link "> 메뉴2 </a></li>
					<li class="nav-item"><a href="#" class="nav-link "> 메뉴3 </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="#sidebarCat"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="sidebarCat"> <i class="bi bi-chat-dots"></i>채팅<span
				class="badge badge-pill badge-danger">36</span>
		</a>
			<div class="collapse hide" id="sidebarCat"
				style="padding-left: 35px;">
				<ul class="nav nav-sm flex-column">
					<li class="nav-item"><a href="#" class="nav-link active">
							메뉴1 </a></li>
					<li class="nav-item"><a href="#" class="nav-link "> 메뉴2 </a></li>
					<li class="nav-item"><a href="#" class="nav-link "> 메뉴3 </a></li>
				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" href="#sidebarAdmin"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="sidebarAdmin"> <i class="bi bi-gear"></i>관리자 설정
		</a>
			<div class="collapse hide" id="sidebarAdmin"
				style="padding-left: 35px;">
				<ul class="nav nav-sm flex-column">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/memberList" class="nav-link "> 직원 목록 조회 </a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/attendList" class="nav-link "> 근태 목록 조회 </a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/admin/attend/setting" class="nav-link "> 근태 설정</a></li>
				</ul>
			</div></li>
		<hr>
	</ul>
</aside>
</div>
</body>
</html>