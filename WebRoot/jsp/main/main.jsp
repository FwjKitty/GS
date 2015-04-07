<%@ page language="java" import="java.util.*,beans.Users" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) session.getAttribute("user");
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
	<%
		if(null==user){
	%>
	<jsp:forward page="index.jsp" />
	<%} %>
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
				            <li class="divider-vertical active"><a href="jsp/main/index.jsp">首页</a></li>
				            <li class="divider-vertical"><a href="jsp/main/course_login.jsp">学习课程</a></li>
				            <li class="divider-vertical"><a href="">技术问答</a></li>
							<li class="divider-vertical"><a href="jsp/main/person.jsp">个人中心</a></li>
			          	</ul>
			        	<form class="navbar-search form-search">
					 		<div class="input-append">
			            		<input type="text" class=" search-query input-small" >
			            		<button type="submit" class="btn btn-inverse"><i class="icon-search icon-white"></i></button>
					 		</div>
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
	  
	
	   	<div class="row-fluid" style=" width:100%; height:600px;background-image:url(img/bg_1.png); background-repeat: repeat-x;">
			<div style=" width:100%; height:240px;"  ></div>
			<div class="span2"></div>
			<div class="span3" id="mid_title">
				<h1 "page-header">大数据<small>时代</small></h1>
		        <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;光数之家邀您加入<br>&nbsp;&nbsp;&nbsp;&nbsp;专业数据库学习平台，共享平台。</h5>
			</div>
			<div class="span12">	
				<div class="span2"></div>
				<div class="span4">
					<span class="badge">Mysql</span>
					<span class="badge badge-warning">数据库原理</span>
					<span class="badge badge-info">新手入门</span><br>
					<span class="badge badge-important">还有什么</span>
					<span class="badge badge-inverse">继续添加</span><br>
					<span class="badge badge-info">最好</span>
					<span class="badge badge-success">1</span>
					<span class="badge">Ml</span>
				</div>
			</div>
		</div>
		
		<div class="container marketing">
	      <!-- Three columns of text below the carousel -->
	      <div class="row">
	        <div class="span4">
	          <img class="img-circle" data-src="holder.js/140x140" alt="140x140" style="width: 140px; height: 140px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIwAAACMCAYAAACuwEE+AAADHklEQVR4Xu3XQU7qYABGUR2xMZbNmpgz0mDSiKTQXi2VkvOG8kl99z9p4f14PH68+afAzALvwMwsZfZVABgQUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLePNgDofD1ynu9/vR0xx7ffjZ8Au3fnfsDde+3rMR3TSYy4MfO/Sx168PfArA5YGtfb1nw3L+ezYN5vwfuHXg55/vdru30+n04w70FzD/cb1nQwPMxSNtwHQJ7fpxtzZQYBYucO8zyvkxNXVHGXt97M40/NlLX2/hHA9/u5e+w1zXmwPo3mNn6pH02+s9/JQXvMDLgrl1R5hzx6l3mLEPxsOH8KnrLXiWq7zVpsHM+Xp875vS9dfqqc8wS19vlRNe+CKbBrNwC283owAwMyKZfBcAhoZUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TL+BPn285fsB0YAAAAAAElFTkSuQmCC">
	          <h2>Heading</h2>
	          <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</p>
	          <p><a class="btn" href="#">View details »</a></p>
	        </div><!-- /.span4 -->
	        <div class="span4">
	          <img class="img-circle" data-src="holder.js/140x140" alt="140x140" style="width: 140px; height: 140px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIwAAACMCAYAAACuwEE+AAADHklEQVR4Xu3XQU7qYABGUR2xMZbNmpgz0mDSiKTQXi2VkvOG8kl99z9p4f14PH68+afAzALvwMwsZfZVABgQUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLePNgDofD1ynu9/vR0xx7ffjZ8Au3fnfsDde+3rMR3TSYy4MfO/Sx168PfArA5YGtfb1nw3L+ezYN5vwfuHXg55/vdru30+n04w70FzD/cb1nQwPMxSNtwHQJ7fpxtzZQYBYucO8zyvkxNXVHGXt97M40/NlLX2/hHA9/u5e+w1zXmwPo3mNn6pH02+s9/JQXvMDLgrl1R5hzx6l3mLEPxsOH8KnrLXiWq7zVpsHM+Xp875vS9dfqqc8wS19vlRNe+CKbBrNwC283owAwMyKZfBcAhoZUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TL+BPn285fsB0YAAAAAAElFTkSuQmCC">
	          <h2>Heading</h2>
	          <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
	          <p><a class="btn" href="#">View details »</a></p>
	        </div><!-- /.span4 -->
	        <div class="span4">
	          <img class="img-circle" data-src="holder.js/140x140" alt="140x140" style="width: 140px; height: 140px;" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIwAAACMCAYAAACuwEE+AAADHklEQVR4Xu3XQU7qYABGUR2xMZbNmpgz0mDSiKTQXi2VkvOG8kl99z9p4f14PH68+afAzALvwMwsZfZVABgQUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLGBgGUgFgUi5jYBhIBYBJuYyBYSAVACblMgaGgVQAmJTLePNgDofD1ynu9/vR0xx7ffjZ8Au3fnfsDde+3rMR3TSYy4MfO/Sx168PfArA5YGtfb1nw3L+ezYN5vwfuHXg55/vdru30+n04w70FzD/cb1nQwPMxSNtwHQJ7fpxtzZQYBYucO8zyvkxNXVHGXt97M40/NlLX2/hHA9/u5e+w1zXmwPo3mNn6pH02+s9/JQXvMDLgrl1R5hzx6l3mLEPxsOH8KnrLXiWq7zVpsHM+Xp875vS9dfqqc8wS19vlRNe+CKbBrNwC283owAwMyKZfBcAhoZUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TIGhoFUAJiUyxgYBlIBYFIuY2AYSAWASbmMgWEgFQAm5TL+BPn285fsB0YAAAAAAElFTkSuQmCC">
	          <h2>Heading</h2>
	          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
	          <p><a class="btn" href="#">View details »</a></p>
	        </div><!-- /.span4 -->
	      </div><!-- /.row -->
	    </div>
		
		<div class="row-fluid" style="width:100%; height:150px;"></div>
		
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
		<script src="js/bootstrap.minjs"></script>
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