<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>홈페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

	<!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/styles.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/mainPage.css">

	<!-- font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>

<body>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container px-5">
			<h3>Floworks</h3>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">
							Home
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/login">
							Login
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark ">
		<img
			src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80"
			alt="">
	</header>
	<!-- Features section-->

	<sec:authorize access="isAnonymous()">

		<section class="py-5 border-bottom" id="features">
			<div class="container px-5 my-5">
				<div class="row gx-5">
					<div class="col-lg-4 mb-5 mb-lg-0">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-person"></i>
						</div>
						<h2 class="h4 fw-bolder">회원 가입</h2>
						<a class="text-decoration-none" href="${pageContext.request.contextPath}/register"> 회원가입 <i
							class="bi bi-arrow-right"></i>
						</a>
					</div>
					<div class="col-lg-4 mb-5 mb-lg-0">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-building"></i>
						</div>
						<h2 class="h4 fw-bolder">워크스페이스 등록</h2>

						<a class="text-decoration-none" href="${pageContext.request.contextPath}/register/login?url=member"> 등록하기 <i
							class="bi bi-arrow-right"></i>
						</a>
					</div>
					<div class="col-lg-4 ">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-pen"></i>
						</div>
						<h2 class="h4 fw-bolder">워크스페이스 생성</h2>
						<a class="text-decoration-none" href="${pageContext.request.contextPath}/register/login?url=create"> 생성 하기 <i
							class="bi bi-arrow-right"></i>
						</a>
					</div>
				</div>
			</div>
		</section>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<div class="container px-5 my-5">
			<div class="row gx-5">
				<div class="col-lg-4 mb-5 mb-lg-0">
					<div
						class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
						<i class="bi bi-house-door"></i>
					</div>
					<h2 class="h4 fw-bolder">홈</h2>
					<a class="text-decoration-none"
						href="${pageContext.request.contextPath}/home"> 홈으로 돌아가기 <i
						class="bi bi-arrow-right"></i>
					</a>
				</div>
			</div>
		</div>
		<button type="button" id="menu" class="btn btn-warning"
			onClick="goHome();" style="width: 200px;">워크스페이스로 이동</button>
	</sec:authorize>

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container px-5">
			<p class="m-0 text-center text-white">Copyright &copy; Flowoeks
				2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>

<script>
if("${msg}" != ""){
	alert("${msg}");
}
</script>
			