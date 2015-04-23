package servlet.admin.questions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import dao.Question;
import beans.Questions;


@SuppressWarnings("serial")
public class FindAllQuestion extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		List<Questions> list_question = new ArrayList<Questions>();
		int count = Question.getCount();
		list_question = Question.getPageResult(page, DefaultData.pageSize);
		
		request.setAttribute("list_question", list_question);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		request.getRequestDispatcher("admin/question/allQuestion.jsp").forward(request, response);
	}
}