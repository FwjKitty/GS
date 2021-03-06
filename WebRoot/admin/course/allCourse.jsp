<%@ page language="java" import="java.util.*,beans.Courses" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<Courses> list_course = (List)request.getAttribute("list_course");
int _page = Integer.parseInt((String)request.getAttribute("page"));
int count = Integer.parseInt((String)request.getAttribute("count"));
String kind = (String)request.getAttribute("kind");

	int nextpage ;
	int lastpage ;
	int finalpage=count/10+1;
	if(_page==1){
	lastpage=1;
	}else lastpage=_page-1;
	 if(finalpage==_page){
	nextpage=_page;
	}else nextpage=_page+1;
	 
	String un = null;
	un = (String)session.getAttribute("un");
	if(un == null){
		response.sendRedirect("admin/error.jsp");
	}
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="admin/Css/style.css" />
    <script type="text/javascript" src="admin/Js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="admin/Js/ckform.js"></script>
    <script type="text/javascript" src="admin/Js/common.js"></script>
	<style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
  </head>
  <body>
  	<form class="form-inline definewidth m20" action="AddSource" method="post">    
    	资源名称：
    	<input type="text" name="username" id="username"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    	<button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
    	<button type="button" class="btn btn-success" onclick="document.location='admin/course/addCourse.jsp?kind=<%=kind %>';">新增资源</button>
	</form>
	<table class="table table-bordered table-hover definewidth m10">
    	<thead>
    		<tr>
        		<th>资源id</th>
		        <th>资源路径</th>
		        <th>管理员名称</th>
		        <th>时间</th>
		        <th>所属总体课程id</th>
		        <th>操作</th>
    		</tr>
    	</thead>
    	<%
    		Courses course = new Courses();
    		for(int i=0; i<list_course.size(); i++){
    			course = list_course.get(i);
    	%>
	    <tr>
           	<td><%=course.getId() %></td>
            <td><%=course.getFileName() %></td>
            <td><%=course.getUn() %></td>
            <td><%=course.getTime() %></td>
            <td><%=course.getCourse_id() %></td>
            <td>
                <a href="FindCourse?id=<%=course.getId() %>&kind=<%=kind %>">编辑</a>
                <a href="DelCourse?id=<%=course.getId() %>&kind=<%=kind %>">删除</a>
            </td>
        </tr>
        <%} %>
        <tfoot><tr ><td colspan="6">
        	<div class="inline pull-right page">
         		共<%=count %>条记录/当前第<%=_page %>/<%=(count+9)/10%> 页
         		<a href='FindAllCourse?page=1&&kind=<%=kind %>'>首页</a>
        		<a href='FindAllCourse?page=<%=lastpage %>&kind=<%=kind %>' >上一页</a>
        		<a href='FindAllCourse?page=<%=nextpage %>&kind=<%=kind %>' >下一页</a>
        		<a href='FindAllCourse?page=<%=finalpage %>&kind=<%=kind %>' >尾页</a>
         	</div>
        </td></tr></tfoot>
	</table>
  </body>
</html>