<%@ page language="java" import="java.util.*,beans.Users,dao.User,utils.RSAUtil" pageEncoding="UTF-8"%>
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
    <!-- RSA -->
	<script type="text/javascript" src="js/RSA/RSA.js"></script>
	<script type="text/javascript" src="js/RSA/BigInt.js"></script>
	<script type="text/javascript" src="js/RSA/Barrett.js"></script>
	<script type="text/javascript">
	<!--
  	var key ;
	function bodyRSA(){
		setMaxDigits(130);
  		key = new RSAKeyPair("10001","","c633e2fa899c6e4c5c0baa7b43afa896c3a666fbc74604b2b83fb1cd691ff50efeb2cc201945ad44aaceb49acda5ed3659a6419f53e012c8a768605eb48d18f8a4782340a390dafdf75d121055032e479b14797959a108c66f3ab14a19276a4319820cff3ea5cf6b7473c8755ce204fbb94919f0c06227ea6c235a2a6f2b1863"); 
	}
	function RSARegister(){
		var register = document.getElementById("form_register");
		if (register.un.value == "") {
			alert("帐号不能为空");
			register.un.focus();
			return false;
		} else if (register.pw.value == "") {
			alert("密码不能为空");
			register.pw.focus();
			return false;
		} else {
			bodyRSA();
			register.pw.value = encryptedString(key, encodeURIComponent(register.pw.value));
			return true;
		}
	}
	-->
	</script>
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
  	<form action="UpdateUser" enctype="multipart/form-data" onsubmit="return RSARegister()" method="post" id="form_register" class="definewidth m20">
		<input type="text" name="un2" value="<%=user.getUn() %>"/>
		<table class="table table-bordered table-hover definewidth m10">
		    <tr>
		        <td width="10%" class="tableleft">用户帐号</td>
		        <td><input type="text" name="un" value="<%=user.getUn() %>"/></td>
		    </tr>
		    <tr>
		        <td class="tableleft">帐号密码</td>
		        <td><input type="password" name="pw" value="<%=RSAUtil.decrypt(RSAUtil.getKeyPair().getPrivate(),user.getPw().getBytes()) %>"/></td>
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
		        <td class="tableleft">学历</td>
		        <td>
		        	<input type="text" name="education" value="<%=user.getIntroduction() %>"/>
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
</html>