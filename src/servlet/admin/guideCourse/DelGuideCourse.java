package servlet.admin.guideCourse;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.GuideCourses;

import dao.GuideCourse;

@SuppressWarnings("serial")
public class DelGuideCourse extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		GuideCourses guideCourse = GuideCourse.queryById(Integer.parseInt(request.getParameter("id")));
		int result = GuideCourse.del(Integer.parseInt(request.getParameter("id")));
		
		if(result > 0){
			String image = guideCourse.getImage();
			image = getServletContext().getRealPath(guideCourse.getImage());
			GuideCourse.delFile(image);
			response.sendRedirect("FindAllGuideCourse?page=1");
		}else{
			out.print("<script>alert('删除失败');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}