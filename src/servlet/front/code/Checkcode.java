package servlet.front.code;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Checkcode extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control","no-cache");
		/*
		 * 1.获取输入框中的验证码
		 */
		String vcode = request.getParameter("vcode");
		/*
		 * 2.获取真实的验证码
		 */
		String valcode = (String)request.getSession().getAttribute("valcode");
		/*
		 * 3.进行忽略大小比较，得到结果
		 */
		boolean b = vcode.equalsIgnoreCase(valcode);
		/*
		 * 4.发送客户端
		 * 	若b=true 则判断是登录（operation=login）还是注册（operation=register）再提交订单
		 * 	若b=false 则返回i并显示验证码错误
		 */
		if(b==true){
			String operation = request.getParameter("operation");
			if("login".equals(operation)){
				response.getWriter().print("<script>$(function(){$('#form_login').submit();});</script>");
			}else if("register".equals(operation)){
				response.getWriter().print("<script>$(function(){$('#form_register').submit();});</script>");
			}
		}else{
			response.getWriter().print("验证码错误！");
		}
	}
}