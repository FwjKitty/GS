package servlet.front.guideCourse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import dao.GuideCourse;

import beans.GuideCourses;
import beans.Users;

@SuppressWarnings("serial")
public class UserGetAllGuideCourse extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		
		Users user = null;
		user = (Users)request.getSession().getAttribute("user");
		
		int page = Integer.parseInt(request.getParameter("page"));
		String name = request.getParameter("name");
		List<GuideCourses> list_guideCourse = new ArrayList<GuideCourses>();
		list_guideCourse = GuideCourse.getPageResult(name, page, DefaultData.pageSize_front);
		int count = GuideCourse.getCount(name);
		request.setAttribute("list_guideCourse", list_guideCourse);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		if(user == null){
			request.getRequestDispatcher("front/guideCourse/showGuideCourse.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("front/guideCourse/showGuideCourse_login.jsp").forward(request, response);
		}
	}
}