package servlet.front.users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			request.getRequestDispatcher("Main").forward(request, response);
		}else{
			List<Questions> list_question = new ArrayList<Questions>();
			//List<Courses> list_course = new ArrayList<Courses>();
			List<Sources> list_source = new ArrayList<Sources>();
			
			list_question = Question.queryByUn(u.getUn());
			list_source = Source.queryByUn(u.getUn());
			//list_course = Course.queryCourse();
			request.setAttribute("list_question", list_question);
			request.setAttribute("list_source", list_source);
			//request.setAttribute("list_course", list_course);
			request.getRequestDispatcher("front/person/showPerson.jsp").forward(request, response);
		}
	}
}