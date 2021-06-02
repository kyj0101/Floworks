<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin/userDetail.css">
	
<section>
<div class="container">
    <form:form 
    	name="f"
    	action="${pageContext.request.contextPath}/admin/userDetail"
    	method="post">
 
    	<div class="col-sm-12 pt-3">
            <div class="card">
                
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr style="line-height:32px;">
                                <td>ID</td>
                                <td>
                                    <input type="text" name="user_id" class="form-control" value="${userList.id}" readonly>
                                </td>
                                <td>직원명</td>
                                <td>
                                    <input type="text" name="user_name" class="form-control" value="${userList.name}" readonly>
                                </td>                        
                            </tr>
                            <tr>
                                <td>부서</td>
                                <td>
                                    <input type="text" name="department" class="form-control" maxlength="10" value="">                                    
                                </td>
                                <td>직급</td>
                                <td>
                                    <input type="text" name="position" class="form-control" maxlength="10" value="">                                    
                                </td>
                            </tr>  
                            <tr>
                                <td>연락처</td>
                                <td>
                                    <input type="tel" name="phone" class="form-control" value="">
                                </td>
                                <td>Email</td>
                                <td>
                                    <input type="email" name="email" class="form-control" value="">
                                </td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td colspan="3">
                                    <input type="text" id="address" name="address" class="form-control" value="">
                                </td>
                                
                                
                            </tr>
                            <tr>
                                <td>입사일</td>
                                <td>
                                    
                                    <input type="date" name="hire_date" class="form-control" value="" readonly> 
                                </td>
                                <td>퇴사 여부</td>
                                <td>
                                	<input type="radio" name="quit_yn" checked="checked" value="N">근무
                                	<input type="radio" name="quit_yn" value="Y">퇴사
                                </td>
                            </tr>
                            
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
 
        </div>
	    <div class="text-center mt-3">
	        <button type="submit" class="btn btn-success">수정</button>
	        <button type="reset" class="btn btn-info">취소</button>
	    </div>    
    </form:form>


</div>
</section> 


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


