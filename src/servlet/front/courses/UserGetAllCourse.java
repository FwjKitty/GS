package servlet.front.courses;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Course;
import dao.Source;

import beans.Courses;
import beans.Sources;
import beans.Users;

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
		
		Users user = null;
		user = (Users)request.getSession().getAttribute("user");
		String kind = request.getParameter("kind");
		if(user != null){
			int course_id = Integer.parseInt(request.getParameter("course_id"));
			List<Courses> list_course = new ArrayList<Courses>();
			List<Sources> list_source = new ArrayList<Sources>();
			list_course = Course.queryByCourseId(course_id,kind+"_course");
			list_source = Source.queryByCourseId(course_id, kind+"_source");
			request.setAttribute("list_course", list_course);
			request.setAttribute("list_source", list_source);
			RequestDispatcher rd = request.getRequestDispatcher("front/course/showCourse_login.jsp");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("UserGetAllGuideCourse?page=1&name="+kind);
			rd.forward(request, response);
		}
	}
}