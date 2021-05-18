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
    <title>main</title>
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/mainPage.css">
	
	<!-- font --> 
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<script>
	function goLogin(){
		location.href="${pageContext.request.contextPath}/login.do";
	}
	function goRegister(){
		location.href="${pageContext.request.contextPath}/register";
	}
	function goWorksapace(){
		location.href="${pageContext.request.contextPath}/createWorkspace";
	}
	function goHome(){
		location.href="${pageContext.request.contextPath}/home";
	}
	
	
	</script>
</head>

<body>	
	<div class="contain">
		<div class="logotext">
			<span>Floworks</span>
		</div>
	    <div class="set">
	    
	    	<sec:authorize access="isAuthenticated()">
	    		
	    		<button type="button" id="menu" class="btn btn-warning" onClick="goHome();" style="width: 200px;">워크스페이스로 이동</button>
					
			</sec:authorize>
			
			<sec:authorize access="isAnonymous()">
			
				<div class="menu">
			        
			        <!-- Indicates caution should be taken with this action -->
					<button type="button" id="menu" class="btn btn-warning" onclick="goLogin();">로그인</button>
					<button type="button" id="menu" class="btn btn-warning" onclick="goRegister();">회원가입</button>
					<button type="button" id="menu" class="btn btn-warning" onclick="goWorksapace();" style="width: 160px;">워크스페이스 추가</button>
		    	
		    	</div>
			
			</sec:authorize>
		    
	    </div>
	</div>
</body>
</html>