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
    <title>로그인</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
    
    <!-- font --> 
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
</head>
<body>
    <header>
        <div class="header-div">
            <img src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80" alt="">
            <span>Floworks</span>
        </div>
    </header>

    <div class="container-fluid">
        <div class="row no-gutter">        
          <div class="col-md-8 col-lg-6">          
            <div class="login d-flex align-items-center py-5">            
              <div class="container">              
                <div class="row">                
                  <div class="col-md-9 col-lg-8 mx-auto">
                  
                    <h3 class="login-heading mb-4">안녕하세요!</h3>
                    
                    <form:form method="POST" action="${pageContext.request.contextPath }/login">            
                    	
                    	<div class="form-label-group">
                      
                        	<input type="text" id="inputEmail" name="username" class="form-control" value="member" required autofocus>                        
                        	<label for="inputEmail">ID</label>
                        
                      	</div>
      
                      	<div class="form-label-group">
                      
                        	<input type="password" id="inputPassword" name="password" class="form-control" value="member" placeholder="Password" required>                      
                        	<label for="inputPassword">Password</label>
                        
                      	</div>
      
                      	<div class="custom-control custom-checkbox mb-3">
                      
                        	<input type="checkbox" class="custom-control-input" id="customCheck1">                       
                        	<label class="custom-control-label" for="customCheck1">로그인 상태 유지</label>
                        
                      	</div>
                      
                      	<button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">
                      		Sign in
                      	</button>
                      
                      	<div class="text-center">
                    
                        	<a class="small" href="#">비밀번호를 잊으셨나요?</a>
                      
                      	</div>
                      
                    </form:form>
                    
                  </div>                  
                </div>                
              </div>              
            </div>            
          </div>          
        </div>        
      </div>
</body>
</html>