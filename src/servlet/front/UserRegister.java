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
		//密码加密
		String pw = (String) request.getParameter("pw");
		String un = (String) request.getParameter("un");

		String ip = InetAddress.getLocalHost().getHostAddress();
		int port = request.getServerPort();
		if(!un.equals(User.queryByUn(un))){
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
			out.println("<script language='javascript'>alert('该帐号已经注册！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}