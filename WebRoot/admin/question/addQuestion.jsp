<%@ page language="java" import="java.util.*,beans.Questions" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

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
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" type="text/css" href="admin/Css/style.css" />
    <script type="text/javascript" src="admin/Js/jquery.js"></script>
    <script type="text/javascript" src="admin/Js/jquery.sorted.js"></script>
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
  	<form action="AddQuestion" method="post" name="form" onsubmit="return check()" class="definewidth m20">
		<table class="table table-bordered table-hover definewidth m10">
		    <tr>
		        <td width="10%" class="tableleft">问题描述</td>
		        <td><input type="text" name="question"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">课程解答</td>
		        <td><input type="text" name="answer"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">用户名称</td>
		        <td><input type="text" name="un"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">管理员名称</td>
		        <td><input type="text" name="admin"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft"></td>
		        <td>
		            <button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;
		            <button type="button" class="btn btn-success" onclick="history.go(-1);">返回列表</button>
		        </td>
		    </tr>
		</table>
	</form>
  </body>
  <script language="javascript">
  <!--
	function check() {
		if (form.question.value == "") {
			alert("问题描述不能为空");
			form.question.focus();
			return false;
		} else if (form.un.value == "") {
			alert("用户名称不能为空");
			form.un.focus();
			return false;
		} else if (form.admin.value == "") {
			alert("管理员名称不能为空");
			form.admin.focus();
			return false;
		} else {
			return true;
		}
	}
	-->
	</script>
</html>