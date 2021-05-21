<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<aside>
			<!-- 아이콘 -->
			<!-- https://icons.getbootstrap.kr/#%EC%95%84%EC%9D%B4%EC%BD%98 -->
			<ul class="nav flex-column navbar-nav">
				<li>
					<div class="box" style="background: #BDBDBD;">
						<img class="profile" src="${pageContext.request.contextPath }/resources/images/workspaceSample.jpg">
					</div>
					<p>김수박</p>
				</li>
				<hr>

				<li class="nav-item">
					<hr class="line-hr"> <a class="nav-link " href="${pageContext.request.contextPath}/member/mypage"> 개인 정보 수정 </a>
					<hr class="line-hr">
				</li>

				<li class="nav-item">
					<hr class="line-hr" style="border-bottom-width: 0px;"> 
					<a href="${pageContext.request.contextPath}/member/updatePwd" class="nav-link"> 비밀 번호 수정 </a>
					<hr class="line-hr" style="border-bottom-width: 0px;">
				</li>

				<li class="nav-item">
					<hr class="line-hr"> <a href="${pageContext.request.contextPath}/member/delete" class="nav-link " > 회원 탈퇴
				</a>
					<hr class="line-hr">
				</li>
			</ul>
		</aside>
		<footer> </footer>
	</div>
</body>
</html>