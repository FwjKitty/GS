<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="modal hide fade" id="addQuestion">
	<div class="modal-header">
		<a href="#" class="close" data-dismiss="modal">×</a>
		<h4>添加问答</h4>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" action="Add_Question" method="post">
 			<div class="control-group warning">
   				<label class="control-label" ><strong>问题</strong></label>
   				<div class="controls">
     				<textarea rows="4" name="question"></textarea>
   				</div>
 			</div>
 			<div class="control-group warning">
	 			<label class="control-label"><strong>答案</strong></label>
	 			<div class="controls">
					<textarea rows="5" name="answer"></textarea>
				</div>
 			</div>
 			<div class="control-group warning">
   				<label class="control-label" ><strong>用户</strong></label>
   				<div class="controls" >
     				<input type="text" name="un">
   				</div>
 			</div>
 			<div class="control-group warning">
   				<label class="control-label" ><strong>解答者</strong></label>
   				<div class="controls" >
     				<input type="text" name="admin">
   				</div>
 			</div>
 			<center>
				<input type="submit" value="确认添加" class="btn btn-warning btn-primary">
			</center>
		</form>
	</div>
</div>