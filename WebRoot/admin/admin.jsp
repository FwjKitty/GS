<%@ page language="java" import="java.util.*,dao.*,beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String un = null;
un = (String) session.getAttribute("un");

%>

<!DOCTYPE HTML>
<html>
	<head>
	    <title>后台管理系统</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link href="admin/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
	    <link href="admin/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
	    <link href="admin/assets/css/main-min.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="header">
			<div class="dl-title">
        		<img src="/chinapost/Public/assets/img/top.png">
    		</div>
			<div class="dl-log">
				欢迎您，<span class="dl-log-user"><%=un %></span>
				<a href="admin/login.jsp" title="退出系统" class="dl-log-quit">[退出]</a>
    		</div>
		</div>
		<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>
			<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">课程管理</div></li>
			<li class="nav-item dl-selected"><div class="nav-item-inner nav-sample">资源管理</div></li>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="admin/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="admin/assets/js/bui-min.js"></script>
<script type="text/javascript" src="admin/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="admin/assets/js/config-min.js"></script>
<script>
<!--
$(function(){
    BUI.use('common/main',function(){
        var config = [{id:'1',menu:[{text:'系统管理',
            items:[{id:'11',text:'课程描述管理',href:'FindAllDescription?page=1'},
                   {id:'12',text:'总体课程管理',href:'FindAllGuideCourse?page=1'},
                   {id:'13',text:'用户管理',href:'FindAllUser?page=1'},
                   {id:'14',text:'问答管理',href:'FindAllQuestion?page=1'},
                   {id:'15',text:'公告管理',href:'FindAllNotice?page=1'}]}]},
            {id:'2',menu:[{text:'课程管理',
            items:[{id:'21',text:'MySQL',href:'FindAllCourse?page=1&kind=mysql'},
                   {id:'22',text:'SQLServer',href:'FindAllCourse?page=1&kind=sqlserver'},
                   {id:'23',text:'Oracle',href:'FindAllCourse?page=1&kind=oracle'}]}]},
        	{id:'3',menu:[{text:'资源管理',
            items:[{id:'31',text:'MySQL',href:'FindAllSource?page=1&kind=mysql_source'},
                   {id:'32',text:'SQLServer',href:'FindAllSource?page=1&kind=sqlserver_source'},
                   {id:'33',text:'Oracle',href:'FindAllSource?page=1&kind=oracle_source'}]}]}];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
});
-->
</script>
<div style="text-align:center;">
<p>来源：<a href="http://localhost:8080/gs-ek/" target="_blank">光数之家之家</a></p>
</div>
	</body>
</html>