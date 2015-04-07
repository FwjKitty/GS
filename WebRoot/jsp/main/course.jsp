<%@ page language="java" import="java.util.*,beans.Users" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>光数之家</title>
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/bootstrap-responsive.css" rel="stylesheet"><!--响应式-->
		<link rel="stylesheet" href="css/index.css" media="screen" type="text/css" />
		<!--[if lt IE 9]>
		      <script src="http://html5shim.googlegcode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>

	<body>
	  	<div class="container">
	  	<div class="navbar navbar-inverse navbar-fixed-top">
		    <div class="row-fluid" style="filter:alpha(Opacity=90);-moz-opacity:0.9;opacity: 0.9;z-index:100;background-color: #151515 ">
			 	<div class="span1"></div> 
			 	<div class="span2">
		      		<p id="logo">&nbsp;&nbsp;<a href="jsp/index.jsp">光数之家<br><small>raydata.com</small></a></p>
		   		</div>
				<div class="span8"><br>
			 		 <a href="#" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		     			<span class="icon-bar"></span>
		     			<span class="icon-bar"></span>
		     			<span class="icon-bar"></span>
		     		</a>
			      	<div class="nav-collapse">
			          	<ul class="nav nav-pills">
				            <li class=divider-vertical"><a href="jsp/main/index.jsp">首页</a></li>
				            <li class="divider-vertical active"><a href="jsp/main/course_login.jsp">学习课程</a></li>
				            <li class="divider-vertical"><a href="#login" data-toggle="modal">技术问答</a></li>
							<li class="divider-vertical"><a href="#login" data-toggle="modal">个人中心</a></li>
			          	</ul>
			        	<form class="navbar-search form-search">
					 		<div class="input-append">
			            		<input type="text" class="search-query input-small" >
			            		<button type="submit" class="btn btn-inverse"><i class="icon-search icon-white"></i></button>
					 		</div>
					 	</form>
			         	 <ul class="nav pull-right">
			            	<li><a href="#login" data-toggle="modal">登录</a></li>
			            	<li class="divider-vertical"></li>
			            	<li><a href="#register" data-toggle="modal">注册</a></li>
			          	</ul>
					</div>
		    	</div>
			</div>
		 	<div class="span1"></div> 
		</div> 
		</div>
	  
	 	<!--用户登录--> 
	 	<div class="modal hide fade" id="login">
	  		<div class="modal-header">
	 			<a href="#" class="close" data-dismiss="modal">×</a>
	  			<h4>用户登录</h4>
	  		</div>
	  		<div class="modal-body">
	  			<form class="form-horizontal" action="QueryByUn?operation=login" method="post">
	    			<div class="control-group warning">
	      				<label class="control-label" ><strong>用户名</strong></label>
	      				<div class="controls">
	        				<input type="text" placeholder="请在此输入您的用户名" name="un">
	      				</div>
	    			</div>
	    			<div class="control-group warning">
	      				<label class="control-label" ><strong>密码</strong></label>
	      				<div class="controls">
	        				<input type="password" placeholder="请在此输入您的密码" name="pw">
	      				</div>
	    			</div>
					<center>
	  					<input type="submit" class="btn btn-warning btn-primary" value="&nbsp;&nbsp;登录&nbsp;&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  					<a href="#register" data-toggle="modal" class="btn btn-warning btn-primary">&nbsp;&nbsp;注册&nbsp;&nbsp;</a>
	  				</center>
	  			</form>
	  		</div>
	  	</div>
	  	 
	 	<!--注册-->  
	  	<div class="modal hide fade" id="register">
	  		<div class="modal-header">
	  			<a href="#" class="close" data-dismiss="modal">×</a>
	  			<h4>用户注册</h4>
	  		</div>
	  		<div class="modal-body">
	  			<form class="form-horizontal" action="AddUser?operation=registered" method="post">
	    			<div class="control-group warning">
	      				<label class="control-label" ><strong>邮箱帐号</strong></label>
	      				<div class="controls">
	        				<input type="text" placeholder="请在此输入您的E-Mail" name="un">
	      				</div>
	    			</div>
	    			<div class="control-group warning">
	      				<label class="control-label" ><strong>密码</strong></label>
	      				<div class="controls" >
	        				<input type="password" placeholder="请在此输入您的密码" name="pw">
	      				</div>
	    			</div>
	    			<div class="control-group warning">
	      				<label class="control-label" ><strong>确认密码</strong></label>
	      				<div class="controls" >
	        				<input type="password" placeholder="请再次确认您的密码" name="pw2">
	      				</div>
	    			</div>
	    			<div class="control-group warning">
	      				<label class="control-label" ><strong>验证码</strong></label>
	      				<div class="controls" >
	        				<input type="text" placeholder="" name="test">请输入下面的验证码
	        				<label>abcd</label>
	      				</div>
	    			</div>
	    			<center>
	  					<input type="submit" value="提交注册信息" class="btn btn-warning btn-primary">
	  				</center>
	  			</form>
	  		</div>
	  	</div> 
	  
		<script src="js/jquery-2.1.1.min.js"></script> 
		<script src="js/bootstrap.js"></script>
	</body>
</html>