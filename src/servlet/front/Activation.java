package servlet.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import beans.Users;

@SuppressWarnings("serial")
public class Activation extends HttpServlet {

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
		Users user = new Users();
		user.setUn((String) request.getParameter("un"));
		user.setPw((String) request.getParameter("pw"));
		user.setTime(new Date(System.currentTimeMillis()));
		//向数据库添加用户
		User.add(user);
		request.getSession().setAttribute("user", user);
		out.println("<script language='javascript'>alert('注册成功，返回首面登录');</script>");
		request.getRequestDispatcher("Main").forward(request, response);
		out.flush();
		out.close();
	}
}