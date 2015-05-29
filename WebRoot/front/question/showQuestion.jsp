<%@ page language="java" import="java.util.*,beans.Users,beans.Questions,dao.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) session.getAttribute("user");
List<Questions> list_question = (List) request.getAttribute("list_question");
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
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
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
          				<li class="divider-vertical"><a href="UserGetAllGuideCourse?page=1&name=mysql">学习课程</a></li>
          				<li class="divider-vertical active"><a href="UserGetAllQuestion?page=1">技术问答</a></li>
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
  	
  	<!--提问--> 
 	<div class="modal hide fade" id="question" style="width:50%;margin-right:0;">
  		<div class="modal-header">
 			<a href="#" class="close" data-dismiss="modal">×</a>
  			<h4>提问</h4>
  		</div>
  		<div class="modal-body">
  			<form class="form-horizontal" action="UserAddQuestion" method="post">
      			<textarea name="question" class="span6"	rows="20"></textarea>
      			<br/>
				<center>
  					<input type="submit" class="btn" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<a href="#" data-dismiss="modal" class="btn">&nbsp;&nbsp;取消&nbsp;&nbsp;</a>
  				</center>
  			</form>
  		</div>
  	</div>
 
	<div style="width:100%;height:100px;"></div> 
	<div class="container-fluid">
		<div class="row-fluid">
 			<div class="span1"></div>
			<div class="span10">
				<div class="span12">
					<div class="span2"></div>
					 <div class="span8 form-search">
	    				<div class="input-append">
	    					<input type="text" class="search-query input-xxlarge" id="qt"/>
							<button id="searchQuestion" class="btn">Search</button>
						</div>
					</div>
	 				<div class="span2">
	 					<a href="#question" data-toggle="modal" class="btn pull-right btn-danger">
	 						我要提问
	 					</a>
	 				</div>
	 			</div>
	 			<div id="result_question">
	 			<div class="span12" style="margin-top:15px;"></div>
				<%
				Questions question = new Questions();
				for(int i=0; i<list_question.size(); i++){
					question = list_question.get(i);
					Users u = User.queryByUn(question.getUn());
				%>
				<div class="span12" style="margin-top:15px;">
					<div class="pull-left span1" style="text-align:center;">
						<a href="#" style="text-decoration:none;">
		                	<img style="width:50px;height:50px;" class="img-circle"  src="<%=u.getHead() %>">
		              		<br/><%=u.getName() %>
		              	</a>
	                </div>
		   			<div class="span11 pull-left thumbnail wt">
						<a id="wenti" href="UserGetQuestion?id=<%=question.getId() %>">
	      					<h4><%=question.getQuestion() %></h4>
	      					<p class="muted"><%=question.getTime() %></p>
	    				</a>
	    			</div>
    			</div>
	       		<%} %>
	  			<!--分页-->
		  		<div class="span12">
	 				<div class="pagination">
	 					共<%=count %>条记录/当前第<%=_page %>/<%=(count+9)/10%> 页<br/><br/>
						<ul>
					    	<li><a href="UserGetAllQuestion?page=1">First</a></li>
					    	<li><a href="UserGetAllQuestion?page=<%=lastpage %>">Prev</a></li>
					    	<li><a href="UserGetAllQuestion?page=<%=nextpage %>">Next</a></li>
					    	<li><a href="UserGetAllQuestion?page=<%=finalpage %>">Final</a></li>
					    </ul>
					</div>
		  		</div>
		  		</div>
	  		</div>
   			<div class="span1"></div>
   		</div>
	</div>
	<!-- footer -->
	<%@include  file="../footer.jsp"%>
	<!-- footer end -->
	<script src="js/jquery-2.1.1.min.js"></script> 
	<script src="js/bootstrap.min.js"></script>
	<script src="js/searchQuestion.js"></script>
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