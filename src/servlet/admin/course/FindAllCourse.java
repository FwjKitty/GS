package servlet.admin.course;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import beans.Courses;

import dao.Course;

@SuppressWarnings("serial")
public class FindAllCourse extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String kind = request.getParameter("kind");
		int page = Integer.valueOf(request.getParameter("page"));
		int count = Course.getCount(kind+"_course");
		List<Courses> list_course = new ArrayList<Courses>();
		list_course = Course.getPageResult(kind+"_course", page, DefaultData.pageSize);
		
		request.setAttribute("list_course", list_course);
		request.setAttribute("kind", kind);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		request.getRequestDispatcher("admin/course/allCourse.jsp").forward(request, response);
	}
}