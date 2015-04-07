<%@ page language="java" import="java.util.*,beans.Resources" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String id = (String) request.getAttribute("id");
String kind = (String) request.getAttribute("kind");
Resources resource = (Resources) request.getAttribute("resource");
%>

<!DOCTYPE HTML>
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
    <div class="modal" id="addW">
		<div class="modal-header">
			<h4>修改资料&nbsp;&nbsp;<small><%=resource.getFileName() %></small></h4>
		</div>
		<div class="modal-body">
			<form class="form-horizontal" action="Update_VWS" method="post" enctype="multipart/form-data">
	 			<input type="hidden" name="id2" value="<%=id %>" />
	 			<input type="hidden" name="kind" value="<%=kind %>" />
	 			<div class="control-group warning">
	 				<label class="control-label">File input</label>
	 				<div class="controls">
						<input type="file" name="filename" />
					</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>用户</strong></label>
	   				<div class="controls" >
	     				<input type="text" name="un" value="<%=resource.getUn() %>">
	   				</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>时间</strong></label>
	   				<div class="controls" >
	     				<input type="text" name="time" value="<%=resource.getTime() %>">
	   				</div>
	 			</div>
	 			<div class="pull-right">
					<input type="submit" value="确认上传" class="btn btn-warning btn-primary" />
					<a href="Admin"><input type="button" value="取消" class="btn"/></a>
				</div>
			</form>
		</div>
	</div>
  </body>
</html>