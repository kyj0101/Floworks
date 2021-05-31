<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/mainHeader.jsp"></jsp:include>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.js" integrity="sha512-Kdp1G1My+u1wTb7ctOrJxdEhEPnrVxBjAg8PXSvzBpmVMfiT+x/8MNua6TH771Ueyr/iAOIMclPHvJYHDpAlfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js" integrity="sha512-tL4PIUsPy+Rks1go4kQG8M8/ItpRMvKnbBjQm4d2DQnFwgcBYRRN00QdyQnWSCwNMsoY/MfJY8nHp2CzlNdtZA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>

<section>
	<div class="register-div">
		<div class="card-body">
			<h4 class="card-title text-center">회원가입</h4>
			<form class="form-signin" action="${pageContext.request.contextPath }/register/insert" method="post">
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				
				<div class="form-label-group">
					<input type="text" name="id" id="inputUserame" class="form-control" placeholder="Username">
					<label for="inputUserame">아이디</label>
					<p class="input-warning">중복된 아이디 입니다.</p>
				</div>
				
				<div class="form-label-group">
					<input type="text" name="name" id="inputname" class="form-control" placeholder="Username">
					<label for="inputname">이름</label>
					<p class="input-warning">올바른 이름이 아닙니다.</p>
				</div>

				<div class="form-label-group">
					<input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address"> 
					<label for="inputEmail">이메일</label>
					<p class="input-warning">이메일 형식이 올바르지 않습니다.</p>
					<p class="email-p">이메일 인증이 완료되었습니다.</p>
				</div>
				
				<button type="button" class="btn btn-lg btn-primary btn-block text-uppercase" id="email-btn">
					인증 메일 발송
				</button>
				
				<hr>

				<div class="form-label-group">
					<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password">
					<label for="inputPassword">비밀 번호</label>
					<p class="input-warning">잘못된 비밀번호 입니다.</p>
				</div>

				<div class="form-label-group">
					<input type="password" id="inputConfirmPassword" class="form-control" placeholder="Password">
					<label for="inputConfirmPassword">비밀 번호 확인</label>
					<p class="input-warning">비밀번호가 일치하지 않습니다.</p>
				</div>

				<hr>

				<div class="form-label-group">
					<input type="tel" name="phone" id="inputuserame" class="form-control" placeholder="Username"> 
					<label for="inputuserame">전화 번호 ('-'를 빼고 입력해주세요.)</label>
					<p class="input-warning">잘못된 전화번호 입니다.</p>
				</div>

				<hr />

				<div class="form-label-group">
					<input type="text" name="address" id="inputAddress" class="form-control" placeholder="address">
					<label for="inputAddress">주소</label>
					<p class="input-warning">잘못된 주소 입니다.</p>
				</div>

				<hr>
				
				<div class="form-label-group">
					<input type="text" name="workspaceId" id="inputWorkspace" class="form-control workspace" placeholder="workspace">
					<label for="inputWorkspace">워크스페이스 ID</label>
					<p class="input-warning">잘못된 주소 입니다.</p>
				</div>
				
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="true" name="createWorkspace" id="flexCheckIndeterminate"> 
					<label class="form-check-label" for="flexCheckIndeterminate">워크스페이스 생성하기 </label>
				</div>
				<hr>
 
				<button type="button" class="btn btn-lg btn-primary btn-block text-uppercase" id="submit-btn">
					가입하기
				</button>
				<hr />
			</form>
		</div>
		
	</div>
	
</section>
</body>
</html>

<script>

			
$("#email-btn").click(function(){
	
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";

	const $input = $("input[name=email]");
	const email = $input.val();
	const warningP = $input.next().next();

	if($(warningP).css("display") == "block"){
		
		alert("이메일 형식이 올바르지 않으므로, 인증 이메일을 전송할 수 없습니다.");
		
		return false;
		
	}else if(!checkSendEmail()){
		return false;
	
	}else{
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/register/email/auth/send",
			data:{"email":email},
			
			beforeSend(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			
			success(){
				alert("이메일 전송이 완료되었습니다.");
				connection(email);
			},
			
			error(xhr, status, err){
				
				if(xhr.status == 500){
					confirm("이미 인증 이메일 발송되었습니다. 인증 이메일을 초기화 하시겠습니까?") && resetEmail();
				}
			}
		});
	}
});

$("input[name=id]").change(function(){
	
	const $input = $("input[name=id]");
	const id = $input.val();
	const warningP = $input.next().next();

	hideWarning(warningP);
	
	if(!idRegExp(id,true)){
		showWarning(warningP, "아이디는 최소 3자리에서 최대 15자리인 영문자와 숫자의 조합이여야 합니다.");
	}
	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/register/id/duplicate",
		data:{"id":id},

		success(result){
			result === "true" && showWarning(warningP, "중복된 아이디 입니다.");
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
	});//end of ajax
});

$("input[name=email]").change(function(){
	
	const $input = $("input[name=email]");
	const email = $input.val();
	const warningP = $input.next().next();
	
	$(".email-p").css("display","none");		
	hideWarning(warningP);
	
	if(!exEmailRegExp(email, true)){
		showWarning(warningP, "이메일 형식이 올바르지 않습니다.");
	}
	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/register/email/duplicate",
		data:{"email":email},

		success(result){
			result === "true" && showWarning(warningP, "중복된 이메일 입니다.");
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
	});//end of ajax
});

$("input[name=phone]").change(function(){
	
	const $input = $("input[name=phone]");
	const phone = $input.val();
	const warningP = $input.next().next();

	hideWarning(warningP);
	
	if(!phoneRegExp(phone,true)){
		showWarning(warningP, "올바른 휴대번호가 아닙니다. '-'를 빼고 입력해주세요.");
	}
	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/register/phone/duplicate",
		data:{"phone":phone},

		success(result){
			result === "true" && showWarning(warningP, "중복된 휴대번호 입니다.");
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
	});//end of ajax
});

$("#submit-btn").click(function(){
	
	if(!inputNullCheck() || !warningCheck() || !emailAuthCheck()){
		return false;
	
	}else{
		$(".form-signin").submit();
	}
});

$("input[name=workspaceId]").change(function(){
	
	const $input = $("input[name=workspaceId]");
	const workSpaceId = $input.val();
	const warningP = $input.next().next();
	console.log(warningP);
	hideWarning(warningP);

	if (!idRegExp(workSpaceId, true)) {
		showWarning(warningP, "잘못된 워크스페이스 아이디 입니다.");
	}
	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/register/workspace/exist",
		data:{"workSpaceId":workSpaceId},

		success(result){
			result === "false" && showWarning(warningP, "존재하지 않는 워크스페이스 ID 입니다.");
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err);
		}
	});//end of ajax
})


function resetEmail(){
	
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";

	const $input = $("input[name=email]");
	const email = $input.val();
	const warningP = $input.next().next();
	
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/register/email/auth/reset",
		data:{"email":email},
		
		beforeSend(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		
		success(){
			alert("인증 이메일이 재전송 되었습니다.");
			connection(email);
		},
		
		error(xhr, status, err){
			console.log(xhr, status, err)
		}
	});
}

function connection(email){
	
	$(".email-p").css("display","none");
	
	const index = email.indexOf("@");
	const emailId = email.substring(0, index);
	const url = "/notice/" + emailId;
	
	const ws = new SockJS("${pageContext.request.contextPath}/stomp");
	const stompClient = Stomp.over(ws);
	
	stompClient.connect({}, (frame) => {
		console.log("stomp connected : ", frame);
		
		stompClient.subscribe(url, (message) => {
			
			 if(message.body == "인증완료"){
				 $(".email-p").css("display","block");		 
			 }
		});
	});
}

</script>