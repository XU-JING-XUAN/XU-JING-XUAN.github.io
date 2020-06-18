<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>關於我們</title>
		<style>
		@import"../assets/css/goods.css";
		@import"../assets/css/style2.css";
		@import"../assets/css/our3.css";
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
							<!--內容-->
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12"><!--大圖-->
									<div class="our_img" ><img alt="Bootstrap Image Preview" src="../assets/img/ourphoto2.png" /></div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12" id="idea">
								<h4 class="o-tit">團隊理念</h4>
									<p align="center" class="o-tit2">
										<br/><br/>探索未知，擁抱未來，給你帶來最好的體驗。<br/><br/>無論你是上班族、學生抑或是樂齡人士，希望都可以在這裡找到一些樂趣，放鬆心情。
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-3">
									<img class="oimg"src="../assets/img/p1.jpg" /><br>
									<h5 style="padding-top: 15px;">張勻怡&nbsp;| &nbsp; Evelyn</h5>
									<div class="yun-intro">Bon Vacances創辦人-前端設計<hr></div>
									<div class="yun-intro2">唯有面對內心的恐懼，才能真正擁抱勇敢。</div>
									<div class="yun-intro3"><a href="https://www.facebook.com/zhang.y.yi.7" target="_blank"><img src="../assets/img/fb.png" style="height:40px;width:40px;"></a>&nbsp;
									<a href="https://instagram.com/yoo_ut?igshid=1n67vwplx5ne3" target="_blank"><img src="../assets/img/ig.png" style="height:40px;width:40px;"></a>
									</div>
									<!-- Button trigger modal -->
									
									<!-- Modal -->
									<!--Moel end-->
								</div>
								<div class="col-md-3">
									<img alt="Bootstrap Image Preview" class="oimg" src="../assets/img/p2.jpg"/>
									<br>
						           <h5 style="padding-top: 15px;">許淨瑄&nbsp;| &nbsp; Emily</h5>
									<div class="hsu-intro">Bon Vacances創辦人-前端設計<hr></div>
									<div class="hsu-intro2">我享受我的生活，因為這個角色只有我能當。</div>
									<div class="hsu-intro3"><a href="https://www.facebook.com/profile.php?id=100006480166120" target="_blank"><img src="../assets/img/fb.png" style="height:40px;width:40px;"></a>
									<a href="https://instagram.com/hujing__?r=nametag" target="_blank">&nbsp;<img src="../assets/img/ig.png" style="height:40px;width:40px;"></a></div>
									<!-- Button trigger modal -->
									
									<!-- Modal -->
									<!--Moel end-->
									
								</div>
								<div class="col-md-3">
									<img alt="Bootstrap Image Preview" class="oimg" src="../assets/img/p3.jpg" />
									<br>
									<h5 style="padding-top: 15px;">劉彥鴻&nbsp;| &nbsp; Vincent</h5>
									<div class="liu-intro">Bon Vacances創辦人-後端開發<hr></div>
									<div class="liu-intro2">你好我姓劉，三個臭皮匠勝過一個諸葛亮的劉。</div>
									<div class="liu-intro3"><a href="https://www.facebook.com/MaGaiLiu" target="_blank"><img src="../assets/img/fb.png" style="height:40px;width:40px;"></a>&nbsp;
									<a href="https://www.instagram.com/vincent_liu__/?hl=zh-tw" target="_blank"><img src="../assets/img/ig.png" style="height:40px;width:40px;"></a></div>
									<!-- Button trigger modal -->
									
									<!-- Modal -->
									<!--Moel end-->
								</div>
								<div class="col-md-3">
									<img alt="Bootstrap Image Preview" class="oimg" src="../assets/img/p4.jpg"  />
									<br>
									<h5 style="padding-top: 15px;">鄭宇翔&nbsp;| &nbsp; Sky</h5>
									<div class="yu-intro">Bon Vacances創辦人-後端開發<hr></div>
									<div class="yu-intro2">研表究明，漢字的序順並不定一能影閱響讀。</div>
									<div class="yu-intro3"><a href="https://www.facebook.com/profile.php?id=100002203151898" target="_blank"><img src="../assets/img/fb.png" style="height:40px;width:40px;"></a>&nbsp;
									<a href="https://www.instagram.com/cheng_1222_/?hl=zh-tw" target="_blank"><img src="../assets/img/ig.png" style="height:40px;width:40px;"></a></div>
									<!-- Button trigger modal -->
									
									<!-- Modal -->
									<!--Moel end-->
								</div>
							</div>
						</div>
						<!--end-->
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
				</body>
			</html>