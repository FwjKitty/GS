<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="modal hide fade" id="addsqlserver_source">
	<div class="modal-header">
		<a href="#" class="close" data-dismiss="modal">×</a>
		<h4>添加软件</h4>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" action="AddResource" method="post" enctype="multipart/form-data">
			<input type="hidden" value="sqlserver_source" name="kind"/>
			<input type="hidden" value="add" name="operation"/>
 			<div class="control-group warning">
 				<label class="control-label">File input</label>
 				<div class="controls">
					<input type="file" name="filename" />
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