<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인화면</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common/main.css">
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
    
    
</head>
<body>
	<div id="container">
		<header>
			<nav class="navbar navbar-default" style="padding: 0px;">
				<div class="container-fluid" style="padding: 0px;">
					<div class="mainHeader">
						<nav class="navbar" style="padding: 0px;">
							<!-- 로고 & 프젝명 -->
							<a class="navbar-brand" href="#"
								style="font-size: 2.7rem; color: #000;"> <img alt="logo"
								src="${pageContext.request.contextPath }/resources/images/logo_transparent22.png"
								style="width: 56px; height: 50px;"> <strong>Floworks</strong>
							</a>
						</nav>
						<!-- 검색바 -->
						<!-- mr : margin right -->
						<div class="mainHeader mr-5">
							<nav class="navbar navbar-expand-mg">
								<form action="#" class="form-inline">
									<input type="text" class="form-control" style="width: 550px;"
										placeholder="검색어를 입력해주세요.">
									<button class="btn btn-outline-secondary" type="submit">Search</button>
								</form>
								<p style="margin: 5px auto; padding-left: 30px;"></p>
							</nav>
						</div>

						<!-- 로그아웃 & 마이페이지 -->
						<!-- 로그인 전/ 후 달라져야함  -->
						<div class="mainHeader dropdown mr-2">
							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								메뉴 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#">마이페이지</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#">로그아웃</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#">Something else here</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#">Separated link</a></li>
							</ul>
						</div>

						<div class="mainHeader mr-3">
							<!-- Button trigger modal -->
							<button type="button" class="btn" data-toggle="modal"
								data-target="#exampleModal">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
									fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                                    <path
										d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                                </svg>
								<span class="badge badge-danger">10</span>
							</button>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div
								class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">에러 알림</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<h5>오류를 확인해보세요.</h5>
										<p>
											This <a href="#" role="button"
												class="btn btn-secondary popover-test" title="Popover title"
												data-content="Popover body content is set in this attribute.">button</a>
											triggers a popover on click.
										</p>
										<hr>
										<h5>창이 작아지면 스크롤 생김</h5>
										<p>
											<a href="#" class="tooltip-test" title="Tooltip">This
												link</a> and <a href="#" class="tooltip-test" title="Tooltip">that
												link</a> have tooltips on hover.
										</p>
										<hr>
										<h5>Popover in a modal</h5>
										<p>
											This <a href="#" role="button"
												class="btn btn-secondary popover-test" title="Popover title"
												data-content="Popover body content is set in this attribute.">button</a>
											triggers a popover on click.
										</p>
										<hr>
										<h5>Popover in a modal</h5>
										<p>
											This <a href="#" role="button"
												class="btn btn-secondary popover-test" title="Popover title"
												data-content="Popover body content is set in this attribute.">button</a>
											triggers a popover on click.
										</p>
										<hr>
										<h5>Popover in a modal</h5>
										<p>
											This <a href="#" role="button"
												class="btn btn-secondary popover-test" title="Popover title"
												data-content="Popover body content is set in this attribute.">button</a>
											triggers a popover on click.
										</p>
										<hr>
										<h5>Popover in a modal</h5>
										<p>
											This <a href="#" role="button"
												class="btn btn-secondary popover-test" title="Popover title"
												data-content="Popover body content is set in this attribute.">button</a>
											triggers a popover on click.
										</p>
										<hr>
										<h5>Tooltips in a modal</h5>
										<p>
											<a href="#" class="tooltip-test" title="Tooltip">This
												link</a> and <a href="#" class="tooltip-test" title="Tooltip">that
												link</a> have tooltips on hover.
										</p>
										<hr>
										<h5>Tooltips in a modal</h5>
										<p>
											<a href="#" class="tooltip-test" title="Tooltip">This
												link</a> and <a href="#" class="tooltip-test" title="Tooltip">that
												link</a> have tooltips on hover.
										</p>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>

						<div class="mainHeader">
							<!-- 로그인한 사용자의 프로필 -->
							<img src="${pageContext.request.contextPath }/resources/images/dog.jpg" alt="프로필사진" class="img-circle"
								style="width: 45px; height: 45px; margin: 15px auto; border-radius: 50%;">
							<p style="margin: 30px 5px; width: 50px;">홍길동</p>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</nav>

		</header>