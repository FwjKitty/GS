package servlet.admin.guideCourse;

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


@SuppressWarnings("serial")
public class FindAllGuideCourse extends HttpServlet {

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
		List<GuideCourses> list_guideCourse = new ArrayList<GuideCourses>();
		int count = GuideCourse.getCount();
		list_guideCourse = GuideCourse.getPageResult(page, DefaultData.pageSize);
		
		request.setAttribute("list_guideCourse", list_guideCourse);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		request.getRequestDispatcher("admin/guideCourse/allGuideCourse.jsp").forward(request, response);
	}
}