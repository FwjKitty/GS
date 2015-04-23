package servlet.admin.course;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Courses;

import dao.Course;


@SuppressWarnings("serial")
public class DelCourse extends HttpServlet {

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
		
		String id = request.getParameter("id");
		String kind = request.getParameter("kind");
		
		Courses source = Course.queryById(Integer.parseInt(id), kind+"_course");
		int result = Course.delete(Integer.parseInt(id),kind+"_course");
		
		if(result > 0){
			String filename = getServletContext().getRealPath(source.getFileName());
			String image = getServletContext().getRealPath(source.getImage());
			Course.delFile(filename, image);
			response.sendRedirect("FindAllCourse?page=1&kind="+kind);
		}else{
			out.print("<script>alert('删除失败，请重新删除！');history.go(-1);location.reload();</script>");
		}
		out.flush();
		out.close();
	}
}