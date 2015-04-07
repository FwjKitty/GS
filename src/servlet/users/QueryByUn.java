package servlet.users;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Question;
import dao.User;
import dao.Resource;


import beans.Questions;
import beans.Users;
import beans.Resources;

@SuppressWarnings("serial")
public class QueryByUn extends HttpServlet {

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
		String un = "";
		String pw = "";
		String operation = (String) request.getParameter("operation");
		
		//获取验证码
		String valcode = request.getSession().getAttribute("valcode").toString();
		//获取用户填写的验证码
		String vcode = request.getParameter("vcode");
		/**
		 * 判断验证码是否正确
		 */
		if(valcode.equalsIgnoreCase(vcode)){
			/**
			 * 若operation=admin_update 则是转到管理员修改用户资料的页面（先判断该用户是否存在）
			 * 若operation=login 则是用户登录
			 * 	若用户存在
			 * 		若密码正确 则把用户的user、question、course、source响应到person页面
			 * 		否则 提示密码与用户账号不匹配，返回上一页
			 * 	若用户不存在 则提示用户不存在，返回上一页
			 */
			if("admin_update".equals(operation)){
				un = new String(request.getParameter("un").getBytes("ISO-8859-1"),"UTF-8");
				Users user = new User().query(un);
				if(user.getUn() != null){
					request.setAttribute("user",user);
					request.setAttribute("un", un);
					RequestDispatcher rd = request.getRequestDispatcher("jsp/user/updateUser.jsp");
					rd.forward(request, response);
				}else{
					out.print("<script>alert('该用户不存在！');history.go(-1);</script>");
				}
			}else if("login".equals(operation)||"person".equals(operation)){
				HttpSession session = request.getSession();
				List<Questions> list_question = new ArrayList<Questions>();
				List<Resources> list_source = new ArrayList<Resources>();
				List<Resources> list_course = new ArrayList<Resources>();
				
				un = (String) request.getParameter("un");
				pw = (String) request.getParameter("pw");
				Users user = new User().query(un);
				list_question = new Question().query(un);
				list_source = new Resource().querySource(un);
				list_course = new Resource().queryCourse();
				
				if(user.getUn() != null){
					if(pw.equals(user.getPw())){
						session.setAttribute("user", user);
						session.setAttribute("list_question", list_question);
						session.setAttribute("list_source", list_source);
						session.setAttribute("list_course", list_course);
						response.sendRedirect("jsp/main/person.jsp");
					}else{
						out.print("<script>alert('密码与用户帐号不匹配！');history.go(-1);</script>");
					}
				}else{
					out.print("<script>alert('该用户不存在！');history.go(-1);</script>");
				}
			}
		}else{
			out.println("<script language='javascript'>alert('验证码错误！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}