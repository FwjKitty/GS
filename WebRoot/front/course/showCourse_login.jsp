<%@ page language="java" import="java.util.*,beans.Users,beans.Courses,beans.Sources" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) session.getAttribute("user");
List<Courses> list_course = (List) request.getAttribute("list_course");
List<Sources> list_source = (List) request.getAttribute("list_source");
%>

<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
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
<body style="background-color:#E0DFE1;">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="row-fluid" style="filter:alpha(Opacity=90);-moz-opacity:0.9;opacity:0.9;z-index:100;background-color:#151515;">
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
		  				<li class="divider-vertical"><a href="UserGetPerson?title=person">个人中心</a></li>
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
  			<form class="form-horizontal" action="UserRegister" method="post" id="form_register" onsubmit="return RSARegister()">
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
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
				<ul class="nav nav-tabs nav-stacked" >
					<li><a><h4 class="muted">数据库资料</h4></a></li>
					<li class="">
           				<a href="UserGetAllSource?page=1&kind=mysql_source" target="_blank">MySOL</a>
           			</li>
           			<li>
           				<a href="UserGetAllSource?page=1&kind=sqlserver_source" target="_blank">SQLServer</a>
           			</li>
           			<li>
           				<a href="UserGetAllSource?page=1&kind=oracle_source" target="_blank">Oracle</a>
           			</li>
				</ul>
				<ul class="nav nav-tabs nav-stacked" >
					<li><a><h4 class="muted">相关资料</h4></a></li>
           			<%
						Sources source = new Sources();
						for(int i=0; i<list_source.size(); i++){
							source = list_source.get(i);
					%>
					<li class="">
           				<a href="front/documentViewer.jsp?filename=<%=source.getFileName() %>" target="_blank"><%=i+1 + ". " +source.getTitle() %></a>
           			</li>
					<%} %>
				</ul>
			</div>
		<div class="span10">
			<div class="span11">
				<object id="video1" data="<%=list_course.get(0).getFileName()%>" width="100%" height="500px">
					<embed src="<%=list_course.get(0).getFileName() %>" id="video2" title="光数之家" width="100%" height="500px" />
				</object>
			</div>
			<div class="span1">
				<div class="bshare-custom">
					<ul class="pull-left">
						<li><a title="分享到QQ空间" class="bshare-qzone"></a></li>
						<li><a title="分享到新浪微博" class="bshare-sinaminiblog"></a></li>
						<li><a title="分享到人人网" class="bshare-renren"></a></li>
						<li><a title="分享到腾讯微博" class="bshare-qqmb"></a></li>
						<li><a title="分享到网易微博" class="bshare-neteasemb"></a></li>
						<li><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a></li>
						<li><span class="BSHARE_COUNT bshare-share-count">0</span></li>
					</ul>
				</div>
			</div>
			<div class="span12" style="margin-left:0;">
			<div class="span11">
				<h3>相关课程</h3>
				<table width="100%" class="table table-hover">
				<%
					Courses course = new Courses();
					for(int i=0; i<list_course.size(); i++){
						course = list_course.get(i);
				%>
					<tr height="30px">
						<td><a style="text-decoration:none;cursor:pointer;" onclick="changeMP4('<%=i %>')"><%=i+1 + "、" %><%=course.getTitle() %></a></td>
						<input type="hidden" id="<%=i %>" value="<%=course.getFileName() %>"/>
						<td><a href="UserDownload?filename=<%=course.getFileName() %>" class="btn btn-danger btn-small">下载</a></td>
					</tr>
				<%} %>
				</table>
			</div>
			</div>
			<div class="span11" style="margin-left:0;">
				<script type="text/javascript" charset="utf-8" src="js/course/buttonLite.js"></script>
				<script type="text/javascript" charset="utf-8" src="js/course/bshareC0.js"></script>
				<br>
				<div id="demo" style="OVERFLOW:hidden;WIDTH:100%;COLOR:#ffffff;HEIGHT:100px;" onmousemove="MoveDiv(event);" onmouseout="MoveOutDiv();">
					<div id="demo1" style="width:100%;">
						<TABLE cellSpacing=0 cellPadding=0>
							<TBODY>
								<TR vAlign=top>
									<TD vAlign=top noWrap>
										<DIV align=right>
											<a href="http://www.baidu.com"><img src="img/membership_seminar.jpg"></a> 
											<a href="http://www.baidu.com"><img src="img/pwpsoftcover.jpg"> </a> 
											<a href="http://www.baidu.com"><img src="img/rhemacards.jpg"> </a> 
											<a href="http://www.baidu.com"><img src="img/traks_classes.jpg"> </a> 
											<a href="http://www.baidu.com"><img src="img/citycompschool.jpg"> </a> 
											<a href="http://www.baidu.com"><img src="img/citykidssite.jpg"> </a> 
											<a href="http://www.baidu.com"><img src="img/gc-general.jpg"> </a> 
											<a href="http://www.baidu.com"><img src="img/groups.jpg"></a> 
										</DIV>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
						<TABLE>
							<TR><TD width="0">
								<div id="demo2" style="width:100%;"></div>
							</TD></TR>
						</TABLE>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- footer -->
	<%@include  file="../footer.jsp"%>
	<!-- footer end -->
	<script src="js/jquery-2.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>
	<script src="js/course/lunbo.js"></script>
	<!-- RSA -->
	<script type="text/javascript" src="js/RSA/RSA.js"></script>
	<script type="text/javascript" src="js/RSA/BigInt.js"></script>
	<script type="text/javascript" src="js/RSA/Barrett.js"></script>
	<script>
	<!--
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
		function changeMP4(val_obj){
			var obj1 = document.getElementById("video1");
			var obj2 = document.getElementById("video2");
			var obj3 = document.getElementById(val_obj);
			obj1.data = obj3.value;
			obj2.src = obj3.value;
		}
		document.getElementById("demo2").innerHTML = document.getElementById("demo1").innerHTML;
		MyMar=setInterval(Marquee,speed);
	-->
	</script>
	</body>
</html>