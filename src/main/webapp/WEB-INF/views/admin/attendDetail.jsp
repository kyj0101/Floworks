<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="근태 수정" name="title"/>
</jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/userDetail.css">
	
<section>
	<form:form 
		name="userUpdate"
		action="${pageContext.request.contextPath}/admin/attend/detail/update"
		method="post">	   
    <div class="card">	        
        <div class="card-body">
               <table class="table">
                   <tbody>
                   <tr id="topLine">
                       <td class="nametag">ID</td>
                       <td>
                           <input type="text" name="id" class="form-control" value="${attendMap.id}" readonly>
                           <input type="hidden" name="workspaceId" value="${attendMap.workspaceId}"/>
                       </td>
                       <td />
                       <td class="nametag">직원명</td>
                       <td>
                           <input type="text" name="name" class="form-control" value="${attendMap.name}" readonly>
                       </td>                        
                   </tr>
                   <tr>
                       <td class="nametag">부서</td>
                       <td>   
                            <input type="text" class="form-control" value="${attendMap.departmentName}" readonly>                         
                       </td>
                       <td />
                       <td class="nametag">직급</td>
                       <td>
                            <input type="text" class="form-control" value="${attendMap.position}" readonly>                                  
                       </td>
                   </tr>
					<tr>
                       <td class="nametag">출근일</td>
                       <td colspan="4">
                           <input type="text" name="day" class="form-control" value="<fmt:formatDate value="${attendMap.day}" pattern="yy/MM/dd"/>" readonly>
                       </td>  
                   </tr>
                   <tr>
                       <td class="nametag">출근시각</td>
                       <td>
                           	<input type="time" name="officeIn" class="form-control" value="${attendMap.officeIn}" >
                       </td>
                       <td />
                       <td class="nametag">퇴근시각</td>
                       <td>
                       		<input type="time" name="officeOff" class="form-control" value='${attendMap.officeOff}'>
                       </td>
                   </tr>

                   <tr>
                       <td class="nametag">지각 여부</td>
                       	
                       <td  colspan="4">
                       	<select class="form-control" name="latenessYn">
                       	 	<option value="Y" ${attendMap.latenessYn eq 'Y' ? 'selected' : ''} >O</option>
		 					<option value="N" ${attendMap.latenessYn eq 'N' ? 'selected' : ''}>X</option>
                       	</select>
                       </td>
                   </tr>                   
                   </tbody>
               </table>
        </div>
    </div>	
    <div class="text-center mt-3">
        <button type="submit" class="btn btn-success">수정하기</button>
        <button type="reset"class="btn btn-info" onclick="history.back();">취소하기</button>
    </div>    
	</form:form>
</section> 


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

