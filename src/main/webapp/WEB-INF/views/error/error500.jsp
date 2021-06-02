<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/error/error.css">
     
</head>
<body>
    <div id="header">

    </div>
    <div id="container">
        <div class="text-container">
            <p id="logo">
                Floworks
            </p>

            <p id="error-p">
                500
            </p>

            <p id="info-p">
                서버에 오류가 발생했습니다.
            </p>
			            
            <p id="info-p-small">
                이용에 불편을 드려 죄송합니다.
            </p>
 
 			<a href="">
				문의 메일 작성하기
			</a>
			           
            <button type="button" class="btn btn-light btn-lg" onclick="location.href=${pageContext.request.contextPath }/">
                메인페이지로 돌아가기
            </button>
 
        </div>
        
        <div>
            <img src="${pageContext.request.contextPath }/resources/images/error500.png" alt="">
        </div>       
    </div>
</body>

<style>
a{
	text-decoration: underline;
	color: white;
	display:block;
	margin-top: 30px;
	font-size: 18px;
}

</style>