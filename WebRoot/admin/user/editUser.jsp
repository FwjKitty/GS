<%@ page language="java" import="java.util.*,beans.Users" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Users user = (Users)request.getAttribute("user");

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
  	<form action="UpdateUser" enctype="multipart/form-data" method="post" onsubmit="return check()" class="definewidth m20">
		<table class="table table-bordered table-hover definewidth m10">
		    <tr>
		        <td width="10%" class="tableleft">用户帐号</td>
		        <td><input type="text" name="un" value="<%=user.getUn() %>"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">帐号密码</td>
		        <td><input type="password" name="pw" value="<%=user.getPw() %>"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">用户名称</td>
		        <td>
		        	<input type="text" name="name" value="<%=user.getName() %>"/>
		        </td>
		    </tr>
		    <tr>
		        <td class="tableleft">头像</td>
		        <td>
		        	<input type="file" name="head"/>
		        	<input type="text" name="head" value="<%=user.getHead() %>"/>
		        </td>
		    </tr>
		    <tr>
		        <td class="tableleft">联系方式</td>
		        <td>
		        	<input type="text" name="contact" value="<%=user.getContact() %>"/>
		        </td>
		    </tr>
		    <tr>
		        <td class="tableleft">个人简介</td>
		        <td>
		        	<input type="text" name="introduction" value="<%=user.getIntroduction() %>"/>
		        </td>
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
		if (form.un.value == "") {
			alert("用户帐号不能为空");
			form.un.focus();
			return false;
		} else if (form.pw.value == "") {
			alert("帐号密码不能为空");
			form.pw.focus();
			return false;
		} else {
			return true;
		}
	}
	-->
	</script>
</html>