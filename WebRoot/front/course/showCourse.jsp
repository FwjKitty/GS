<%@ page language="java" import="java.util.*,beans.Users,beans.Courses" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<Courses> list_course = (List) request.getAttribute("list_course");
int _page = Integer.parseInt((String)request.getAttribute("page"));
int count = Integer.parseInt((String)request.getAttribute("count"));

	int nextpage ;
	int lastpage ;
	int finalpage=count/10+1;
	if(_page==1){
	lastpage=1;
	}else lastpage=_page-1;
	 if(finalpage==_page){
	nextpage=_page;
	}else nextpage=_page+1;
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
	      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<style type="text/css">
	</style>
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
          				<li class="divider-vertical"><a href="#login" data-toggle="modal">技术问答</a></li>
		  				<li class="divider-vertical"><a href="#login" data-toggle="modal">个人中心</a></li>
       				</ul>
					<form class="navbar-search ">
						<input type="text" class="search-query span10" placeholder="Search">
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
  
  	<!--用户登录--> 
 	<div class="modal hide fade" id="login">
  		<div class="modal-header">
 			<a href="#" class="close" data-dismiss="modal">×</a>
  			<h4>用户登录</h4>
  		</div>
  		<div class="modal-body">
  			<form class="form-horizontal" action="UserLogin" method="post" id="form_login">
    			<div class="control-group">
      				<label class="control-label" ><strong>用户名</strong></label>
      				<div class="controls">
        				<input type="text" placeholder="请在此输入您的用户名" name="un">
      				</div>
    			</div>
    			<div class="control-group">
      				<label class="control-label" ><strong>密码</strong></label>
      				<div class="controls">
        				<input type="password" placeholder="请在此输入您的密码" name="pw">
      				</div>
    			</div>
    			<div class="control-group">
      				<label class="control-label" ><strong>验证码</strong></label>
      				<div class="controls" >
        				<input type="text" id="vcodeLogin" placeholder="请输入右边的验证码" class="pull-left" name="vcode">
        				<img src="Valcode" align="absmiddle" class="pull-left" title="看不清，点击换一张 " onClick="this.src=this.src+'?'" style="margin:2px 0 0 5px;"/>
      					<br/><br/><span id="errorLogin" class="pull-left"></span>
      				</div>
    			</div>
				<center>
  					<input id="loginButton" type="button" class="btn" value="&nbsp;&nbsp;登录&nbsp;&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<a href="#register" data-toggle="modal" class="btn">&nbsp;&nbsp;注册&nbsp;&nbsp;</a>
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
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<ul class="nav nav-tabs nav-stacked" >
					<li><a href="#"><h4 class="muted">数据库课程</h4></a></li>
					<li>
           				<a href="UserGetAllCourse?page=1&kind=mysql">MySOL</a>
           			</li>
           			<li>
           				<a href="UserGetAllCourse?page=1&kind=sqlserver">SQLServer</a>
           			</li>
           			<li>
           				<a href="UserGetAllCourse?page=1&kind=oracle">Oracle</a>
           			</li>
					<li ><a href="#"><h4 class="muted">数据库资料</h4></a></li>
					<li class="">
           				<a href="#login" data-toggle="modal">MySOL</a>
           			</li>
           			<li>
           				<a href="#login" data-toggle="modal">SQLServer</a>
           			</li>
           			<li>
           				<a href="#login" data-toggle="modal">Oracle</a>
           			</li>
					<li ><a href="#"><h4 class="muted">其他资料</h4></a></li>
					<li><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
				</ul>
			</div>
			<div class="span10">	
				<div class="row-fluid">
				<%
					Courses course = new Courses();
					for(int i=0; i<list_course.size(); i++){
						course = list_course.get(i);
				%>
					<div class="ih-item circle effect1">
						<a href="">
							<div class="spinner"></div>
							<div class="img"><img src="<%=course.getImage() %>" alt="光数之家"></div>
							<div class="info">
								<div class="info-back">
									<h3><%=course.getName() %></h3>
									<p><%=course.getIntroduction() %></p>
								</div>
							</div>
						</a>
					</div>
				<%} %>
				</div> 
				<div class="row-fluid">
					<ul class="pager pull-left">
						<li><a href="UserGetAllCourse?page=<%=lastpage %>&kind=<%=course.getName() %>">上一页</a></li>
						<li><a href="UserGetAllCourse?page=<%=nextpage %>&kind=<%=course.getName() %>">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>	
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
		$("#registerButton").click(function(){
			$('#imgVcodeRegister').src=$('#imgVcodeRegister').src;
			alert($('#imgVcodeRegister').src);
			$("#errorRegister").load("Checkcode",{vcode:$("#vcodeRegister").val(),operation:"register"});
			});
		$("#loginButton").click(function(){
			$("#errorLogin").load("Checkcode",{vcode:$("#vcodeLogin").val(),operation:"login"});
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