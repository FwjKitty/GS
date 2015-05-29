package servlet.front.questions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import beans.Questions;

import dao.Question;

@SuppressWarnings("serial")
public class UserGetAllQuestion extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if(null == request.getSession().getAttribute("user")){
			response.sendRedirect("Main");
		}else{
			int page = Integer.parseInt(request.getParameter("page"));
			int count = Question.getCount();
			List<Questions> list_question = new ArrayList<Questions>();
			list_question = Question.getPageResult(page, DefaultData.pageSize);
			request.setAttribute("list_question", list_question);
			request.setAttribute("count", String.valueOf(count));
			request.setAttribute("page", String.valueOf(page));
			request.getRequestDispatcher("front/question/showQuestion.jsp").forward(request, response);
		}
	}
}