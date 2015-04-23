package servlet.front.courses;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import dao.Course;

import beans.Courses;

@SuppressWarnings("serial")
public class UserGetAllCourse extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		String kind = request.getParameter("kind");
		int page = Integer.parseInt(request.getParameter("page"));
		int count = Course.getCount(kind+"_course");
		List<Courses> list_course = new ArrayList<Courses>();
		list_course = Course.getPageResult(kind+"_course", page, DefaultData.pageSize);
		request.setAttribute("list_course", list_course);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		if(null == request.getSession().getAttribute("user")){
			RequestDispatcher rd = request.getRequestDispatcher("front/course/showCourse.jsp");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("front/course/showCourse_login.jsp");
			rd.forward(request, response);
		}	
	}
}