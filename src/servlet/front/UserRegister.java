package servlet.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import dao.JMail;

@SuppressWarnings("serial")
public class UserRegister extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String pw2 = (String) request.getParameter("pw2");
		String pw = (String) request.getParameter("pw");
		String un = (String) request.getParameter("un");

		String ip = InetAddress.getLocalHost().getHostAddress();
		int port = request.getServerPort();
		/**
		 * 判断该用户是否已经存在且判断用户与密码是否为空
		 * 	若为空则报错返回
		 * 	若没注册则发送激活链接
		 * 	若已经注册则返回首页
		 */
		if("".equals(un)||"".equals(pw2)||"".equals(un)){
			out.println("<script language='javascript'>alert('帐号或密码不能为空！');history.go(-1);</script>");
		}else if(!un.equals(User.queryByUn(un))){
			/**
			 * 判断用户名和密码是否一致
			 * 	若一致则判断操作是后台添加还是用户注册
			 * 		用户注册，发送激活码
			 * 	若不一致则判断是用户激活还是密码不一致
			 * 		密码不一致，返回重新填写
			 */
			if(pw.equals(pw2)){
				/*
				 * 判断验证码是否正确
				 */
				//获取验证码
				String valcode = request.getSession().getAttribute("valcode").toString();
				//获取用户填写的验证码
				String vcode = request.getParameter("vcode");
				//进行验证
				if(valcode.equalsIgnoreCase(vcode)){
					new JMail().mail(ip,port,un,pw);
					out.println("<script language='javascript'>alert('激活邮件已经发送到注册的邮箱帐号，请注意查收！');history.go(-1);</script>");
				}else{
					out.println("<script language='javascript'>alert('验证码错误！');history.go(-1);</script>");
				}
			}else{
				out.println("<script language='javascript'>alert('两次密码输入不一致，请重新输入！');history.go(-1);</script>");
			}
		}else{
			out.println("<script language='javascript'>alert('该帐号已经注册！');history.go(-1);</script>");
		}
		
		out.flush();
		out.close();
	}
}