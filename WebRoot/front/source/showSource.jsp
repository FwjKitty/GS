<%@ page language="java" import="java.util.*,beans.Users,beans.Questions,beans.Sources,dao.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<Sources> list_source = (List) request.getAttribute("list_source");
Users user = (Users)session.getAttribute("user");
int _page = Integer.parseInt((String)request.getAttribute("page"));
int count = Integer.parseInt((String)request.getAttribute("count"));
String kind = (String)request.getAttribute("kind");

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
  			<form class="form-horizontal" action="UserRegister" method="post" id="form_register">
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
        				<input type="text" id="vcodeRegister" placeholder="请输入右边的验证码" class="pull-left" name="vcode">
        				<img id="imgVcodeRegister" src="Valcode" align="absmiddle" class="pull-left" title="看不清，点击换一张 " onClick="this.src=this.src" style="margin:2px 0 0 5px;"/>
      					<br/><br/><span id="errorRegister" class="pull-left"></span>
      				</div>
    			</div>
    			<center>
  					<input id="registerButton" type="button" value="提交注册信息" class="btn btn-warning btn-primary">
  				</center>
  			</form>
  		</div>
  	</div>
 
	<div style=" width:100%; height:150px;"  ></div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<ul class="nav nav-tabs nav-stacked" >
					<li><a><h4 class="muted">数据库课程</h4></a></li>
					<li>
           				<a href="UserGetAllCourse?page=1&kind=mysql">MySOL</a>
           			</li>
           			<li>
           				<a href="UserGetAllCourse?page=1&kind=sqlserver">SQLServer</a>
           			</li>
           			<li>
           				<a href="UserGetAllCourse?page=1&kind=oracle">Oracle</a>
           			</li>
					<li><a><h4 class="muted">数据库资料</h4></a></li>
					<li class="">
           				<a href="UserGetAllSource?page=1&kind=mysql_source" data-toggle="modal">MySOL</a>
           			</li>
           			<li>
           				<a href="UserGetAllSource?page=1&kind=sqlserver_source" data-toggle="modal">SQLServer</a>
           			</li>
           			<li>
           				<a href="UserGetAllSource?page=1&kind=oracle_source" data-toggle="modal">Oracle</a>
           			</li>
					<li><a><h4 class="muted">其他资料</h4></a></li>
					<li><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
					<li><a href="#">Link</a></li>
				</ul>
			</div>
			<div class="span10">	
				<div class="row-fluid">
				<%
					Sources source = new Sources();
					for(int i=0; i<list_source.size(); i++){
						source = list_source.get(i);
						Users u = User.queryByUn(source.getUn());
				%>
					<div class="ih-item circle effect1">
						<a href="UserGetSource?kind=<%=kind %>">
							<div class="spinner"></div>
							<div class="img"><img src="<%=u.getHead() %>" alt="光数之家"></div>
							<div class="info">
								<div class="info-back">
									<h3><%=source.getFileName() %></h3>
									<p>111</p>
								</div>
							</div>
						</a>
					</div>
				<%} %>
				</div> 
				<div class="row-fluid">
					<ul class="pager pull-left">
						<li><a href="UserGetAllSource?page=<%=lastpage %>&kind=<%=kind %>">上一页</a></li>
						<li><a href="UserGetAllSource?page=<%=nextpage %>&kind=<%=kind %>">下一页</a></li>
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
		$("#loginButton").click(function(){
			$("#errorLogin").load("Checkcode",{vcode:$("#vcodeLogin").val(),operation:"login"});
			});
	});
	-->
	</script>
</body>
</html>