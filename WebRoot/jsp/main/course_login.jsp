<%@ page language="java" import="java.util.*,beans.Users,beans.Questions,beans.Resources" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) session.getAttribute("user");
List<Questions> list_question = (List) session.getAttribute("list_question");
List<Resources> list_course = (List) session.getAttribute("list_course");
List<Resources> list_source = (List) session.getAttribute("list_source");
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
	<%
		if(null==user){
	%>
	<jsp:forward page="course.jsp" />
	<%} %>
	  <div class="container">
	  <div class="navbar navbar-inverse navbar-fixed-top">
	    <div class="row-fluid" style="filter:alpha(Opacity=90);-moz-opacity:0.9;opacity: 0.9;z-index:100;background-color: #151515 ">
		 <div class="span1"></div> 
		 <div class="span2"> 
	      <p id="logo">&nbsp;<a href="#">光数之家<br><small>raydata.com</small></a></p>
	    </div>
		<div class="span8">
		<br>
		  <a href="#" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	     <span class="icon-bar"></span>
	     <span class="icon-bar"></span>
	     <span class="icon-bar"></span>
	     </a>
	      <div class="nav-collapse">
	          <ul class="nav nav-pills">
	            <li class="divider-vertical"><a href="jsp/main/main.jsp">首页</a></li>
	            <li class="divider-vertical active"><a href="jsp/main/course_login.jsp">学习课程</a></li>
	            <li class="divider-vertical"><a href="">技术问答</a></li>
				<li class="divider-vertical"><a href="jsp/main/person.jsp">个人中心</a></li>
	          </ul>
	          <form class="navbar-search form-search">
			  	<div class="input-append">
	            	<input type="text" class=" search-query input-small" >
	            	<button type="submit" class="btn btn-inverse">
	            		<i class="icon-search icon-white"></i>
	            	</button>
			 	</div>
			  </form>
	          <ul class="nav pull-right">
	            <li><p>
	          		<a href="jsp/main/person.jsp">
	          			<img class="img-circle" data-src="holder.js/50x50" alt="50x50" style="width: 50px; height: 50px;" src="head/<%=user.getHead()%>">
	          		</a>
	          	</p></li>
	          	<li class="divider-vertical"></li>
	          	<li>
	          		<p><a href="jsp/main/person.jsp"><%=user.getUn()%></a></p>
	          		<p><a id="exit" style="cursor:pointer;"><small>退出登录</small></a></p>
	          	</li>
	          </ul>
			</div>
	      </div>
	    </div> 
	 </div> 
	</div>
	  
	 <!--注册-->  
	  <div class="modal hide fade" id="register">
		  <div class="modal-header">
			  <a href="#" class="close" data-dismiss="modal">×</a>
			  <h4>用户注册</h4>
		  </div>
		  <div class="modal-body">
		  	<form class="form-horizontal" action="AddUser?value=7&operation=registered" method="post">
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
	 			<center>
					<input type="submit" value="提交注册信息" class="btn btn-warning btn-primary">
				</center>
			</form>
		  </div>
	  </div> 
	 
	<div style=" width:100%; height:150px;"  ></div> 
	 <div class="row"> 
	  <!--左侧边栏-->
	<div class="tabbable tabs-left navbar-inverse span10 ">
	<ul class="nav nav-tabs well well-small">
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
	 <div class="span1"></div>
	 <div class="tab-content well">
	    <div class="tab-pane active " id="A" >
		<form class="form-horizontal" action="UpdateUser" method="post" enctype="multipart/form-data">
		    <input type="hidden" name="operation" value="person"/>
		    <input type="hidden" name="un" value="<%=user.getUn()%>"/>
		    <input type="hidden" name="pw" value="<%=user.getPw()%>"/>
		    <div class="control-group warning">
	      		<label class="control-label" ><strong>头像</strong></label>
	      		<%
	      			String head = "";
	      					if(user.getHead() != null){
	      						head = user.getHead();
	      					}
	      		%>
	      		<div class="controls">
	       			<input type="file" name="head">
	      		</div>
	      		<div class="controls">
	       			<input type="text" name="head" value="<%=head%>" readonly>
	      		</div>
	    	</div>
	    	<div class="control-group warning">
	      		<label class="control-label" ><strong>昵称</strong></label>
	      		<div class="controls">
	        		<input type="text" name="name" value="<%=user.getName()%>">
	      		</div>
	    	</div>
		    <div class="control-group warning">
	      		<label class="control-label" ><strong>联系方式</strong></label>
	      		<div class="controls" >
	        		<input type="text" name="contact" value="<%=user.getContact()%>">
	      		</div>
	    	</div>
	    	<div class="control-group warning">
	      		<label class="control-label" ><strong>简介</strong></label>
	      		<div class="controls" >
	        		<textarea rows="7" name="introduction"><%=user.getIntroduction()%></textarea>
	     	 	</div>
	    	</div>
			<div class="control-group">
				<div class="controls">
					<label class="radio">
	  					<input type="radio" name="sex" value="男" checked>男
	  				</label>
					<label class="radio">
	  					<input type="radio" name="sex" value="女">女
	  				</label>
	  			</div>
	   		</div>
	   		<input type="submit" class="btn btn-warning btn-primary pull-right" value="&nbsp;&nbsp;保存&nbsp;&nbsp;"/>
	  	</form>
		</div>
		
		
		<div class="tab-pane" id="B">
			<div class="tabbable"> <!-- Only required for left/right tabs -->
	  			<ul class="nav nav-tabs">
	    			<li class="active"><a href="#tabB1" data-toggle="tab">提问</a></li>
	    			<li><a href="#tabB2" data-toggle="tab">解答</a></li>
	  			</ul>
		 		<div class="tab-content">
		    		<div class="tab-pane active" id="tabB1">
	    			<%
	    				for(int i=0; i<list_question.size(); i++){
	    				    					Questions question = list_question.get(i);
	    			%>
		      			<p><%=i+1%>、<%=question.getQuestion()%></p>
		      		<%
		      			}
		      		%>
		    		</div>
		    		<div class="tab-pane" id="tabB2">
		      		<%
		      			for(int i=0; i<list_question.size(); i++){
		      			    					Questions question = list_question.get(i);
		      		%>
		      			<p><%=i+1%>、<%=question.getAnswer()%></p>
		      		<%
		      			}
		      		%>
		    		</div>
		  		</div>
			</div>
		</div>
		
		<div class="tab-pane" id="C">
			<div class="tabbable"> <!-- Only required for left/right tabs -->
				<ul class="nav nav-tabs">
				    <li class="active"><a href="#tabC1" data-toggle="tab">我的文件</a></li>
				    <li><a href="#tabC2" data-toggle="tab">我的课程</a></li>
					<li class="pull-right"><input class="btn" type="button" value="上传资料" data-toggle="modal" data-target="#load"/></li>
				</ul>
	  			<div class="tab-content">
	    			<div class="tab-pane active" id="tabC1">
	      			<%
	      				for(int i=0; i<list_source.size(); i++){
	      				    Resources source = list_source.get(i);
	      			%>
		      			<p><%=i+1%>、<%=source.getFileName()%></p>
		      		<%
		      			}
		      		%>
	    			</div>
	    			<div class="tab-pane" id="tabC2">
	      				<div class="tab-pane active" id="tabC1">
		      			<%
		      				for(int i=0; i<list_course.size(); i++){
		      					Resources course = list_course.get(i);
		      			%>
			      			<p><%=i+1 %>、<%=course.getFileName()%></p>
			      		<% } %>
		    			</div>
	    			</div>
	  			</div>
			</div>
			<!--资料上传-->
		 	<div class="modal hide fade" id="load">
				<div class="modal-header">
					<a href="#" class="close" data-dismiss="modal">×</a>
					<h4>资料上传</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="AddResource" method="post" enctype="multipart/form-data">
						<div class="control-group warning">
						<label class="control-label">File input</label>
			 				<div class="controls">
								<input type="file" name="filename" />
							</div>
			 			</div>
			 			<div class="control-group warning">
			 				<label class="control-label"><strong>资源类别</strong></label>
			 				<div class="controls">
								<input type="radio" name="kind" value="MySql"/>MySql<br/>
								<input type="radio" name="kind" value="SQLServer"/>SQLServer<br/>
								<input type="radio" name="kind" value="Oracle"/>Oracle<br/>
							</div>
			 			</div>
			 			<div class="control-group warning">
			   				<label class="control-label" ><strong>用户</strong></label>
			   				<div class="controls" >
			     				<input type="text" placeholder="请输入您的名称" name="un" />
			   				</div>
			 			</div>
			 			<div class="pull-right">
							<input type="submit" value="确认上传" class="btn btn-warning btn-primary" />
							<input type="button" value="取消" class="btn" data-dismiss="modal" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="span1"></div>
	<div class="span2">
	<div class="thumbnail">
	    <img data-src="holder.js/300x200" alt="300x200" style="width: 300px; height: 200px;" src="head/<%=head %>">
	    <div class="caption">
	    	<%
	    		String name = "";
	    		if(user.getName() == null){
	    			name = "昵称";
	    		}else{
	    			name = user.getName();
	    		}
	    	 %>
	      <h3><%=name %></h3>
	    </div>
	</div>
	</div>
	</div> 
	  
		<div class="row-fluid" style="width:100%; height:200px;"></div>
		
		<div class="row-fluid" style="width:100%; height:150px;background-color: #151515">
		<div class="span1"></div>
		<div class="span4">
		<address>
		  <strong><br>
		  Copyright © 2009 - 2014 raydata.com All Rights Reversed.<br>
		  京ICP备11018032号-7 京公网安备11010802013056<br>
		  <abbr title="Phone">P:</abbr> (123) 456-7890
		  </strong>
		</address>
		  <address>
		  <strong>Full Name</strong><br>
		  <a href="mailto:#">first.last@example.com</a>
		  </address>
		</div>
		<div class="span7"></div>
		
		</div>
		<script src="js/jquery-2.1.1.min.js"></script> 
		<script src="js/bootstrap.js"></script>
		<script>
		<!--
			$("#exit").click(function(){
				if(confirm("您确认要退出当前用户?")){
					window.location.href="jsp/main/index.jsp";
				}
			});
		-->
		</script>
	</body>
</html>