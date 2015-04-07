package servlet.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User;
import dao.JMail;

import beans.Admins;
import beans.Users;

@SuppressWarnings("serial")
public class AddUser extends HttpServlet {

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
		String operation = (String) request.getParameter("operation");

		Users user = new Users();
		//String ip = "192.168.1.100";
		String ip = InetAddress.getLocalHost().getHostAddress();
		int port = request.getServerPort();
		user.setUn((String) request.getParameter("un"));
		user.setPw((String) request.getParameter("pw"));
		user.setTime(new Date(System.currentTimeMillis()));
		
		/*
		 * 判断验证码是否正确
		 */
		//获取验证码
		String valcode = request.getSession().getAttribute("valcode").toString();
		//获取用户填写的验证码
		String vcode = request.getParameter("vcode");
		//进行验证
		if(valcode.equalsIgnoreCase(vcode)){
			/**
			 * 判断该用户是否已经存在且判断用户与密码是否为空
			 * 	若没注册则判断是后台还是前端操作
			 * 	若为空则报错返回
			 * 	若已经注册则返回首页
			 */
			if("".equals(user.getUn())||"".equals(pw2)||"".equals(user.getPw())){
				out.println("<script language='javascript'>alert('帐号或密码不能为空！');history.go(-1);</script>");
			}else if(!user.getUn().equals(new User().query(user.getUn()).getUn())){
				/**
				 * 判断用户名m密码是否一致
				 * 	若一致则判断操作是后台添加还是用户注册
				 * 		若add 后台管理添加用户
				 * 		若registered 用户注册，发送激活码
				 * 	若不一致则判断是用户激活还是密码不一致
				 * 		若activation 用户注册激活成功，直接添加会员
				 * 		否则 密码不一致，返回重新填写
				 */
				if(user.getPw().equals(pw2)){
					if("add".equals(operation)){
						//向数据库添加用户
						new User().add(user);
						HttpSession session = request.getSession();
						Admins admin = (Admins)session.getAttribute("admin");
						response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw());
					}else if("registered".equals(operation)){
						new JMail().mail(ip,port,user.getUn(),user.getPw());
						out.println("<script language='javascript'>alert('激活邮件已经发送到注册的邮箱帐号，请注意查收！');history.go(-1);</script>");
					}
				}else{
					if("activation".equals(operation)){
						//向数据库添加用户
						new User().add(user);
						request.setAttribute("un",user.getUn());
						request.setAttribute("pw",user.getPw());
						RequestDispatcher rd = request.getRequestDispatcher("QueryByUn");
						rd.forward(request, response);
					}else{
						out.println("<script language='javascript'>alert('两次密码输入不一致，请重新输入！');history.go(-1);</script>");
					}
				}
			}else{
				out.println("<script language='javascript'>alert('该帐号已经注册！');history.go(-1);</script>");
			}
		}else{
			out.println("<script language='javascript'>alert('验证码错误！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}