<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/register.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/createWorkspace.css">
    
</head>
<body>
    <header>
        <div class="header-div">
            <img src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80" alt="">
            <span>Floworks</span>
        </div>
    </header>
    <section>
      <div class="register-div">
        <div class="card-body">
          <h4 class="card-title text-center">워크스페이스 입장</h4>
          <form class="form-signin">
            
            <div class="box" style="background: #BDBDBD;">
                <img class="profile" src="/Images/workspace/pexels-flo-dahm-699459.jpg">
            </div>
            

            <div class="form-label-group">
                <input type="text" id="inputConfirmPassword" class="form-control" placeholder="Password" readonly>
                <label for="inputConfirmPassword">abc123</label>
              </div>
            
            <div class="form-label-group">
              <input type="password" id="inputConfirmPassword" class="form-control" placeholder="Password">
              <label for="inputConfirmPassword">워크스페이스 비밀번호</label>
              <p class="input-warning">잘못된 비밀번호 입니다.</p>
            </div>
            
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <label class="input-group-text" for="inputGroupSelect01">직급</label>
                </div>
                <select class="custom-select" id="inputGroupSelect01">
                  <option selected>Choose...</option>
                  <option value="1">One</option>
                  <option value="2">Two</option>
                  <option value="3">Three</option>
                </select>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <label class="input-group-text" for="inputGroupSelect01">부서</label>
                </div>
                <select class="custom-select" id="inputGroupSelect01">
                  <option selected>Choose...</option>
                  <option value="1">One</option>
                  <option value="2">Two</option>
                  <option value="3">Three</option>
                </select>
            </div>

            <hr>

            <button class="btn btn-lg btn-primary btn-block text-uppercase" id="create-btn" type="submit">
                확인
            </button>

          </form>
        </div>
      </div>
    </section>
</body>
</html>