<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../config.jsp" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>car</title>
		<style>
			@import"../assets/css/car2.css";
			
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
		<!--整個網頁-->
		<div class="container-fluid">
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
								
							<!--整個購物車頁面-->
							<div class="row" id="allcar">
								<!--整個購物車頁面內框架-->
								<div class="col-md-12" >
									<h3 class="yourcar"><mark>
									您的購物車</mark>
									</h3>
									<!--(橫)商品、總計-->
									<div class="row" id="cartitle">
										<div class="col-md-4">
											<h3 class="topfont">
											商品
											</h3>
										</div>
										<div class="col-md-4">
											<h3  class="topfont">
											數量與金額
											</h3>
										</div>
										<div class="col-md-4">
											<h3  class="topfont">
											名額是否足夠
											</h3>
										</div>
									</div>
									<hr>
									<!--(橫)商品、總計end-->
									<%
										if(session.getAttribute("username")!=null){
										String username=session.getAttribute("username").toString();
										sql="select * from car where username='"+ username+"'";
										ResultSet rs=con.createStatement().executeQuery(sql);
										int total=0;
										if(rs.next()==false){
											out.print("<script>alert('你尚未購買東西唷~');</script>"); 
											response.setHeader("refresh","0;URL=../index.jsp");
										}	
										while(rs.next()){
										 String no=rs.getString("no");
										   String number=rs.getString("number");
										   String date=rs.getString("date");
										   String traffic=rs.getString("traffic");
										   int quantity=rs.getInt("quantity");
										   String sqlProduct="select * from product where number='"+number+"'";
										   ResultSet rsProduct=con.createStatement().executeQuery(sqlProduct);
										   rsProduct.next();
										   String p_name= rsProduct.getString("name");
										   String p_number=rsProduct.getString("number");
										   int p_price= rsProduct.getInt("price");
										   total += quantity*p_price;
										   int p_stock= rsProduct.getInt("stock");
									%>
									<!--(橫)商品內容、金額-->
									<div class="row" id="cartitle">
										<div class="col-md-4">
											<span>
												行程:<%=p_name%><br>
												出發日期:<%=date%><br>
												交通方式:<%=traffic%><br>
												人數:<%=quantity%>人<br>
											</span>
										</div>

										<div class="col-md-4">
											<span>
												<%=quantity%>人*NT.<%=(quantity*p_price)%>
											</span>
										
										</div>

									<div class="col-md-4">
										名額尚餘<%=p_stock%>位<br>
										<%
										   if(p_stock-quantity<0){
											   out.print("不足");
										   }
										   else
										   {
										   	   out.print("足夠");
										   }
										%>
										<form  method="get" action="../DeleteCar.jsp">
											<input type="hidden" name="dno" value="<%=no%>">
										    <button type="submit" class="btn btn-success" id="carbtn">
										        從購物車移除
										    </button>
									    </form>
									</div>
									
								  </div>
								
								<hr>
								<%}%>  
								<!--(橫)商品內容、金額end-->
						<!--(橫)總計標題、總計金額-->
						<div class="row" id="carsum">
							<div class="col-md-12">
								<h3 id="carsumfont">
								總計NT.<%=total%>
								</h3>
								
							</div>
							
						</div>
						
						<!--(橫)總計標題、總計金額end-->
						<%}%>
						<!--訂購人資訊區-->
						<div class="row" id="orderbg">
							<div class="col-md-12">
								<h3 >
									訂購人資訊</h3><br>
								<div class="row">
									<div class="col-md-12">
										<!--訂購人資訊表單集合-->
										<form method="POST" action="../order.jsp">
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">姓名</span>
												</div>
												<input type="text" name="name" class="form-control" placeholder="請輸入全名">&nbsp;&nbsp;
												<div class="input-group-prepend">
													<span class="input-group-text">出生年月日</span>
												</div>
												<input type="text" name="birth" class="form-control" placeholder="西元年/月/日">
												
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">手機</span>
												</div>
												<input type="text" name="phone" class="form-control" placeholder="請輸入手機號碼">&nbsp;&nbsp;
												
												<div class="input-group-prepend">
													<span class="input-group-text">身分證字號</span>
												</div>
												<input type="text" name="userid" class="form-control" placeholder="僅供Bon Vacances本次旅遊使用">
												
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text">居住地</span>
												</div>
												<input type="text" name="address" class="form-control" placeholder="請輸入正確地址以利收件">
											</div>
											
											<div class="form-check-inline">
												<div class="input-group-prepend">
													<span class="input-group-text">付款方式</span>&nbsp;&nbsp;
												</div>
												<label class="form-check-label">
													<input type="radio" name="payment" class="form-check-input" name="optradio" value="現金匯款">現金匯款
												</label>
											</div>
											<div class="form-check-inline">
												<label class="form-check-label">
													<input type="radio" name="payment" class="form-check-input" name="optradio" value="ATM轉帳">ATM轉帳
												</label>
											</div>
											<div class="form-check-inline disabled">
												<label class="form-check-label">
													<input type="radio" name="payment" class="form-check-input" name="optradio" value="Line Pay">Line Pay
												</label>
											</div>
											<button type="submit" class="btn btn-success">
											下單
											</button>
										</form>
										<!--訂購人資訊表單集合end-->
									</div>
									
									
								</div>
							</div>
						</div>
						<!--訂購人資訊區end-->
						<!--footer-->
						<div class="row">
							<div class="col-md-12">
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
						</div>
						<!--footer end-->
					</div>
					<!--整個購物車頁面內框架end-->
				</div>
				<!--整個購物車頁面end-->
			</div>
			<!--整個網頁end-->
		</body>
	</html>