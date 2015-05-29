<%@ page language="java" import="java.util.*,beans.Descriptions" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Descriptions description = (Descriptions)request.getAttribute("description");

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
    <title>光数之家</title>
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
  	<form action="UpdateDescription" enctype="multipart/form-data" method="post" name="form" onsubmit="return check()" class="definewidth m20">
		<table class="table table-bordered table-hover definewidth m10">
			<input type="hidden" name="id" value="<%=description.getId() %>"/>
		    <tr>
		        <td width="10%" class="tableleft">课程名称</td>
		        <td><input type="text" name="name" value="<%=description.getName() %>"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">课程描述</td>
		        <td><input type="text" name="info" value="<%=description.getInfo() %>"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">图片</td>
		        <td>
		        	<input type="file" name="image"/>
		        	<input type="text" name="image" value="<%=description.getImage() %>"/>
		        </td>
		    </tr>
		    <tr>
		        <td class="tableleft">介绍图片</td>
		        <td>
		        	<input type="file" name="introduce"/>
		        	<input type="text" name="introduce" value="<%=description.getIntroduce() %>"/>
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
		if (form.name.value == "") {
			alert("名称不能为空");
			form.name.focus();
			return false;
		} else if (form.info.value == "") {
			alert("描述不能为空");
			form.info.focus();
			return false;
		} else if (form.image.value == "") {
			alert("图片不能为空");
			form.image.focus();
			return false;
		} else if (form.introduce.value == "") {
			alert("介绍图片不能为空");
			form.introduce.focus();
			return false;
		} else {
			return true;
		}
	}
	-->
	</script>
</html>