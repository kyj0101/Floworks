<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.floworks.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="개인정보 수정" name="title"/>
</jsp:include>

<!-- webSocket -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.js" integrity="sha512-Kdp1G1My+u1wTb7ctOrJxdEhEPnrVxBjAg8PXSvzBpmVMfiT+x/8MNua6TH771Ueyr/iAOIMclPHvJYHDpAlfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js" integrity="sha512-tL4PIUsPy+Rks1go4kQG8M8/ItpRMvKnbBjQm4d2DQnFwgcBYRRN00QdyQnWSCwNMsoY/MfJY8nHp2CzlNdtZA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/memberUpdate.css">

<!-- js -->   
<script src="${pageContext.request.contextPath }/resources/js/member/profileThumbnail.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/regExp.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/member/register.js"></script>

<!-- icon -->
<script src="https://kit.fontawesome.com/d37b4c8496.js" crossorigin="anonymous"></script>

<section>
	<div class="section-div">
		<div class="update-div">
      <form:form  class="member-update-frm" action="${pageContext.request.contextPath}/member/update" method="post"  enctype="multipart/form-data">
				<h3 class="">개인 정보 수정하기</h1>

				 
				<!-- 모든 필드값을 가져오지 않으면 null값이 되므로 모든 값을 가져옴. -->
				 
				<!-- member  -->
				<input type="hidden" name="profileFileOrinalname" value='<sec:authentication property="principal.profileFileOrinalname"/>'/>
				<input type="hidden" name="profileFileRename" value='<sec:authentication property="principal.profileFileRename"/>'/>
 				<input type="hidden" name="departmentCode" value='<sec:authentication property="principal.departmentCode"/>'/>
 				<input type="hidden" name="position" value='<sec:authentication property="principal.position"/>'/>
 				<input type="hidden" name="hireDate" value='<sec:authentication property="principal.hireDate"/>'/>
 				<input type="hidden" name="resign" value='<sec:authentication property="principal.resign"/>'/>
 				
 				<!-- user -->
 				<input type="hidden" name="workspaceId" value='<sec:authentication property="principal.workspaceId"/>'/>
 				
 				<div class="input-group mb-3 form-group file-div">
					<div class="input-group-prepend">
						<span class="input-group-text">Upload</span>
					</div>
					<div class="custom-file">
						<input type="file" name="profile" class="custom-file-input" id="file01">
						<label class="custom-file-label" for="file01"><sec:authentication property="principal.profileFileOrinalname"/></label>
					</div>
				</div>
				
 				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" name="id" id="id" placeholder="이름" value='<sec:authentication property="principal.id"/>'readonly required/>
						</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control register-form-control" name="name" id="inputname" placeholder="이름" value="<sec:authentication property="principal.name"/>" required/>
							<label for="inputname">이름</label>
							<p class="input-warning">올바른 이름이 아닙니다.</p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="email" class="form-control register-form-control" name="email" id="email" value="${member.email}" required/>
							<label for="inputEmail">이메일</label>
							<p class="input-warning">이메일 형식이 올바르지 않습니다.</p>
							<p class="email-p">이메일 인증이 완료되었습니다.</p>
							
						</div>
					</div>

					<div class="col-md-12">
						<div class="form-group">
							<input type="tel" class="form-control register-form-control" name="phone" id="phone" placeholder="전화번호" maxlength="12" value="${member.phone}" required/>
							<label for="inputuserame">전화 번호 ('-'를 빼고 입력해주세요.)</label>
							<p class="input-warning">잘못된 전화번호 입니다.</p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control register-form-control" name="address" id="inputAddress" placeholder="주소" value="<sec:authentication property="principal.address"/>" required/>
							<label for="inputAddress">주소</label>
							<p class="input-warning">잘못된 주소 입니다.</p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="submit" value="수정" id="submit-btn" class="btn btn-primary">
							<input type="button" value="이메일 인증 메일 발송" id="email-btn" class="btn btn-primary disabled">
						</div>
					</div>
				</div>
			</div>
			</form:form>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/myPageFooter.jsp"></jsp:include>

<script>
const profileRename = "<sec:authentication property='principal.profileFileOrinalname'/>";

if(profileRename == "null"){
	$(".custom-file-label").text("기본사진");
}
$("#email-btn").click(function(){
	
	const csrfHeaderName = "${_csrf.headerName}";
	const csrfTokenValue = "${_csrf.token}";

	const $input = $("input[name=email]");
	const email = $input.val();
	const originalEmail = "${member.email}";
	const warningP = $input.next().next();

	if($(warningP).css("display") == "block"){
		
		alert("이메일 형식이 올바르지 않으므로, 인증 이메일을 전송할 수 없습니다.");
		
		return false;
		
	}else if(!checkSendEmail()){
		return false;
	
	}else if(email.trim() === originalEmail){
		
		alert("이메일이 변경되지 않았습니다.");
		
		return false;
		
	}else{
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/register/email/auth/send",
			data:{"updateEmail":email, "originalEmail":originalEmail},
			
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
	const originalEmail = "${member.email}";
	
	$("#email-btn").removeClass("disabled");
	$(".email-p").css("display","none");		
	hideWarning(warningP);
	
	if(!exEmailRegExp(email, true)){
		showWarning(warningP, "이메일 형식이 올바르지 않습니다.");
		
	}else if(email.trim() === originalEmail){
		return false;
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
	console.log(phone);
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
	
	const originalEmail = "${member.email}";
	const updateEmail = $("input[name=email]").val().trim();

	if(!warningCheck() || !inputNullCheck()){
		return false;
	
	}else if(originalEmail != updateEmail && !emailAuthCheck()){
		return false;
	
	}else{
		$(".member-update-frm").submit();
	}
});

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
