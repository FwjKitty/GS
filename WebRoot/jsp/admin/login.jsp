<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>光束之家--后台登陆</title>
	<meta charset="UTF-8" />
	<link href="css/bootstrap.min.css" rel="stylesheet"/>
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="css/admin.css"/>
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script language="javascript">
		function check() {
			if (form.un.value == "") {
				alert("帐号不能为空");
				form.title.focus();
				return false;
			} else if (form.pw.value == "") {
				alert("密码不能为空");
				form.content.focus();
				return false;
			} else {
				return true;
			}
		}
	</script>
  </head>
  <body background="img/bg_AdminLogin.jpg">
  	<div class="modal" style="top:30%;left:30%;">
  		<div class="modal-header">
  			<h4><strong>光束之家--后台登陆</strong></h4>
  		</div>
  		<div class="modal-body">
  			<form class="form-horizontal" action="AdminLogin" method="post" name="form" onsubmit="check()">
    			<div class="control-group warning">
      				<label class="control-label" ><strong>用户名</strong></label>
      				<div class="controls">
        				<input type="text" placeholder="请在此输入您的用户名" name="un">
      				</div>
    			</div>
    			<div class="control-group warning">
      				<label class="control-label" ><strong>密码</strong></label>
      				<div class="controls">
        				<input type="password" placeholder="请在此输入您的密码" name="pw">
      				</div>
    			</div>
    			<div class="control-group warning">
      				<div class="controls">
        				<input type="radio" name="value" value="1" checked>教师
        				<input type="radio" name="value" value="2">管理员
      				</div>
    			</div>
				<center>
  					<input type="submit" class="btn btn-warning btn-primary" value="&nbsp;&nbsp;登录&nbsp;&nbsp;">
  				</center>
  			</form>
  		</div>
  	</div>
  </body>
</html>