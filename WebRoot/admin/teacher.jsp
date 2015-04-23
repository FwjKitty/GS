<%@ page language="java" import="java.util.*,dao.*,beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Admins admin = (Admins) request.getAttribute("admin");
session.setAttribute("admin",admin);
List<Notices> list_notice = (List) request.getAttribute("list_notice");
List<Users> list_user = (List) request.getAttribute("list_user");
List<Resources> list_mysql_course = (List) request.getAttribute("list_mysql_course");
List<Resources> list_mysql_source = (List) request.getAttribute("list_mysql_source");
List<Resources> list_sqlserver_course = (List) request.getAttribute("list_sqlserver_course");
List<Resources> list_sqlserver_source = (List) request.getAttribute("list_sqlserver_source");
List<Resources> list_oracle_course = (List) request.getAttribute("list_oracle_course");
List<Resources> list_oracle_source = (List) request.getAttribute("list_oracle_source");
//List<Questions> list_question = (List) request.getAttribute("list_question");
%>

<!DOCTYPE html>
<html>
	<head>
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
		<!-- 导航 -->
		<div class="container">
			<div id="nav" class="navbar navbar-inverse navbar-fixed-top">
				<div class="row-fluid" style="filter:alpha(Opacity=90);-moz-opacity:0.9;opacity: 0.9;z-index:100;background-color: #151515 ">
					<div class="span1"></div> 
					<div class="span2">
						<p id="logo">&nbsp;&nbsp;<a href="#">光数之家<small>后台</small><br><small>raydata.com管理</small></a></p>
					</div>
					<div class="span8">
						<br>
						<a href="#" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							 <span class="icon-bar"></span>
							 <span class="icon-bar"></span>
							 <span class="icon-bar"></span>
						</a>
						<div class="nav-collapse">
							<ul class="nav nav-pills">
								<li class="active divider-vertical"><a href="#notices" onclick="display($('#notices'))">公告管理</a></li>
								<li class="divider-vertical"><a href="#users" onclick="display($('#users'))">用户管理</a></li>
								<li class="divider-vertical"><a href="#mysql_courses" onclick="display($('#mysql_courses'))">MySql课程管理</a></li>
								<li class="divider-vertical"><a href="#sqlserver_courses" onclick="display($('#sqlserver_courses'))">SQLServer课程管理</a></li>
								<li class="divider-vertical"><a href="#oracle_courses" onclick="display($('#oracle_courses'))">Oracle课程管理</a></li>
								<li class="divider-vertical"><a href="#mysql_sources" onclick="display($('#mysql_sources'))">MySql资料管理</a></li>
								<li class="divider-vertical"><a href="#sqlserver_sources" onclick="display($('#sqlserver_sources'))">SQLServer资料管理</a></li>
								<li class="divider-vertical"><a href="#oracle_sources" onclick="display($('#oracle_sources'))">Oracle资料管理</a></li>
								<li class="divider-vertical"><a href="#questions" onclick="display($('#questions'))">问答管理</a></li>
							</ul>
						</div>
					</div>
					<div class="span1"></div>
				</div>
			</div>
			
			<!-- 内容 -->
			<div class="row-fluid"><!-- id="content" -->
				<div></div>
				<!-- 公告管理 -->
				<div id="notices" class="span12" >
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>公告管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>title</th>
								<th>content</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<%
			        		for(int i=0;i<list_notice.size();i++){
			        			Notices notice =new Notices(); //新建对象
			        			notice = list_notice.get(i);
			        	%>
			    		
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
				    		<td class="span3">
				    			<%=notice.getTitle()%>
					    	</td> 
					    	<td class="span5">
				    			<%=notice.getContent()%>
					    	</td> 
					    	<td class="span2">
					    		<%=notice.getTime()%>
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteNotice?title=<%=notice.getTitle()%>" title="<%=notice.getTitle()%>">
					    			删除
					    		</a>
					    		<a href="QueryByTitle?title=<%=notice.getTitle()%>" title="<%=notice.getTitle()%>">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		
			    		<%
			    			}
			    		%>
			    		<tr>
			    			<td colspan="5">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addNotice" data-toggle="modal">
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
	      		
				<!-- 用户管理 -->
				<div id="users" class="span12">
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>用户管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>userName</th>
								<th>password</th>
								<th>contact</th>
								<th>name</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<%
			        		for(int i=0;i<list_user.size();i++){
			        			Users user =new Users(); //新建对象
			        			user = list_user.get(i);
			        	%>
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
				    		<td class="span2">
				    			<%=user.getUn()%>
					    	</td>
					    	<td class="span2">
				    			<%=user.getPw()%>
					    	</td>
					    	<td class="span2">
				    			<%=user.getContact()%>
					    	</td>
					    	<td class="span2">
				    			<%=user.getName()%>
					    	</td>
					    	<td class="span2">
					    		<%=user.getTime()%>
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteUser?un=<%=user.getUn()%>" title="<%=user.getUn()%>">
					    			删除
					    		</a>
					    		<a href="QueryByUn?un=<%=user.getUn()%>&operation=admin_update" title="<%=user.getUn()%>">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		<%
			    			}
			    		%>
			    		<tr>
			    			<td colspan="7">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addUser" data-toggle="modal" >
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
			
				<!-- 课程管理--mysql -->
				<div id="mysql_courses" class="span12">
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>MySql课程管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>filename</th>
								<th>username</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<%
			        		for(int i=0;i<list_mysql_course.size();i++){
			        			Resources mysql_course =new Resources(); //新建对象
			        			mysql_course = list_mysql_course.get(i);
			        	%>
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
					    	<td class="span6">
				    			<%=mysql_course.getFileName()%>
					    	</td> 
					    	<td class="span2">
					    		<%=mysql_course.getUn()%>
					    	</td>
					    	<td class="span2">
					    		<%=mysql_course.getTime()%>
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteResource?id=<%=mysql_course.getId()%>&kind=mysql_course" title="<%=mysql_course.getFileName()%>">
					    			删除
					    		</a>
					    		<a href="QueryByName?id=<%=mysql_course.getId()%>&kind=mysql_course" title="<%=mysql_course.getFileName()%>">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		<%
			    			}
			    		%>
			    		<tr>
			    			<td colspan="7">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addmysql_course" data-toggle="modal">
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
				
				<!-- 课程管理--sqlserver -->
				<div id="sqlserver_courses" class="span12">
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>SQLServer课程管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>filename</th>
								<th>username</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<%
			        		for(int i=0;i<list_sqlserver_course.size();i++){
			        		               Resources sqlserver_course =new Resources(); //新建对象
			        		               sqlserver_course = list_sqlserver_course.get(i);
			        	%>
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
					    	<td class="span6">
				    			<%=sqlserver_course.getFileName()%>
					    	</td> 
					    	<td class="span2">
					    		<%=sqlserver_course.getUn()%>
					    	</td>
					    	<td class="span2">
					    		<%=sqlserver_course.getTime()%>
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteResource?id=<%=sqlserver_course.getId()%>&kind=sqlserver_course" title="<%=sqlserver_course.getFileName()%>">
					    			删除
					    		</a>
					    		<a href="QueryByName?id=<%=sqlserver_course.getId()%>&kind=sqlserver_course" title="<%=sqlserver_course.getFileName()%>">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		<%
			    			}
			    		%>
			    		<tr>
			    			<td colspan="7">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addsqlserver_course" data-toggle="modal">
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
				
				<!-- 课程管理--oracle -->
				<div id="oracle_courses" class="span12" >
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>Oracle课程管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>filename</th>
								<th>username</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<%
			        		for(int i=0;i<list_oracle_course.size();i++){
			        		               Resources oracle_course =new Resources(); //新建对象
			        		               oracle_course = list_oracle_course.get(i);
			        	%>
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
					    	<td class="span6">
				    			<%=oracle_course.getFileName()%>
					    	</td> 
					    	<td class="span2">
					    		<%=oracle_course.getUn()%>
					    	</td>
					    	<td class="span2">
					    		<%=oracle_course.getTime()%>
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteResource?id=<%=oracle_course.getId()%>&kind=oracle_course" title="<%=oracle_course.getFileName()%>">
					    			删除
					    		</a>
					    		<a href="QueryByName?id=<%=oracle_course.getId()%>&kind=oracle_course" title="<%=oracle_course.getFileName()%>">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		<%}%>
			    		<tr>
			    			<td colspan="7">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addoracle_course" data-toggle="modal">
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
	      		
	      		<!-- 资料管理--mysql -->
				<div id="mysql_sources" class="span12">
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>MySql课程管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>filename</th>
								<th>username</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<%
			        		for(int i=0;i<list_mysql_source.size();i++){
			        		               Resources mysql_source =new Resources(); //新建对象
			        		               mysql_source = list_mysql_source.get(i);
			        	%>
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
					    	<td class="span6">
				    			<%=mysql_source.getFileName()%>
					    	</td> 
					    	<td class="span2">
					    		<%=mysql_source.getUn()%>
					    	</td>
					    	<td class="span2">
					    		<%=mysql_source.getTime()%>
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteResource?id=<%=mysql_source.getId()%>&kind=mysql_source" title="<%=mysql_source.getFileName()%>">
					    			删除
					    		</a>
					    		<a href="QueryByName?id=<%=mysql_source.getId()%>&kind=mysql_source" title="<%=mysql_source.getFileName()%>">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		<%
			    			}
			    		%>
			    		<tr>
			    			<td colspan="7">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addmysql_source" data-toggle="modal">
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
				
				<!-- 资料管理--sqlserver -->
				<div id="sqlserver_sources" class="span12">
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>SQLServer课程管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>filename</th>
								<th>username</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<%
			        		for(int i=0;i<list_sqlserver_source.size();i++){
			        		               Resources sqlserver_source =new Resources(); //新建对象
			        		               sqlserver_source = list_sqlserver_source.get(i);
			        	%>
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
					    	<td class="span6">
				    			<%=sqlserver_source.getFileName()%>
					    	</td> 
					    	<td class="span2">
					    		<%=sqlserver_source.getUn()%>
					    	</td>
					    	<td class="span2">
					    		<%=sqlserver_source.getTime()%>
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteResource?id=<%=sqlserver_source.getId()%>&kind=sqlserver_source" title="<%=sqlserver_source.getFileName()%>">
					    			删除
					    		</a>
					    		<a href="QueryByName?id=<%=sqlserver_source.getId()%>&kind=sqlserver_source" title="<%=sqlserver_source.getFileName()%>">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		<%
			    			}
			    		%>
			    		<tr>
			    			<td colspan="7">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addsqlserver_source" data-toggle="modal">
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
				
				<!-- 资料管理--oracle -->
				<div id="oracle_sources" class="span12" >
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>Oracle资料管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>filename</th>
								<th>username</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<%
			        		for(int i=0;i<list_oracle_source.size();i++){
			        		               Resources oracle_source =new Resources(); //新建对象
			        		               oracle_source = list_oracle_source.get(i);
			        	%>
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
					    	<td class="span6">
				    			<%=oracle_source.getFileName()%>
					    	</td> 
					    	<td class="span2">
					    		<%=oracle_source.getUn()%>
					    	</td>
					    	<td class="span2">
					    		<%=oracle_source.getTime()%>
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteResource?id=<%=oracle_source.getId()%>&kind=oracle_source" title="<%=oracle_source.getFileName()%>">
					    			删除
					    		</a>
					    		<a href="QueryByName?id=<%=oracle_source.getId()%>&kind=oracle_source" title="<%=oracle_source.getFileName()%>">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		<%}%>
			    		<tr>
			    			<td colspan="7">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addoracle_source" data-toggle="modal">
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
	      		
	      		<!-- 问答管理 -->
				<div id="questions" class="span12" >
					<section class="page-header">
						<hr/><hr/><hr/><hr/><hr/>
						<h1><strong>问答管理</strong></h1>
					</section>
					<table class="table table-striped table-bordered border-condensed">
						<thead>
							<tr>
								<th>
				                  <input class="check-all" type="checkbox"/>
				                </th>
								<th>question</th>
								<th>answer</th>
								<th>un</th>
								<th>admin</th>
								<th>time</th>
								<th>operation</th>
							</tr>
						</thead>
			        	<% /*      	        	   
			    		   for(int i=0;i<list_question.size();i++){
			               Questions question =new Questions(); //新建对象
			               question = list_question.get(i); */
			    		%>
			    		<tr>
			    			<td class="span1">
			                  <input type="checkbox"/>
			                </td>
				    		<td class="span2">
				    			
					    	</td>
					    	<td class="span3">
				    			
					    	</td> 
					    	<td class="span2">
					    		
					    	</td>
					    	<td class="span1">
				    			
					    	</td> 
					    	<td class="span2">
					    		
					    	</td>
					    	<td class="span1">
					    		<a href="DeleteQuestion?id=" title="">
					    			删除
					    		</a>
					    		<a href="QueryById?id=" title="">
					    			修改
					    		</a>
					    	</td>
			    		</tr>
			    		
			    		<tr>
			    			<td colspan="7">
			    				<input class="check-all" type="checkbox"/>&nbsp;全选&nbsp;&nbsp;&nbsp;
			    				<a href="#">删除所选</a>
			    				<a href="#addQuestion" data-toggle="modal">
			    					<button class="btn pull-right">添加</button>
			    				</a>
			    			</td>
			    		</tr>
		      		</table>
	      		</div>
			</div>
		</div>
		
		<!--添加用户-->
		<jsp:include page="../user/addUser.jsp" />
		
		<!--添加公告-->
		<jsp:include page="../notice/addNotice.jsp" />
		
		<!--添加课程、资源-->
		<jsp:include page="../resource/addmysql_course.jsp" />
		<jsp:include page="../resource/addmysql_source.jsp" />
		<jsp:include page="../resource/addsqlserver_course.jsp" />
		<jsp:include page="../resource/addsqlserver_source.jsp" />
		<jsp:include page="../resource/addoracle_course.jsp" />
		<jsp:include page="../resource/addoracle_source.jsp" />
		
		<!--添加公告-->
		<jsp:include page="../question/addQuestion.jsp" />
		</div>
	</div>	
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery-1.3.2.min.js"></script>
	<script>
	<!--
		// Check all checkboxes when the one in a table head is checked:
		$('.check-all').click(
			function(){
				$(this).parent().parent().parent().parent().find("input[type='checkbox']").attr('checked', $(this).is(':checked'));   
			}
		);
		
		function hide_all(){
			//$('#notices').hide();
			//$('#videos').hide();
			//$('#words').hide();
			//$('#softs').hide();
			//$("#users").hide();
			$('#notices').css("display","none");
			$('#users').css("display","none");
			$('#mysql_courses').css("display","none");
			$('#mysql_sources').css("display","none");
			$('#sqlserver_sources').css("display","none");
			$('#sqlserver_courses').css("display","none");
			$('#oracle_sources').css("display","none");
			$('#oracle_courses').css("display","none");
			$('#questions').css("display","none");
		}
		
		function display(id){
			hide_all();
			id.show();
			//id.css("dispaly","block");
		}
	-->
	</script>
	</body>
</html>