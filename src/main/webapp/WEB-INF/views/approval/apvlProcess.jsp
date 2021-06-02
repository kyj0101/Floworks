<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval/apvl_write.css" />

<!-- 구현 -->
<section>
    <!-- http://bootstrapk.com/components/#page-header -->
    <form action="${pageContext.request.contextPath}/approval/apvlWrite/enroll" 
    	  method="POST" 
    	  class="ap-process-frm" 
    	  id="ap-process-frm" 
    	  autocomplete="off">
        <sec:csrfInput/>
	    <div class="page-header" >
	        <h1>결재 처리</h1>
	        <hr class="my-4">
	    </div>
	    
	    
    </form>
    
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>