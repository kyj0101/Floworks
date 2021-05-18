<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/attendance/attendance.css">


<section>

	<!-- 개인 근태 관리 창 -->
	<div class="page-header" >
	    <h1>근태 관리</h1>
	    <hr class="my-4">
	</div>
	
	<div class="container">
	    <div class="left">
	        <div class="input-mid">
	            <div class="input-group mb-3">
	                <div class="input-group-prepend">
	                  <span class="input-group-text" id="inputGroup-sizing-default">직원명</span>
	                </div>
	                <input type="text" id="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="조충범" readonly>
	            </div>
	
	            <div class="input-group mb-3">
	                <div class="input-group-prepend">
	                    <span class="input-group-text" id="inputGroup-sizing-default">부서명</span>
	                </div>
	                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="개발팀" readonly>
	            </div>
	
	            <div class="input-group mb-3">
	                <div class="input-group-prepend">
	                    <span class="input-group-text" id="inputGroup-sizing-default">직급</span>
	                </div>
	                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="주임" readonly>
	            </div>
	
	            <div class="input-group mb-3">
	                <div class="input-group-prepend">
	                    <span class="input-group-text" id="inputGroup-sizing-default">남은 연차</span>
	                </div>
	                <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="13" readonly>
	            </div>
	
	            <button type="button" class="btn btn-outline-secondary">연차 사용하기</button>
	            
	        </div>
	    </div>
	            
	    <div class="right">
	        <div class="calendar">
	            <div class="row">
	                <div class="span12">
	                    <table class="table-condensed table-bordered table-striped">
	                        <thead>
	                            <tr>
	                              <th colspan="7">
	                                <span class="btn-group">
	                                    <a class="btn"><i class="icon-chevron-left"></i></a>
	                                    <a class="btn active">May 2021</a>
	                                    <a class="btn"><i class="icon-chevron-right"></i></a>
	                                </span>
	                              </th>
	                            </tr>
	                            <tr>
	                                <th>Su</th>
	                                <th>Mo</th>
	                                <th>Tu</th>
	                                <th>We</th>
	                                <th>Th</th>
	                                <th>Fr</th>
	                                <th>Sa</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td class="muted">29</td>
	                                <td class="muted">30</td>
	                                <td class="muted">31</td>
	                                <td>1</td>
	                                <td>2</td>
	                                <td>3</td>
	                                <td>4</td>
	                            </tr>
	                            <tr>
	                                <td>5</td>
	                                <td>6</td>
	                                <td>7</td>
	                                <td>8</td>
	                                <td>9</td>
	                                <td>10</td>
	                                <td>11</td>
	                            </tr>
	                            <tr>
	                                <td class="btn-primary"><strong>12</strong></td>
	                                <td>13</td>
	                                <td>14</td>
	                                <td>15</td>
	                                <td>16</td>
	                                <td>17</td>
	                                <td>18</td>
	                            </tr>
	                            <tr>
	                                <td>19</td>
	                                <td>20</td>
	                                <td>21</td>
	                                <td>22</td>
	                                <td>23</td>
	                                <td>24</td>
	                                <td>25</td>
	                            </tr>
	                            <tr>
	                                <td>26</td>
	                                <td>27</td>
	                                <td>28</td>
	                                <td>29</td>
	                                <td class="muted">1</td>
	                                <td class="muted">2</td>
	                                <td class="muted">3</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	        </div>
	
	        <form class="attendance">
	            <div class="current-time">
	                <input class="form-control" type="text" value="2021/05/12 09:15:54">
	            </div>
	            <div class="attend-bt">
	                <button type="submit" class="btn btn-outline-primary" onclick="">출근</button>
	                    <button type="submit" class="btn btn-outline-danger">퇴근</button>
	                </div>
	            </form>
	            
	        </div>
	        
	        <div class="down">
	            <div class="left">
	                <div class="breakdown-mid">
	                    <div class="form-group">
	                        <label for="exampleFormControlSelect2">연차 사용 내역</label>
	                        <select multiple class="form-control" id="exampleFormControlSelect2">
	                          <option>1. 21/04/15 (반차)</option>
	                          <option>2. 21/02/15 ~ 21/02/17 (3일)</option>
	                          <option>3.</option>
	                          <option>4.</option>
	                          <option>5.</option>
	                          <option>6.</option>
	                          <option>7.</option>
	                          <option>8.</option>
	                          <option>9.</option>
	                          <option>10.</option>
	                        </select>
	                    </div>
	                </div>
	                
	            </div>
	            <div class="right">
	                <div class="breakdown-mid">
	                    <div class="form-group">
	                        <label for="exampleFormControlSelect2">출/퇴근 내역</label>
	                        <select multiple class="form-control" id="exampleFormControlSelect2">
	                            <option>1. 2021/05/12 08:55:30 출근</option>
	                            <option>2. 2021/05/11 18:01:30 퇴근</option>
	                            <option>3. 2021/05/11 08:57:27 출근</option>
	                            <option>4. 2021/05/10 19:21:12 퇴근</option>
	                            <option>5. 2021/05/10 08:50:02 출근</option>
	                            <option>6. 2021/05/07 18:30:42 퇴근</option>
	                            <option>7. 2021/05/07 08:59:45 출근</option>
	                            <option>8. 2021/05/06 18:00:00 퇴근</option>
	                            <option>9. 2021/05/06 09:00:27 출근</option>
	                            <option>10. 2021/05/05 18:24:18 퇴근</option>
	                        </select>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>