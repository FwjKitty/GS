package servlet.front.questions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Question;


import beans.Admins;
import beans.Questions;

@SuppressWarnings("serial")
public class Add_Question extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		Questions question = new Questions();
		
		question.setQuestion((String) request.getParameter("question"));
		question.setAnswer((String) request.getParameter("answer"));
		question.setUn((String) request.getParameter("un"));
		question.setAdmin((String) request.getParameter("admin"));
		question.setTime(new Date(System.currentTimeMillis()));
		
		int result = new Question().add(question);
		
		if(result != 0){
			HttpSession session = request.getSession();
			Admins admin = (Admins)session.getAttribute("admin");
			response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw());
		}else{
			out.println("<script>alert('添加失败，请重新操作！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}