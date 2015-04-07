<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="modal hide fade" id="addNotice">
	<div class="modal-header">
		<a href="#" class="close" data-dismiss="modal">×</a>
		<h4>添加公告</h4>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" action="AddNotice" method="post">
 			<div class="control-group warning">
   				<label class="control-label" ><strong>标题</strong></label>
   				<div class="controls">
     				<input type="text" class="span3" placeholder="请在此输入标题" name="title">
   				</div>
 			</div>
 			<div class="control-group warning">
   				<label class="control-label" ><strong>内容</strong></label>
   				<div class="controls" >
     				<textarea rows="7" class="span3" placeholder="请在此输入公告内容..." name="content"></textarea> 
   				</div>
 			</div>
 			<center>
				<input type="submit" value="确认添加" class="btn btn-warning btn-primary">
			</center>
		</form>
	</div>
</div>