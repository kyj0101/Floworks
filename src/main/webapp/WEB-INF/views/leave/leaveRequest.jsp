<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="휴가신청" name="title"/>
</jsp:include>

<!-- datepicker-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js" integrity="sha512-2XuQYSojalNmRQyWxr1Dr+KWZ7Gn6JgWMZvPxIYwGFRVA1r8RPWHRWybIu8zp/G2EtTTAXh56aMpk99pkrrpNA==" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/leave/leaveRequest.css" />

<section>
	<form:form>
		<p>잔여 연차 : 13일</p>
		<hr>
		<div class="form-group leave-div">
			<label for="exampleFormControlInput1">신청자</label>
			<input type="text"class="form-control" id="exampleFormControlInput1" value="신청자" readonly>
		</div>

		<select class="custom-select">
			<option selected>휴가 종류 선택</option>
			<option value="1">연차</option>
			<option value="2">훈련</option>
			<option value="3">교육</option>
			<option value="3">경조사</option>
			<option value="3">병가</option>
			<option value="3">출산</option>
			<option value="3">무급</option>
		</select>

		<div class="form-check form-check-inline leave-div">
			<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
			<label class="form-check-label" for="inlineRadio1">오전반차</label>
		</div>

		<div class="form-check form-check-inline leave-div">
			<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
			<label class="form-check-label" for="inlineRadio2">오후반차</label>
		</div>

		<div class="form-check form-check-inline leave-div">
			<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
			<label class="form-check-label" for="inlineRadio2">일차</label>
		</div>
		
		<div class="datepicker-div leave-div">
			<div class="datepicker" id="datepicker" data-date="02/27/2021"></div>
		</div>

		<div class="form-group text-div leave-div">
			<label for="exampleFormControlTextarea1">사유</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		
		<label for="exampleFormControlTextarea1">파일첨부</label>
		
		<div class="input-group mb-3 leave-div">
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
				<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
			</div>
		</div>

		<div class="leave-request-btn-div">
			<button type="button" class="leave-request-btn btn btn-secondary btn-lg" onclick="history.back();">취소</button>
			<button type="button" class="leave-request-btn btn btn-primary btn-lg" id="send-btn">보내기</button>
		</div>
	</form:form>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script>

$('#datepicker').datepicker({
    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
    startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
    endDate: '+50d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
    autoclose : false,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
    multidate : true, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
    todayHighlight : false ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
    language : "kr",	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
    inline: true,
    sideBySide: true,
    changeYear: false,
    minViewMode: 0,
    maxViewMode:0,
})

</script>
