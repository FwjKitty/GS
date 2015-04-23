<%@ page language="java" import="java.util.*,beans.Users,beans.Questions" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) session.getAttribute("user");
List<Questions> list_question = (List) request.getAttribute("list_question");
%>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>光数之家</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet"><!--响应式-->
	<link rel="stylesheet" href="css/index.css" media="screen" type="text/css" />
	<!--[if lt IE 9]>
	      <script src="http://html5shim.googlegcode.com/svn/trunk/html5.js"></script>
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
          					<img class="img-circle" data-src="holder.js/50x50" alt="光数" style="width: 50px; height: 50px;" src="head/<%=user.getHead() %>">
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
 
	<div style=" width:100%; height:100px;"  ></div> 
	<div class="container-fluid">
		<div class="row-fluid">
 				<div class="span1"></div>
			<div class="span10">
   				<div class="row-fluid">
    				<div class="span3"></div>
					 <div class="span6">
						<form class="form-search">
		    				<div class="input-append">
		    					<input type="text" class="search-query input-xxlarge"/>
								<button type="submit" class="btn">Search</button>
							</div>
						</form>
					</div>
	 				<div class="span3 ">
	 					<button class="btn pull-right btn-danger " type="button">我要提问</button>
	 				</div>
    			</div>
				<div class="row-fluid">
				<%
					Questions question = new Questions();
					for(int i=0; i<list_question.size(); i++){
						question = list_question.get(i);
				%>
          			<div class="span3 thumbnail wt">	
		   				<a id="wenti" href="UserGetQuestion?<%=question.getId() %>">
             				<h4><%=question.getQuestion() %></h4>
             				<p class="muted"><%=question.getTime() %></p>
           				</a>
           			</div>
           		<%} %>
         		</div>
	  			<!--分页-->	  
 				<div class="pagination">
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
   			<div class="span1"></div>
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