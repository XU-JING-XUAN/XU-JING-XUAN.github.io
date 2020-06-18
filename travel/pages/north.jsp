<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../config.jsp" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>靜謐清淨北海岸，沉澱心靈好去處</title>
		<style>
		@import"../assets/css/goods.css";
		
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
		<!--整個網頁 start-->
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
							
							<!--上方圖片與下單大區-->
							<div class="row" >
								<!--大圖-->
								<div class="col-md-6" id="bigpic">
								<%ResultSet rs;%>
									<%
										sql = "select * from product where no = 'north'";
										rs = con.createStatement().executeQuery(sql);
										rs.next();
									%>
									<div class="carousel slide" id="carousel-63977">
										<ol class="carousel-indicators">
											<li data-slide-to="0" data-target="#carousel-63977" class="active">
											</li>
											<li data-slide-to="1" data-target="#carousel-63977">
											</li>
											<li data-slide-to="2" data-target="#carousel-63977">
											</li>
											<li data-slide-to="3" data-target="#carousel-63977">
											</li>
											<li data-slide-to="4" data-target="#carousel-63977">
											</li>
										</ol>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img class="d-block w-100" alt="" src="../assets/img/<%=rs.getString(2)%>1.jpg" />
												
											</div>
											<div class="carousel-item">
												<img class="d-block w-100" alt="" src="../assets/img/<%=rs.getString(2)%>2.jpg" />
												
											</div>
											<div class="carousel-item">
												<img class="d-block w-100" alt="" src="../assets/img/<%=rs.getString(2)%>3.jpg" />
												
											</div>
											<div class="carousel-item">
												<img class="d-block w-100" alt="" src="../assets/img/<%=rs.getString(2)%>4.jpg" />
												
											</div>
											<div class="carousel-item ">
												<img class="d-block w-100" alt="" src="../assets/img/<%=rs.getString(2)%>5.jpg" />
												
											</div>
											</div> <a class="carousel-control-prev" href="#carousel-63977" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">以前</span></a> <a class="carousel-control-next" href="#carousel-63977" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">下一個</span></a>
										</div>
									</div>
									<!--大圖end-->
									
									<!--大圖右方下單選項-->
									<div class="col-md-6" id="spacing">
										<h3 id="title">
										<%=rs.getString(3)%>
										</h3><hr>
										<p id="buyprice">
											NT.<%=rs.getString(4)%>/人
										</p>
										<form  method="get" action="../AddCar.jsp">
										<div class="row"  id="select">
											<div class="col-md-4">
												<h3 id="buyinner">
												出發日期
												</h3>
											</div>
											<div class="col-md-8" id="option">
												<select class="form-control" id="sel1" name="date">
													<option value="2020/06/21">2020/06/21</option>
													<option value="2020/06/23">2020/06/23</option>
													<option value="2020/06/25">2020/06/25</option>
													<option value="2020/06/27">2020/06/27</option>
												</select>
											</div>
										</div>
										<div class="row" id="select">
											<div class="col-md-4">
												<h3 id="buyinner">
												交通方式
												</h3>
											</div>
											<div class="col-md-8">
												<select class="form-control" id="sel1" name="traffic">
													<option value="自行開車">自行開車</option>
													<option value="火車">火車</option>
													<option value="客運">客運</option>
													<option value="需要遊覽車">需要遊覽車</option>
												</select>
											</div>
										</div>
										<div class="row" id="select">
											<div class="col-md-4">
												<h3 id="buyinner">
												人數<small>(一組限四人)</small>
												</h3>
											</div>
											<div class="col-md-4">
												<select class="form-control" id="sel1" name="quantity">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
												</select>
											</div>
											<div class="col-md-4">
												
												<button type="submit" class="btn btn-success">
												加入購物車
												</button> 
												<input type="hidden" name="number" value="<%=rs.getString(1)%>">
												<span class="badge badge-default">編號:<%=rs.getString(1)%>&nbsp;名額尚餘20位</span>
											</div>
										</form>
										</div>
									</div>
									<!--大圖右方下單選項end-->
								</div><br><br>
								<!--上方圖片與下單大區end-->
								<!--行程介紹-->
								<div class="row" >
									<div class="col-md-12" id="introinner" >
										<h3 class="goodtitle">
										行程介紹
										</h3>
										<br>
										<p><%=rs.getString(6)%></p>
									</div>
								</div><hr>
								<!--行程介紹end-->
									<div class="parallaxnorth"></div><br>
								<!--行程資訊-->
								<div class="row" id="">
									<div class="col-md-12" id="introinner">
										<h3 class="goodtitle"><mark>
										行程資訊</mark>
										</h3>
										<br>
										<dl>
											<dt>
											行程資訊
											</dt>
											<dd>
											<%=rs.getString(7)%>
											</dd>
											<dt>
											地點
											</dt>
											<dd>
											<%=rs.getString(8)%>
											</dd>
											
											<dt>
											啟程與返程時間
											</dt>
											<dd>
											<%=rs.getString(9)%>
											<dt>
											住宿
											</dt>
											<dd>
											<%=rs.getString(10)%>
											</dd>
										</dl>
									</div>
								</div><hr>
								<!--行程資訊end-->
								
								<!--重要注意事項-->
								<div class="row" id="playinform">
									<div class="col-md-12" id="introinner">
										<h3 class="important">
										重要注意事項
										</h3>
										<br>
										<ul>
											<li class="list-item">
												<%=rs.getString(12)%>
											</li>
											<li class="list-item">
												<%=rs.getString(13)%>
											</li>
											<li class="list-item">
												<%=rs.getString(14)%>
											</li>
											<li class="list-item">
												<%=rs.getString(15)%>
											</li>
											<li class="list-item">
												<%=rs.getString(16)%>
											</li>
											<li class="list-item">
												<%=rs.getString(17)%>
												<li class="list-item">
													<%=rs.getString(18)%>
												</li>
												<li class="list-item">
													<%=rs.getString(19)%>11
												</li>
											</ul>
										</div>
									</div><hr>
									<!--重要注意事項end-->
									<!--時間系列大區-->
									<div class="row" id="calendercenter">
										<!--現在時刻-->
										<div class="col-md-6" >
											<p class="time">現在時刻<br><small>我們相信珍惜當下的每一刻，就是最美。</small></p>
											<canvas id="canvas" width="300" height="300"
											style="background-color:white">
											</canvas>
											<script src="../assets/js/calender.js"></script>
										</div>
										<!--現在時刻end-->
										<!--日曆-->
										<div class="col-md-6" >
											<p class="time">本行程出團日期</p>
											<div class="month">
												<ul>
													<li>
														June<br>
														<span style="font-size:18px">2020</span>
														<span>臺南鹽鄉體驗出發時程表</span>
													</li>
												</ul>
											</div>
											<ul class="weekdays">
												<li>Mo</li>
												<li>Tu</li>
												<li>We</li>
												<li>Th</li>
												<li>Fr</li>
												<li>Sa</li>
												<li>Su</li>
											</ul>
											<ul class="days">
												<li>1</li>
												<li>2</li>
												<li>3</li>
												<li>4</li>
												<li>5</li>
												<li>6</li>
												<li>7</li>
												<li>8</li>
												<li>9</li>
												<li>10</li>
												<li>11</li>
												<li>12</li>
												<li>13</li>
												<li>14</li>
												<li>15</li>
												<li>16</li>
												<li>17</li>
												<li>18</li>
												<li>19</li>
												<li>20</li>
												<li><span class="active">21</span></li>
												<li>22</li>
												<li><span class="active">23</span></li>
												<li>24</li>
												<li><span class="active">25</span></li>
												<li>26</li>
												<li><span class="active">27</span></li>
												<li>28</li>
												<li>29</li>
												<li>30</li>
												<li>31</li>
											</ul>
										</div>
										<!--日曆end-->
									</div>
									<!--時間系列大區end-->
									
									<!--留言板大區-->
									<div class="row" >
										<div class="col-md-12">
											<!--商品留言板-->
											<div class="row" id="boardscroll">
												<div class="col-md-12" >
													<h3 class="goodtitle">商品評論</h3><br>
													<div class="media border p-3">
														<img src="../assets/img/test.jpg" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;height:60px;">
														<div class="media-body">
															<h4>John Doe <small><i>Posted on February 19, 2016</i></small><br>
															<div class="star star-lock">
																<input type="radio" name="rdStarLock"/><label>請打分</label>
																<input type="radio" name="rdStarLock" value="1"/>
																<input type="radio" name="rdStarLock" value="2"/>
																<input type="radio" name="rdStarLock" value="3" checked="checked"/>
																<input type="radio" name="rdStarLock" value="4"/>
																<input type="radio" name="rdStarLock" value="5"/>
															</div></h4>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
														</div>
													</div>
													<div class="media border p-3">
														<img src="../assets/img/test.jpg" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;height:60px;">
														<div class="media-body">

															<h4>John Doe <small><i>Posted on February 19, 2016</i></small><br>
																<div class="star star-lock">
																<input type="radio" name="rdStarLock"/><label>請打分</label>
																<input type="radio" name="rdStarLock" value="1"/>
																<input type="radio" name="rdStarLock" value="2"/>
																<input type="radio" name="rdStarLock" value="3" checked="checked"/>
																<input type="radio" name="rdStarLock" value="4"/>
																<input type="radio" name="rdStarLock" value="5"/>
															</div>
															</h4>
															<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
														</div>
														
													</div>
												</div>
												
											</div>
											<!--商品留言板end-->
											
											<!--留言區-->
											<div class="row" id="board" >
												<div class="col-md-12" >
													<h3 class="goodtitle">
													留言區
													</h3>
													<div class="row">
														<div class="col-md-8">
															<div class="row">
																<div class="col-md-12">
																	<div class="star">
																		<input type="radio" name="rdStar" checked="checked"/>
																		<label id="lablestr">您對此行程給幾顆星呢?</label>
																		<input type="radio" name="rdStar" value="1"/><label id="lablestr">一星</label>
																		<input type="radio" name="rdStar" value="2"/><label id="lablestr">二星</label>
																		<input type="radio" name="rdStar" value="3"/><label id="lablestr">三星</label>
																		<input type="radio" name="rdStar" value="4"/><label id="lablestr">四星</label>
																		<input type="radio" name="rdStar" value="5"/><label id="lablestr">五星</label>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-md-12">
																	<textarea class="form-control" rows="5" id="comment"></textarea>
																</div>
															</div>
														</div>
														<div class="col-md-4">
															
															<button type="submit" class="btn btn-success" id="boardbtn" name="">
															送出留言
															</button>
														</div>
														</div>
														
													</div>
												</div>
											</div>
											<!--留言區end-->
										</div>
									</div>
									<!--留言版大區end-->
									
									<!--其他推薦行程-->
									<div class="row">
										<div class="col-md-12">
											<h3 class="else">
											其他推薦行程
											</h3><br>
											<div class="row">
												<div class="col-md-4">
													<div class="card">
														<a href="lukang.html"><img class="card-img-top" alt="" src="../assets/img/lukang1.jpg" /></a>
														<div class="card-block">
															<h5 class="card-title">
															鹿港文化之旅一日遊
															</h5>
															<p class="card-text">
																帶你穿越時空
															</p>
															<p>
																<a class="btn btn-primary" href="lukang.html">see more</a>
															</p>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="card">
														<a href="eda.html"><img class="card-img-top" alt="" src="../assets/img/eda1.jpg" /></a>
														<div class="card-block">
															<h5 class="card-title">
															義大遊樂世界
															</h5>
															<p class="card-text">
																眾多人想挑戰的天旋地轉就在這
															</p>
															<p>
																<a class="btn btn-primary" href="eda.html">see more</a>
															</p>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="card">
														<a href="east.html"><img class="card-img-top" alt="" src="../assets/img/east1.jpg" /></a>
														<div class="card-block">
															<h5 class="card-title">
															銀髮族專屬，花東縱谷行程
															</h5>
															<p class="card-text">
																好山好水好風景，壯麗景色盡收眼底
															</p>
															<p>
																<a class="btn btn-primary" href="east.html">see more</a>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!--其他推薦行程end-->
									<!--footer-->
									<footer style="background-color: black;" >
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
									<!--footer end-->
								</div>
								<!--整個網頁 end-->
								
							</body>
						</html>