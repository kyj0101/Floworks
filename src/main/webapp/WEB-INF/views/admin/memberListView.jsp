<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
        <section>
            <div class="page-header">
                
                <div class="row g-0">
                    <h2 class="col-8">직원목록</h2>
                    

                    <form class="col-4" action="#">
                        <div class="input-group">
                            <select class="form-select form-select-sm small" aria-label="분류" style="width: 70px; height: 50px; border-radius: 10px 0px 0px 10px; border-color: gainsboro;">
                                <option selected>분류</option>
                                <option value="1">직원</option>
                                <option value="2">부서</option>
                            </select>

                            <input type="text" class="form-control bg-light border-0 small" list="datalistOptions" id="exampleDataList" placeholder="Type to search..."
                                    aria-label="Search" aria-describedby="basic-addon2" style="height: 50px;">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit" style="height: 50px; border-radius: 0px 10px 10px 0px;"> 
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                            <!--나중에 session이나 다른 기능으로 받아와야할 것 들-->
                            <datalist id="datalistOptions">
                                <option value="San Francisco">
                                <option value="New York">
                                <option value="Seattle">
                                <option value="Los Angeles">
                                <option value="Chicago">
                            </datalist>
                        </div>
                    </form>
                </div>
                <hr class="my-4">
            </div>



            <div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>
            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>

                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div>

            <div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>

                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>
            
                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div><div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>

                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>
            
                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div>
            <div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>
            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>

                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div><div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>
            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>

                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div><div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>

                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div><div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>
            
                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div><div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>

                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>
            
                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div><div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>
            
                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div><div class="d-flex flex-column align-items-stretch bg-white">
                <div class="list-group list-group-flush border-bottom scrollarea">


                    <!--나중에 script함수로 class속성에 active 추가-->
                    <!--workspace id / 이름/ 이메일/ 주소 /입사일 /직급/ 부서-->

                  <a href="#" class="list-group-item list-group-item-action py-3 lh-tight">
                    <div class="row g-0">
                        <div class="col-1">
                            <i class="fas fa-user-circle" style="color: pink;"></i>
                        </div>
                    
                        <div class="col-11">
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>ID: </strong>
                                    <span>kjh9999</span>
                                </div>

                                <div class="col">
                                    <strong>Name: </strong>
                                    <span>강준혁</span>
                                </div>
                                <div class="col">
                                </div>
                            </div>
                            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>Department: </strong>
                                    <span>SCM department</span>
                                </div>

                                <div class="col">
                                    <strong>Rank: </strong>
                                    <span>대리</span>
                                </div>

                                <div class="col">
                                    <strong>Entered-day: </strong>
                                    <span>2021-05-07</span>
                                </div>

                            </div>
            
                            <div class="row g-0 mb-4">
                                <div class="col">
                                    <strong>E-Mail: </strong>
                                    <span>qwertyu@naver.com</span>
                                </div>

                                <div class="col">
                                </div>

                                <div class="col">
                                </div>

                            </div>

                            <div class="row g-0 mb-1">
                                <div class="col-8">
                                    <strong>Address: </strong>
                                    <span>서울특별시 00구 000번지 000-00</span>
                                </div>

                                <div class="col-4">
                                    <div class="row">
                                       <div class="col">
                                        <button type="button" class="btn btn-primary">메일 보내기</button>
                                        <button type="button" class="btn btn-danger">Delete</button>
                                
                                       </div> 
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </a> 
            </div>

        
            <hr class="my-4">    
            <!--pagination : https://getbootstrap.com/docs/5.0/components/pagination/-->
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&lt;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&gt;</span>
                    </a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                </ul>
            </nav>
        </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>