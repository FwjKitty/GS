package servlet.admin.course;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Course;

import beans.Courses;

@SuppressWarnings("serial")
public class FindCourse extends HttpServlet {

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
		String kind = request.getParameter("kind");
		Courses course = null;
		course = Course.queryById(id, kind+"_course");
		
		if(course != null){
			request.setAttribute("course", course);
			request.setAttribute("kind", kind);
			request.getRequestDispatcher("admin/course/editCourse.jsp").forward(request, response);
		}else{
			out.println("<script>alert('该信息不存在！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}