<%@ page language="java" import="java.util.*,beans.Users,beans.Questions,beans.Sources" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) session.getAttribute("user");
List<Sources> list_source = (List)request.getAttribute("list_source");
List<Questions> list_question = (List)request.getAttribute("list_question");
%>

<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath %>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>光数之家</title>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.css" rel="stylesheet"><!--响应式-->
	<link rel="stylesheet" href="css/index.css" media="screen" type="text/css" />
	<!--[if lt IE 9]>
	      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="row-fluid" style="filter:alpha(Opacity=90);-moz-opacity:0.9;opacity: 0.9;z-index:100;background-color: #151515 ">
			<div class="span1"></div> 
			<div class="span2"> 
				<a class="brand" href="#"><img src="img/logo.png" width=100%></a>
			</div>
			<div class="span8"><br>
				<a href="#" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<div class="nav-collapse">
					<ul class="nav pull-left">
						<li class="divider-vertical"><a href="Main">首页</a></li>
          				<li class="divider-vertical active"><a href="UserGetAllGuideCourse?page=1&name=mysql">学习课程</a></li>
          				<li class="divider-vertical"><a href="UserGetAllQuestion?page=1">技术问答</a></li>
		  				<li class="divider-vertical"><a href="UserGetPerson">个人中心</a></li>
       				</ul>
					<form class="navbar-search ">
						<input type="text" class="search-query span10" placeholder="Search">
					</form>
					<ul class="nav pull-right">
            			<li><p><a href="jsp/main/person.jsp">
          					<img class="img-circle" data-src="holder.js/50x50" alt="50x50" style="width: 50px; height: 50px;" src="head/<%=user.getHead() %>">
          				</a></p></li>
          				<li class="divider-vertical"></li>
          				<li>
          					<p><a href="jsp/main/person.jsp"><%=user.getUn() %></a></p>
          					<p><a id="exit" style="cursor:pointer;"><small>退出登录</small></a></p>
          				</li>
    				</ul>
				</div>
			</div>
		</div>
		<div class="span1"></div> 
	</div>
	  
	<!--注册-->  
  	<div class="modal hide fade" id="register">
  		<div class="modal-header">
  			<a href="#" class="close" data-dismiss="modal">×</a>
  			<h4>用户注册</h4>
  		</div>
  		<div class="modal-body">
  			<form class="form-horizontal" action="UserRegister" method="post">
    			<div class="control-group">
      				<label class="control-label" ><strong>邮箱帐号</strong></label>
      				<div class="controls">
        				<input type="text" placeholder="请在此输入您的E-Mail" name="un">
      				</div>
    			</div>
    			<div class="control-group">
      				<label class="control-label" ><strong>密码</strong></label>
      				<div class="controls" >
        				<input type="password" placeholder="请在此输入您的密码" name="pw">
      				</div>
    			</div>
    			<div class="control-group">
      				<label class="control-label" ><strong>确认密码</strong></label>
      				<div class="controls" >
        				<input type="password" placeholder="请再次确认您的密码" name="pw2">
      				</div>
    			</div>
    			<center>
  					<input type="submit" value="提交注册信息" class="btn">
  				</center>
  			</form>
  		</div>
  	</div>
	 
	<div style=" width:100%; height:150px;"  ></div> 
	<div class="container"> 
		<div class="row-fluid"> 
			<!--左侧边栏-->
			<div class="tabs-left ">
				<div class="span2">
					<ul class="nav nav-tabs nav-stacked">
						<li class="active">
							<a href="#A" data-toggle="tab">详细信息</a>
						</li>
						<li>
							<a href="#B" data-toggle="tab">我的问答</a>
						</li>
						<li>
							<a href="#C" data-toggle="tab">文件仓库</a>
						</li>
					</ul>
				</div>
				<div class="tab-content span10">
					<div class="tab-pane active" id="A" >
						<div class="row-fluid ">
							<div class="span7">
								<div class="span1"></div>
								<div class="span5">
								<img class="img-circle pull-left" data-src="holder.js/50x50" alt="光数" style="width:200px;height:200px;margin-bottom:10px;" src="<%=user.getHead() %>">
								</div>
								<div class="span6">
								<p class="lead muted">简介：<strong><%=user.getContact() %></strong></p>
								</div>
							</div>
							<div class="span5">
								<blockquote >
								<p class="lead muted">昵称：<strong><%=user.getName() %></strong></p>
								<p class="lead muted">邮箱：<strong><%=user.getUn() %></strong></p>
								<p class="lead muted">联系方式：<strong><%=user.getContact() %></strong></p>
								<p class="lead muted">性别：<strong></strong></p>
								</blockquote>
							</div>
						</div>
						<div class="accordion text-center" id="accordion2">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle lead" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
										修改资料
									</a>
								</div>
								<div id="collapseOne" class="accordion-body collapse in">
									<div class="accordion-inner">
										<form action="UserUpdatePerson" enctype="mulitypart/form-data" method="post"><br/>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											头像：<input type="file" class="span4 search-query" name="head"><br/><br/>
											<input type="hidden" name="head" />
											<input type="text" name="name" class="span4 search-query" placeholder="呢称" /><br/><br/>
											<input type="text" name="un" class="span4 search-query" placeholder="Email" /><br/><br/>
											<input type="text" name="contact" class="span4 search-query" placeholder="手机号码" /><br/><br/>
											<input type="text" name="introduction" class="span4 search-query" placeholder="个人简介" /><br/><br/>
											<select class="span2" >
												<option>男</option>
												<option>女</option>
											</select><br>
											<button class="btn btn-danger" type="submit">确认修改</button>
										</form>
									</div>
								</div>
							</div>  
						</div>
					</div>
					<div class="tab-pane" id="B">
						<div class="tabbable"> <!-- Only required for left/right tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab">提问</a></li>
								<li><a href="#tab2" data-toggle="tab">解答</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tab1">
									<table class="table table-bordered table-striped table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>问题标题</th>
												<th>发表日期</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Mark</td>
												<td>Otto</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td>Mark</td>
												<td>Otto</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>1</td>
												<td>Larry the Bird</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>1</td>
												<td>Larry the Bird</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="pagination pull-right">
										<ul>
											<li><a href="#">Prev</a></li>
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</div>
								<div class="tab-pane" id="tab2">
								   <table class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>问题标题</th>
												<th>发表日期</th>
												<th>发表日期</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Mark</td>
												<td>Otto</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td>Mark</td>
												<td>Otto</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>1</td>
												<td>Larry the Bird</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>1</td>
												<td>Larry the Bird</td>
												<td>
													<button class="btn btn-small" type="button">查看</button>
													<button class="btn btn-danger btn-small" type="button">删除</button>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="pagination pull-right">
										<ul>
											<li><a href="#">Prev</a></li>
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="C">
						<div class="tabbable"> <!-- Only required for left/right tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#ta1" data-toggle="tab">我的文件</a></li>
								<li><a href="#ta2" data-toggle="tab">我的课程</a></li>
								<button class="btn pull-right" type="file">上传</button>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="ta1">
									<table class="table table-striped table-hover">
									  <thead>
										<tr>
										  <th>#</th>
										  <th>我的文件</th>
										  <th>发表日期</th>
										   <th>审核状态</th>
										  <th>操作</th>
										</tr>
									  </thead>
									  <tbody>
										<tr>
										  <td>1</td>
										  <td>Mark</td>
										  <td>Otto</td>
										  <td>Otto</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-success  btn-small" type="button">共享</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											 <button class="btn btn-inverse btn-small" type="button">下载</button>
											</td>
										</tr>
										<tr>
											<td>1</td>
										  <td>Mark</td>
										  <td>Otto</td>
										  <td>Otto</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-success  btn-small" type="button">共享</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											 <button class="btn btn-inverse btn-small" type="button">下载</button>
											</td>
										</tr>
										<tr>
										  <td>2</td>
										  <td>Jacob</td>
										  <td>Otto</td>
										  <td>Thornton</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-success  btn-small" type="button">共享</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											 <button class="btn btn-inverse btn-small" type="button">下载</button>
											</td>
										</tr>
										<tr>
										  <td>3</td>
											<td>1</td>
											<td>Otto</td>
										  <td>Larry the Bird</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-success  btn-small" type="button">共享</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											 <button class="btn btn-inverse btn-small" type="button">下载</button>
											</td>
										</tr>
										  <tr>
										  <td>3</td>
											<td>1</td>
											<td>Otto</td>
										  <td>Larry the Bird</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											<button class="btn btn-success  btn-small" type="button">共享</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											  <button class="btn btn-inverse btn-small" type="button">下载</button>
											</td>
										</tr>
									  </tbody>
									</table>
									<div class="pagination pull-right">
										<ul>
											<li><a href="#">Prev</a></li>
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</div>
								<div class="tab-pane" id="ta2">
									<table class="table table-striped table-hover">
									  <thead>
										<tr>
										  <th>#</th>
										  <th>我的视频</th>
										  <th>观看日期</th>
										  <th>操作</th>
										</tr>
									  </thead>
									  <tbody>
										<tr>
										  <td>1</td>
										  <td>Mark</td>
										  <td>Otto</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											</td>
										</tr>
										<tr>
											<td>1</td>
										  <td>Mark</td>
										  <td>Otto</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											</td>
										</tr>
										<tr>
										  <td>2</td>
										  <td>Jacob</td>
										  <td>Thornton</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											</td>
										</tr>
										<tr>
										  <td>3</td>
											<td>1</td>
										  <td>Larry the Bird</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											</td>
										</tr>
										  <tr>
										  <td>3</td>
											<td>1</td>
										  <td>Larry the Bird</td>
										  <td>
											 <button class="btn btn-small" type="button">查看</button>
											 <button class="btn btn-danger btn-small" type="button">删除</button>
											</td>
										</tr>
									  </tbody>
									</table>
									<div class="pagination pull-right">
										<ul>
											<li><a href="#">Prev</a></li>
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!--row-fluid-->
	</div><!--container-fluid-->
	  
	<!-- footer -->
	<%@include  file="../footer.jsp"%>
	<!-- footer end -->
	<script src="js/jquery-2.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>
	<script>
	<!--
	$(function(){
		$(".section ul li .rsp").hide();
		$(".section	 ul li").hover(function(){
			$(this).find(".rsp").stop().fadeTo(500,0.5)
			$(this).find(".text").stop().animate({left:'0'}, {duration: 500})
		},function(){
			$(this).find(".rsp").stop().fadeTo(500,0)
			$(this).find(".text").stop().animate({left:'318'}, {duration: "fast"})
			$(this).find(".text").animate({left:'-318'}, {duration: 0})
		});
		$("#exit").click(function(){
			if(confirm("您确认要退出当前用户?")){
				window.location.href="Exit";
			}
		});
		$("#registerButton").click(function(){
			$('#imgVcodeRegister').src=$('#imgVcodeRegister').src;
			alert($('#imgVcodeRegister').src);
			$("#errorRegister").load("Checkcode",{vcode:$("#vcodeRegister").val(),operation:"register"});
			});
		$(".modmore").hover(function(){
			  $(this).find("span").stop().animate({top: '100px'},200);
			},function(){
			  $(this).find("span").stop().animate({top: '260px'},200);
			});
	});
	-->
	</script>
</body>
</html>