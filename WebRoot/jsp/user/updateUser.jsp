<%@ page language="java" import="java.util.*,beans.Users" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users) request.getAttribute("user");
String un = (String) request.getAttribute("un");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>后台管理</title>
    <base href="basePath">
	<meta charset="UTF-8" />
	<link href="css/bootstrap.css" rel="stylesheet"/>
	<link href="css/bootstrap-responsive.css" rel="stylesheet"/>
	<link rel="stylesheet" href="css/admin.css"/>
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
  </head>
  
  <body>
    <div class="modal" id="addUser">
		<div class="modal-header inline">
			<h4>
				<input type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;" class="pull-right btn btn-warning btn-primary" onclick="history.go(-1)">
				修改用户&nbsp;&nbsp;<small><%=un %></small>&nbsp;&nbsp;的资料
			</h4>
		</div>
		<div class="modal-body">
			<form class="form-horizontal" action="UpdateUser" method="post" enctype="multipart/form-data">
				<input type="hidden" name="un2" value="<%=un %>"/>
				<input type="hidden" name="operation" value="admin_update"/>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>名称</strong></label>
	   				<div class="controls">
	     				<input type="text" name="un" value="<%=user.getUn() %>">
	   				</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>密码</strong></label>
	   				<div class="controls" >
	     				<input type="text" name="pw" value="<%=user.getPw() %>">
	   				</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>头像</strong></label>
	   				<div class="controls" >
	   					<%
	   						String head = "";
	   						if(user.getHead() != null){
	   							head = user.getHead();
	   						}
	   					 %>
	     				<input type="file" name="head" value="<%=head %>">
	   				</div>
	   				<div class="controls" >
	     				<input type="text" name="head" value="<%=head %>" disabled>
	   				</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>呢称</strong></label>
	   				<div class="controls" >
	   					<%
	   						String name = "";
	   						if(user.getName() != null){
	   							name = user.getName();
	   						}
	   					 %>
	     				<input type="text" name="name" value="<%=name %>">
	   				</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>联系方式</strong></label>
	   				<div class="controls" >
	   					<%
	   						String contact = "";
	   						if(user.getContact() != null){
	   							contact = user.getContact();
	   						}
	   					 %>
	     				<input type="text" name="contact" value="<%=contact %>">
	   				</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>简介</strong></label>
	   				<div class="controls" >
	   					<%
	   						String introduction = "";
	   						if(user.getIntroduction() != null){
	   							introduction = user.getIntroduction();
	   						}
	   					 %>
	     				<input type="text" name="introduction" value="<%=introduction %>">
	   				</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>时间</strong></label>
	   				<div class="controls" >
	     				<input type="text" name="time" value="<%=user.getTime() %>">
	   				</div>
	 			</div>
	 			<center>
					<input type="submit" value="&nbsp;&nbsp;确认修改&nbsp;&nbsp;" class="btn btn-warning btn-primary">
				</center>
			</form>
		</div>
	</div>
  </body>
</html>
