<%@ page language="java" import="java.util.*,beans.Users,beans.Descriptions" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) session.getAttribute("user");
List<Descriptions> list_description = (List)request.getAttribute("list_description");

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
		          	<ul class="nav nav-pills">
			            <li class="divider-vertical active"><a href="Main">首页</a></li>
			            <li class="divider-vertical"><a href="UserGetAllGuideCourse?page=1&name=mysql">学习课程</a></li>
			            <li class="divider-vertical"><a href="UserGetAllQuestion?page=1">技术问答</a></li>
						<li class="divider-vertical"><a href="UserGetPerson">个人中心</a></li>
		          	</ul>
		        	<form class="navbar-search ">
						<input type="text" class="search-query span10" placeholder="Search">
					</form>
		         	 <ul class="nav pull-right">
			            <li><p>
			          		<a href="jsp/main/person.jsp">
			          			<img class="img-circle" data-src="holder.js/50x50" alt="50x50" style="width: 50px; height: 50px;" src="head/<%=user.getHead() %>">
			          		</a>
			          	</p></li>
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
  					<input type="submit" value="提交注册信息" class="btn" />
  				</center>
  			</form>
  		</div>
  	</div> 
  
   	<div class="row-fluid" >
		<div id="myCarousel" class="carousel slide ">  
			<ol class="carousel-indicators">  
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>  
				<li data-target="#myCarousel" data-slide-to="1"></li>  
				<li data-target="#myCarousel" data-slide-to="2"></li>  
			</ol>  
			<!-- Carousel items -->  
			<div class="carousel-inner">  
				<div class="active item"><img src="img/s1.png" ></div>  
				<div class="item"><img src="img/s2.png" ></div>  
				<div class="item"><img src="img/s3.png"></div>  
			</div>  
			<!-- Carousel nav -->  
			<a class="carousel-control left" href="#myCarousel" data-slide="prev"><</a>  
			<a class="carousel-control right" href="#myCarousel" data-slide="next">></a>  
		</div>  
	</div>
	
	<div class="container">
		<!-- Three columns of text below the carousel -->
		<center><img src="img/kc.png" style="width:8%;"></center>
		<div class="row-fluid">
		<%
			Descriptions description = new Descriptions();
			for(int i=0; i<list_description.size(); i++){
				description = list_description.get(i);
			
		%>
			<div class="ih-item circle effect1">
				<a href="UserGetAllGuideCourse?page=1&name=<%=description.getName() %>">
					<div class="spinner"></div>
					<div class="img">
						<img src="<%=description.getImage() %>" alt="<%=description.getName() %>">
					</div>
					<div class="info">
						<div class="info-back">
							<h3><%=description.getName() %></h3>
							<p><%=description.getInfo() %></p>
						</div>
					</div>
				</a>
			</div>
		<%} %>
		</div><!-- /.row -->
	</div>
	
	<!-- footer -->
	<%@include  file="footer.jsp"%>
	<!-- footer end -->
	<script src="js/jquery-2.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>
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
	});
	-->
	</script>
</body>
</html>