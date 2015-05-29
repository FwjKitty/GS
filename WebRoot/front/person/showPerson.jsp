<%@ page language="java" import="java.util.*,beans.Users" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) session.getAttribute("user");
%>

<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
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
          				<li class="divider-vertical"><a href="UserGetAllGuideCourse?page=1&name=mysql">学习课程</a></li>
          				<li class="divider-vertical"><a href="UserGetAllQuestion?page=1">技术问答</a></li>
		  				<li class="divider-vertical active"><a href="UserGetPerson?title=person">个人中心</a></li>
       				</ul>
					<form class="navbar-search ">
						<input type="text" class="search-query span10" placeholder="Search">
					</form>
					<ul class="nav pull-right">
            			<li><p><a href="jsp/main/person.jsp">
          					<img class="img-circle" data-src="holder.js/50x50" alt="50x50" style="width: 50px; height: 50px;" src="<%=user.getHead() %>">
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
  			<form class="form-horizontal" action="UserRegister" method="post" onsubmit="return RSARegister()" id="form_register">
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
	 
	<div style="width:100%;height:150px;"></div> 
	<div class="container"> 
		<div class="row-fluid"> 
			<!--左侧边栏-->
			<div class="span2">
				<ul class="nav nav-tabs nav-stacked">
					<li class="active">
						<a href="UserGetPerson?title=person">详细信息</a>
					</li>
					<li>
						<a href="UserGetPerson?page=1&title=question">我的问答</a>
					</li>
					<li>
						<a href="UserGetPerson?page=1&title=resource">文件仓库</a>
					</li>
				</ul>
			</div>
			<div class="span10">
				<div class="row-fluid ">
					<div class="span7">
						<div class="span1"></div>
						<div class="span5">
						<img class="img-circle pull-left" data-src="holder.js/50x50" alt="光数" style="width:200px;height:200px;margin-bottom:10px;" src="<%=user.getHead() %>">
						</div>
						<div class="span6">
						<p class="lead muted">学历：<strong><%=user.getEducation() %></strong></p>
						<p class="lead muted">简介：<strong><%=user.getIntroduction() %></strong></p>
						</div>
					</div>
					<div class="span5">
						<blockquote >
						<p class="lead muted">昵称：<strong><%=user.getName() %></strong></p>
						<p class="lead muted">帐号：<strong><%=user.getUn() %></strong></p>
						<p class="lead muted">联系方式：<strong><%=user.getContact() %></strong></p>
						<p class="lead muted">性别：<strong><%=user.getSex() %></strong></p>
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
								<form action="UserUpdatePerson" enctype="multipart/form-data" method="post"><br/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									头像：<input type="file" class="span4 search-query" name="head"><br/><br/>
									<input type="hidden" name="head" />
									<input type="text" name="name" class="span4 search-query" placeholder="呢称" /><br/><br/>
									<input type="text" name="un" class="span4 search-query" placeholder="Email" /><br/><br/>
									<input type="text" name="contact" class="span4 search-query" placeholder="手机号码" /><br/><br/>
									<input type="text" name="education" class="span4 search-query" placeholder="学历" /><br/><br/>
									<textarea type="text" name="introduction" class="span4 search-query" placeholder="个人简介" rows="10"></textarea><br/><br/>
									<select class="span2" name="sex">
										<option value="男">男</option>
										<option value="女" selected>女</option>
									</select><br>
									<button class="btn btn-danger" type="submit">确认修改</button>
								</form>
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
	<!-- RSA -->
	<script type="text/javascript" src="js/RSA/RSA.js"></script>
	<script type="text/javascript" src="js/RSA/BigInt.js"></script>
	<script type="text/javascript" src="js/RSA/Barrett.js"></script>
	<script>
	<!--
	$(function(){
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
		var key;
		function RSARegister(){
			var register = document.getElementById("form_register");
			if (register.un.value == "") {
				alert("帐号不能为空");
				register.un.focus();
				return false;
			} else if (register.pw.value == "") {
				alert("密码不能为空");
				register.pw.focus();
				return false;
			} else if (register.pw2.value == "") {
				alert("密码不能为空");
				register.pw2.focus();
				return false;
			} else {
				if(register.pw.value == register.pw2.value){
					bodyRSA();
					register.pw.value = encryptedString(key, encodeURIComponent(register.pw.value));
					return true;
				}else{
					alert("密码不一致");
					return false;
				}
			}
		}
	});
	-->
	</script>
</body>
</html>