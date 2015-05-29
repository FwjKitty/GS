package servlet.front.users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import dao.Question;
import dao.Source;

import beans.Questions;
import beans.Users;
import beans.Sources;

@SuppressWarnings("serial")
public class UserGetPerson extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		Users u = null;
		u = (Users)request.getSession().getAttribute("user");
		
		if(u == null){
			response.sendRedirect("Main");
		}else{
			String title = request.getParameter("title");
			if(title.equals("person")){
				request.getRequestDispatcher("front/person/showPerson.jsp").forward(request, response);
			}else if(title.equals("question")){
				List<Questions> list_question = new ArrayList<Questions>();
				int page = Integer.parseInt(request.getParameter("page"));
				int count = Question.getCountByUn(u.getUn());
				list_question = Question.queryByUn(u.getUn(),page,DefaultData.pageSize_front);
				request.setAttribute("list_question", list_question);
				request.setAttribute("page", String.valueOf(page));
				request.setAttribute("count", String.valueOf(count));
				request.getRequestDispatcher("front/person/showQuestion.jsp").forward(request, response);
			}else if(title.equals("resource")){
				List<Sources> list_source = new ArrayList<Sources>();
				int page = Integer.parseInt(request.getParameter("page"));
				int count = Source.getCountByUn(u.getUn());
				list_source = Source.queryByUn(u.getUn(), page, DefaultData.pageSize_front);
				request.setAttribute("list_source", list_source);
				request.setAttribute("page", String.valueOf(page));
				request.setAttribute("count", String.valueOf(count));
				request.getRequestDispatcher("front/person/showResource.jsp").forward(request, response);
			}
			//List<Courses> list_course = new ArrayList<Courses>();
			//list_course = Course.queryCourse();
			//request.setAttribute("list_course", list_course);
		}
	}
}