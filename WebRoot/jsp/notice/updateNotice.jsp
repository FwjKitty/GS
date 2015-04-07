<%@ page language="java" import="java.util.*,beans.Notices" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Notices notice = (Notices) request.getAttribute("notice");
String title = (String) request.getAttribute("title");
%>
<!DOCTYPE html>
<html>
	<head>
		<title>后台管理</title>
		<meta charset="UTF-8" />
		<link href="css/bootstrap.css" rel="stylesheet"/>
		<link href="css/bootstrap-responsive.css" rel="stylesheet"/>
		<link rel="stylesheet" href="css/admin.css"/>
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body>
		<div class="modal" id="updateNotice">
			<div class="modal-header">
				<h4>
					<input type="button" value="&nbsp;&nbsp;取消&nbsp;&nbsp;" class="pull-right btn btn-warning btn-primary" onclick="history.go(-1)">
					修改公告
				</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" action="UpdateNotice?title2=<%=title %>" method="post">
		 			<div class="control-group warning">
		   				<label class="control-label" ><strong>标题</strong></label>
		   				<div class="controls">
		     				<input type="text" class="span3" name="title" value="<%=notice.getTitle() %>">
		   				</div>
		 			</div>
		 			<div class="control-group warning">
		   				<label class="control-label" ><strong>内容</strong></label>
		   				<div class="controls" >
		     				<textarea rows="7" class="span3" name="content"><%=notice.getContent() %></textarea> 
		   				</div>
		 			</div>
		 			<div class="control-group warning">
		   				<label class="control-label" ><strong>时间</strong></label>
		   				<div class="controls">
		     				<input type="text" class="span3" name="time" value="<%=notice.getTime() %>">
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