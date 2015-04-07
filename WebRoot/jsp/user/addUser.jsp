<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="modal hide fade" id="addUser">
	<div class="modal-header">
		<a href="#" class="close" data-dismiss="modal">×</a>
		<h4>添加用户</h4>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" action="AddUser?operation=add" method="post">
			<input type="hidden" name="value" value="8"/>
 			<div class="control-group warning">
   				<label class="control-label" ><strong>名称</strong></label>
   				<div class="controls">
     				<input type="text" placeholder="请在此输入您的用户名" name="un">
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
				<input type="submit" value="确认添加" class="btn btn-warning btn-primary">
			</center>
		</form>
	</div>
</div>