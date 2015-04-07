<%@ page language="java" import="java.util.*,beans.Questions" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Questions question = (Questions) request.getAttribute("question");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>后台管理</title>
	<meta charset="UTF-8" />
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="css/admin.css"/>
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
  </head>
  
  <body>
    <div class="modal" id="updateQuestion">
		<div class="modal-header">
			<h4>修改问答</h4>
		</div>
		<div class="modal-body">
			<form class="form-horizontal" action="UpdateQuestion?id=<%=question.getId() %>" method="post">
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>问题</strong></label>
	   				<div class="controls">
	     				<textarea rows="4" name="question"><%=question.getQuestion() %></textarea>
	   				</div>
	 			</div>
	 			<div class="control-group warning">
		 			<label class="control-label"><strong>答案</strong></label>
		 			<div class="controls">
						<textarea rows="5" name="answer"><%=question.getAnswer() %></textarea>
					</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>用户</strong></label>
	   				<div class="controls" >
	     				<input type="text" name="un" value="<%=question.getUn() %>">
	   				</div>
	 			</div>
	 			<div class="control-group warning">
	   				<label class="control-label" ><strong>解答者</strong></label>
	   				<div class="controls" >
	     				<input type="text" name="admin" value="<%=question.getAdmin() %>">
	   				</div>
	 			</div>
	 			<center>
					<input type="submit" value="提交" class="btn btn-warning btn-primary">
				</center>
			</form>
		</div>
	</div>
  </body>
</html>
