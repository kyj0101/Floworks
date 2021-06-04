<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="직원 정보 수정하기" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/userDetail.css">
	
<section>
<sec:authentication property="principal" var="loginId"/>
	<form:form 
		name="userUpdate"
		action="${pageContext.request.contextPath}/admin/userUpdate"
		method="post"
		enctype="multipart/form-data">	   
    <div class="card">	        
        <div class="card-body">
               <table class="table">
                   <tbody>
                   <tr id="topLine">
                       <td class="nametag">ID</td>
                       <td>
                           <input type="text" name="id" class="form-control" value="${userDetail.id}" readonly>
                   		   <input type="hidden" name="workspaceId" value="${userDetail.workspaceId}"/>
                       </td>
                       <td />
                       <td class="nametag">직원명</td>
                       <td>
                           <input type="text" name="name" class="form-control" value="${userDetail.name}">
                       </td>                        
                   </tr>
                   <tr>
                       <td class="nametag">부서</td>
                       <td>   
                           <select class="form-control" name="departmentName">
                           	<option value="D1" ${userDetail.departmentName eq '기획부' ? 'selected' : ''}>기획부</option>
                           	<option value="D2" ${userDetail.departmentName eq '개발부' ? 'selected' : ''}>개발부</option>
                           	<option value="D3" ${userDetail.departmentName eq '총무부' ? 'selected' : ''}>총무부</option>
                           	<option value="D4" ${userDetail.departmentName eq '국내영업부' ? 'selected' : ''}>국내영업부</option>
                           	<option value="D5" ${userDetail.departmentName eq '마케팅부' ? 'selected' : ''}>마케팅부</option>
                           	<option value="D6" ${userDetail.departmentName eq '회계관리부' ? 'selected' : ''}>회계관리부</option>
                           </select>                           
                       </td>
                       <td />
                       <td class="nametag">직급</td>
                       <td>
                           <select class="form-control" name="position">
                           	<option value="인턴" ${userDetail.position eq '인턴' ? 'selected' : ''}>인턴</option>
                           	<option value="사원" ${userDetail.position eq '사원' ? 'selected' : ''}>사원</option>
                           	<option value="주임" ${userDetail.position eq '주임' ? 'selected' : ''}>주임</option>
                           	<option value="대리" ${userDetail.position eq '대리' ? 'selected' : ''}>대리</option>
                           	<option value="팀장" ${userDetail.position eq '팀장' ? 'selected' : ''}>팀장</option>
                           	<option value="차장" ${userDetail.position eq '차장' ? 'selected' : ''}>차장</option>
                           	<option value="부장" ${userDetail.position eq '부장' ? 'selected' : ''}>부장</option>
                           	<option value="이사" ${userDetail.position eq '이사' ? 'selected' : ''}>이사</option>
                           	<option value="사장" ${userDetail.position eq '사장' ? 'selected' : ''}>사장</option>
                           	<option value="대표" ${userDetail.position eq '대표' ? 'selected' : ''}>대표</option>
                           </select>                                     
                       </td>
                   </tr>
                   <tr>                   	                        
                       <td class="nametag">권한</td>
                       <td>
                       	<select class="form-control" name="role">
		 					<option value="USER" ${userDetail.role eq 'USER' ? 'selected' : ''}>USER</option>
                       	 	<option value="ADMIN" ${userDetail.role eq 'ADMIN               ' ? 'selected' : ''}>ADMIN</option>
                        	</select>
                       </td> 
                       <td />
                       <td class="nametag">잔여연차</td>
                       <td>
                           <input type="text" name="leaveDay" class="form-control" value="${userDetail.leave}">
                       </td>
                   </tr>  
                   <tr>
                       <td class="nametag">연락처</td>
                       <td>
                           <input type="tel" name="phone" class="form-control" value="${userDetail.phone}" >
                       </td>
                       <td />
                       <td class="nametag">Email</td>
                       <td>
                           <input type="email" name="email" class="form-control" value="${userDetail.email}">
                       </td>
                   </tr>
                   <tr>
                       <td class="nametag">주소</td>
                       <td colspan="4">
                           <input type="text" name="address" class="form-control" value="${userDetail.address}">
                       </td>  
                   </tr>
                   <tr>
                       <td class="nametag">입사일</td>
                       <td>    
                           <input type="text" class="form-control" value="<fmt:formatDate value="${userDetail.hireDate}" pattern="yy-MM-dd"/>" readonly>
                       </td>
                       <td />
                       <td class="nametag">퇴사 여부</td>
                       <td>
                       	<select class="form-control" name="quitYn">
                       	 	<option value="Y" ${userDetail.quitYn eq 'Y' ? 'selected' : ''}>퇴사</option>
		 					<option value="N" ${userDetail.quitYn eq 'N' ? 'selected' : ''}>근무</option>
                       	</select>
                       </td>
                   </tr>                   
                   </tbody>
               </table>
        </div>
    </div>	
    <div class="text-center mt-3">
        <button type="submit" class="btn btn-success">수정하기</button>
        <button type="reset"class="btn btn-info">취소하기</button>
    </div>    
	</form:form>
</section> 


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


