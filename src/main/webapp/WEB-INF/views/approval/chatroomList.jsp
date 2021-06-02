<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/approval/chat_roomlist.css" />

<!-- 구현 -->
<section>
   <!-- http://bootstrapk.com/components/#page-header -->
   <div class="page-header" >
       <h1>채팅방 목록</h1>
       <hr class="my-4">
   </div>

   <div class="jumbotron chat-room-jbt">
       <div class="chat-room">
           <a href="#">
               <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-chat-dots-fill chat-emoji" viewBox="0 0 16 16">
                   <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
               </svg>
               <h5 class="chrm-member-info" id="chrm-members-info"><b>유재석, 조세호</b></h5>
           </a>
           <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-circle-fill chat-alert-circle" viewBox="0 0 16 16">
               <circle cx="8" cy="8" r="8"/>
           </svg>
       </div>
   </div>
   <div class="jumbotron chat-room-jbt">
       <div class="chat-room">
           <a href="#">
               <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-chat-dots-fill chat-emoji" viewBox="0 0 16 16">
                   <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
               </svg>
               <h5 class="chrm-member-info" id="chrm-members-info"><b>하정우, 주지훈, 김향기, 마동석, 김동욱, 조한철, 임원희, 도경수, 이정재</b></h5>
           </a>
           <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-circle-fill chat-alert-circle" viewBox="0 0 16 16">
               <circle cx="8" cy="8" r="8"/>
           </svg>
       </div>
   </div>
   <div class="jumbotron chat-room-jbt">
       <div class="chat-room">
           <a href="#">
               <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-chat-dots-fill chat-emoji" viewBox="0 0 16 16">
                   <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
               </svg>
               <h5 class="chrm-member-info" id="chrm-members-info"><b>스폰지밥, 뚱이</b></h5>
           </a>
       </div>
   </div>
   <div class="jumbotron chat-room-jbt">
       <div class="chat-room">
           <a href="#">
               <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-chat-dots-fill chat-emoji" viewBox="0 0 16 16">
                   <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
               </svg>
               <h5 class="chrm-member-info" id="chrm-members-info"><b>말포이</b></h5>
           </a>
       </div>
   </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>