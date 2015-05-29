package servlet.admin.questions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Question;


import beans.Questions;

@SuppressWarnings("serial")
public class FindQuestion extends HttpServlet {

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
		
		int id = Integer.parseInt(request.getParameter("id"));
		Questions question = Question.queryById(id);
		
		if(question != null){
			request.setAttribute("question", question);
			request.getRequestDispatcher("admin/question/editQuestion.jsp").forward(request, response);
		}else{
			out.println("<script>alert('该信息不存在！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}