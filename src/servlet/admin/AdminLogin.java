package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin;
import dao.Notice;
import dao.Question;
import dao.User;
import dao.Resource;

import beans.Admins;
import beans.Notices;
import beans.Questions;
import beans.Users;
import beans.Resources;

@SuppressWarnings("serial")
public class AdminLogin extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String un = (String) request.getParameter("un");
		String pw = (String) request.getParameter("pw");
		String value = (String) request.getParameter("value");
		Admins admin = new Admin().queryByUn(un);
		
		/**
		 * 判断密码与数据库中的相等（pw=pw2）
		 * 	判断是什么用户登录（value）
		 * 	若value=1 教师登录
		 * 	若value=2 管理员登录
		 * 判断查找数据库中用户的密码（pw=""）此用户不存在
		 * 否则帐号与密码不匹配
		 */
		if(pw.equals(admin.getPw())){
			if("1".equals(value)&&"1".equals(admin.getValue())){
				List<Notices> list_notice = new Notice().select();
				List<Users> list_user = new User().select();
				List<Resources> list_mysql_course = new Resource().select("mysql_course");
				List<Resources> list_mysql_source = new Resource().select("mysql_source");
				List<Resources> list_sqlserver_course = new Resource().select("sqlserver_course");
				List<Resources> list_sqlserver_source = new Resource().select("sqlserver_source");
				List<Resources> list_oracle_course = new Resource().select("oracle_course");
				List<Resources> list_oracle_source = new Resource().select("oracle_source");
				//List<Questions> list_question = new Question().query();
				
				request.setAttribute("admin", admin);
				request.setAttribute("list_notice", list_notice);
				request.setAttribute("list_user", list_user);
				request.setAttribute("list_mysql_course", list_mysql_course);
				request.setAttribute("list_mysql_source", list_mysql_source);
				request.setAttribute("list_sqlserver_course", list_sqlserver_course);
				request.setAttribute("list_sqlserver_source", list_sqlserver_source);
				request.setAttribute("list_oracle_course", list_oracle_course);
				request.setAttribute("list_oracle_source", list_oracle_source);
				//request.setAttribute("list_question", list_question);
				
				RequestDispatcher rd = request.getRequestDispatcher("jsp/admin/admin.jsp");
				rd.forward(request, response);
			}else if("2".equals(value)&&"2".equals(admin.getValue())){
				List<Notices> list_notice = new Notice().select();
				List<Users> list_user = new User().select();
				List<Resources> list_mysql_course = new Resource().select("mysql_course");
				List<Resources> list_mysql_source = new Resource().select("mysql_source");
				List<Resources> list_sqlserver_course = new Resource().select("sqlserver_course");
				List<Resources> list_sqlserver_source = new Resource().select("sqlserver_source");
				List<Resources> list_oracle_course = new Resource().select("oracle_course");
				List<Resources> list_oracle_source = new Resource().select("oracle_source");
				//List<Questions> list_question = new Question().query();
				
				request.setAttribute("admin", admin);
				request.setAttribute("list_notice", list_notice);
				request.setAttribute("list_user", list_user);
				request.setAttribute("list_mysql_course", list_mysql_course);
				request.setAttribute("list_mysql_source", list_mysql_source);
				request.setAttribute("list_sqlserver_course", list_sqlserver_course);
				request.setAttribute("list_sqlserver_source", list_sqlserver_source);
				request.setAttribute("list_oracle_course", list_oracle_course);
				request.setAttribute("list_oracle_source", list_oracle_source);
				//request.setAttribute("list_question", list_question);
				
				RequestDispatcher rd = request.getRequestDispatcher("jsp/admin/admin.jsp");
				rd.forward(request, response);
			}else{
				out.println("<script language='javascript'>alert('登录数据出错！');history.go(-1);</script>");
			}
		}else if(" ".equals(admin.getPw())){
			out.println("<script language='javascript'>alert('用户不存在！');history.go(-1);</script>");
		}else{
			out.println("<script language='javascript'>alert('密码与帐号不匹配，请重新填写！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}