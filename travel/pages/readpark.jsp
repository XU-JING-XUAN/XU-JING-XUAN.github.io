<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../config.jsp" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>主題樂園so fun</title>
		<style>
		@import"../assets/css/readcss.css";
		
		</style>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<script src="/jquery/2.0.0/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<script src="/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container-fluid">
			<!--導覽列-->
			<div class="row">
				<div class="col-md-12">
					<!--未登入導覽列-->
			 <% if(session.getAttribute("username")!=null){%>
				<nav class="navbar navbar-expand-lg navbar-light bg-light ">
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="navbar-toggler-icon"></span>
					</button> <a class="navbar-brand" href="../index.jsp">Bon Vacances</a>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active">
								<a class="nav-link" href="readpeople.jsp" target="_blank">復古人文之旅 <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="readpark.jsp" target="_blank">主題樂園so fun</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="readold.jsp" target="_blank">銀髮族悠活</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="our.jsp" target="_blank">關於我們</a>
							</li>
						</ul>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="text" />
							<button class="btn btn-light my-2 my-sm-0" type="submit">
							Search
							</button>
						</form>
						<!--會員-->
						<ul class="navbar-nav ml-md-auto">
							
							<li class="nav-item active">
								<button type="button" class="btn btn-light" onclick="location.href='../logout.jsp';">
								登出
								</button>
										</li>
										<li class="nav-item active">
											<a class="nav-link" href="member.jsp">會員中心<span class="sr-only">(current)</span></a>
										</li>
										<li class="nav-item active">
											<a class="nav-link" href="car.jsp">購物車 <span class="sr-only">(current)</span></a>
										</li>
										</ul>
									</div>
									<!--會員end-->
								</nav>
								<!--未登入導覽列end-->
				<!--已登入導覽列-->
				<% } else{%>
				<nav class="navbar navbar-expand-lg navbar-light bg-light ">
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="navbar-toggler-icon"></span>
					</button> <a class="navbar-brand" href="../index.jsp">Bon Vacances</a>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active">
								<a class="nav-link" href="readpeople.jsp" target="_blank">復古人文之旅 <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="readpark.jsp" target="_blank">主題樂園so fun</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="readold.jsp" target="_blank">銀髮族悠活</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="our.jsp" target="_blank">關於我們</a>
							</li>
						</ul>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="text" />
							<button class="btn btn-light my-2 my-sm-0" type="submit">
							Search
							</button>
						</form>
						<!--會員-->
						<ul class="navbar-nav ml-md-auto">
							
							<li class="nav-item active">
								<button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal">
								登入
								</button>
								<!-- 登入Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Welcome!</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form method="post" action="../check.jsp" >
													<ul style="padding-bottom: 20px;margin-top:20px;">
														<li>帳號︰<input class="input2" type="text" name="username" id="username" /><br/></li>
														<li>密碼︰<input class="input2" type="text" name="password" id="password" /><br/></li>
														
														<div class="modal-footer">
															<button type="submit" class="btn btn-secondary" value="登入">登入</button>
														</div>
													</ul>
												</form>		
													</div>
												</div>
											</div>
										</li>
										<li class="nav-item active">
											<button type="button" class="btn btn-light" data-toggle="modal" data-target="#exampleModal2">
											註冊
											</button>
											<!-- 註冊Modal -->
											<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Join Us</h5>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<form action="../SignUp.jsp" method="POST">
																<ul style="padding-bottom: 20px;margin-top:20px;">
																	
																	<li>會員帳號︰<input class="input2" type="text" name="username" id="username" /><br/></li>
																	<li>會員密碼︰<input class="input2" type="text" name="password" id="password" /><br/></li>
																	<li>密碼確認︰<input class="input2" type="text" name="password2" id="password2" /><br/></li>
																</ul>
																<div class="modal-footer">
																	<input type="submit" class="btn btn-secondary" value="註冊">
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li class="nav-item active">
											<a class="nav-link" href="member.jsp">會員中心<span class="sr-only">(current)</span></a>
										</li>
										<li class="nav-item active">
											<a class="nav-link" href="car.jsp">購物車 <span class="sr-only">(current)</span></a>
										</li>
										</ul>
									</div>
									<!--會員end-->
								</nav>
								<%}%>
								<!--已登入導覽列end-->
								</div>
							</div>
							<!--導覽列end-->
							<!--商品瀏覽大圖-->
							<div class="row" id="bigpic">
								<div class="col-md-12"  >
									<img alt="readone" id="bigpicinner" src="../assets/img/park.png" />
								</div>
							</div>
							<!--商品瀏覽大圖end-->
							<!--第一個行程-->
							<div class="row" id="spacing">
								<div class="col-md-4">
									<div class="carousel slide" id="carousel-221829">
										<ol class="carousel-indicators">
											<li data-slide-to="0" data-target="#carousel-221829" class="active">
											</li>
											<li data-slide-to="1" data-target="#carousel-221829">
											</li>
											<li data-slide-to="2" data-target="#carousel-221829">
											</li>
											<li data-slide-to="3" data-target="#carousel-221829">
											</li>
											<li data-slide-to="4" data-target="#carousel-221829">
											</li>
										</ol>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img class="d-block w-100" alt="1-1" src="../assets/img/eda1.jpg" />
												
											</div>
											<div class="carousel-item">
												<img class="d-block w-100" alt="1-2" src="../assets/img/eda2.jpg" />
												
											</div>
											<div class="carousel-item">
												<img class="d-block w-100" alt="1-3" src="../assets/img/eda3.jpg" />
												
											</div>
											<div class="carousel-item">
												<img class="d-block w-100" alt="1-3" src="../assets/img/eda4.jpg" />
												
											</div>
											<div class="carousel-item">
												<img class="d-block w-100" alt="1-3" src="../assets/img/eda5.jpg" />
												
											</div>
											</div> <a class="carousel-control-prev" href="#carousel-221829" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">以前</span></a> <a class="carousel-control-next" href="#carousel-221829" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">下一個</span></a>
										</div>
									</div>
									<div class="col-md-8">
										<h3 id="readtitle">
										義大遊樂世界，給想挑戰極限的你
										</h3>
										<dl>
											<dt>
											地點
											</dt>
											<dd>
											高雄義大主題遊樂園
											</dd>
											<dt>
											可出發日程
											</dt>
											<dd>
											2020/6/21、2020/6/23、2020/6/25、2020/6/27
											</dd>									
											<dt>
											行程時間
											</dt>
											<dd>
											10:00~16:00
											</dd>
											<dt>
											行程簡介
											</dt>
											<dd>
											非常刺激的遊樂設施就在義大，同時也有主題遊行跟兒童園區，適合親子旅遊或是想釋放壓力的你

											</dd>
										</dl>
										<div class="row">
											<div class="col-md-12">
												
												<button type="button" class="btn btn-success" id="readbtn" onclick="location.href='eda.jsp'">
												立即出發!
												</button>
											</div>
										</div>
									</div>
								</div>
								<!--第一個行程end-->
								<!--第二個行程-->
								<div class="row" id="spacing">
									<div class="col-md-4">
										<div class="carousel slide" id="carousel-886300">
											<ol class="carousel-indicators">
												<li data-slide-to="0" data-target="#carousel-886300">
												</li>
												<li data-slide-to="1" data-target="#carousel-886300">
												</li>
												<li data-slide-to="2" data-target="#carousel-886300" class="active">
												</li>
												<li data-slide-to="3" data-target="#carousel-886300">
												</li>
												<li data-slide-to="4" data-target="#carousel-886300">
												</li>
											</ol>
											<div class="carousel-inner">
												<div class="carousel-item active">
													<img class="d-block w-100" alt="優先" src="../assets/img/leofoo1.jpg" />
													
												</div>
												<div class="carousel-item">
													<img class="d-block w-100" alt="第二" src="../assets/img/leofoo2.jpg" />
													
												</div>
												<div class="carousel-item ">
													<img class="d-block w-100" alt="第三" src="../assets/img/leofoo3.jpg" />
													
												</div>
												<div class="carousel-item ">
													<img class="d-block w-100" alt="第三" src="../assets/img/leofoo4.jpg" />
													
												</div>
												<div class="carousel-item ">
													<img class="d-block w-100" alt="第三" src="../assets/img/leofoo5.jpg" />
													
												</div>
												</div> <a class="carousel-control-prev" href="#carousel-886300" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">以前</span></a> <a class="carousel-control-next" href="#carousel-886300" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">下一個</span></a>
											</div>
										</div>
										<div class="col-md-8">
											<h3 id="readtitle">
											六福村主題樂園，多種遊樂設施玩整天
											</h3>
											<dl>
											<dt>
											地點
											</dt>
											<dd>
											新竹六福村樂園
											</dd>
											<dt>
											可出發日程
											</dt>
											<dd>
											2020/6/21、2020/6/23、2020/6/25、2020/6/27
											</dd>									
											<dt>
											行程時間
											</dt>
											<dd>
											9:00-17:00
											</dd>
											<dt>
											行程簡介
											</dt>
											<dd>
											想看動物又想玩水又想刺激玩雲霄飛車嗎?這麼貪心的你選六福村一票玩到底啦!!
											</dd>
										</dl>
											<div class="row">
												<div class="col-md-12">
													
													<button type="button" class="btn btn-success" id="readbtn" onclick="location.href='leofoo.jsp'">
										
													立即出發!
													</button>
												</div>
											</div>
										</div>
									</div>
									<!--第二個行程end-->
									<footer >
										<div class="row" >
											<div class="col-md-12">
												<div class="row" >
													<div class="col-md-12">
														<form action="MailTo:leewn@yourmail.com" id="footer">
															<p class="footer">GET IN TOUCH</p>
															<div class="input-group mb-3 col align-self-start">
																<div class="input-group-prepend">
																	<span class="input-group-text">@</span>
																</div>
																<input type="text" class="form-control" placeholder="Username" id="usr" name="username">
															</div>
															<div class="input-group mb-3 col align-self-start ">
																<input type="text" class="form-control" placeholder="Your Email" id="mail" name="email">
																<div class="input-group-append">
																	<span class="input-group-text">@gmail.com</span>
																</div>
															</div>
															<div class="form-group col align-self-start">
																<label for="comment">Comment:</label>
																<textarea class="form-control" rows="5" id="comment" name="text"></textarea>
															</div>
															<button type="submit" class="btn btn-primary col align-self-start"
															>SENT MESSAGE</button>
														</form>
													</div>
												</div>
											</div>
											<font style="color:white ;margin-left:38%;margin-bottom:1%;font-family:'微軟正黑體' ">Copyright &copy;&nbsp;Bon Vacances&nbsp;您是第#位想出發的旅人</font> 
										</div>
									</footer>
									
								</div>
								<!--container整個頁面 end-->
							</body>
						</html>