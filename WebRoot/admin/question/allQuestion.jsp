<%@ page language="java" import="java.util.*,beans.Questions" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<Questions> list_question = (List)request.getAttribute("list_question");
int _page = Integer.parseInt((String)request.getAttribute("page"));
int count = Integer.parseInt((String)request.getAttribute("count"));

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
  	<form class="form-inline definewidth m20" action="AddDescription" method="post">    
    	问题描述：
    	<input type="text" name="username" id="username"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    	<button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
    	<button type="button" class="btn btn-success" onclick="document.location='admin/question/addQuestion.jsp';">新增问题</button>
	</form>
	<table class="table table-bordered table-hover definewidth m10">
    	<thead>
    		<tr>
        		<th>问题id</th>
		        <th>问题描述</th>
		        <th>问题解答</th>
		        <th>用户名称</th>
		        <th>管理员名称</th>
		        <th>时间</th>
		        <th>操作</th>
    		</tr>
    	</thead>
    	<%
    		Questions question = new Questions();
    		for(int i=0; i<list_question.size(); i++){
    			question = list_question.get(i);
    	%>
	    <tr>
           	<td><%=question.getId() %></td>
            <td><%=question.getQuestion() %></td>
            <td><%=question.getAnswer() %></td>
            <td><%=question.getUn() %></td>
            <td><%=question.getAdmin() %></td>
            <td><%=question.getTime() %></td>
            <td>
                <a href="FindQuestion?id=<%=question.getId() %>">编辑</a>
                <a href="DelQuestion?id=<%=question.getId() %>">删除</a>
            </td>
        </tr>
        <%} %>
        <tfoot><tr ><td colspan="7">
        	<div class="inline pull-right page">
         		共<%=count %>条记录/当前第<%=_page %>/<%=(count+9)/10%> 页
         		<a href='FindAllQuestion?page=1'>首页</a>
        		<a href='FindAllQuestion?page=<%=lastpage %>' >上一页</a>
        		<a href='FindAllQuestion?page=<%=nextpage %>' >下一页</a>
        		<a href='FindAllQuestion?page=<%=finalpage %>' >尾页</a>
         	</div>
        </td></tr></tfoot>
	</table>
  </body>
</html>