package servlet.admin.notices;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Notice;


@SuppressWarnings("serial")
public class DelNotice extends HttpServlet {

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
		int result = Notice.delete(Integer.valueOf(request.getParameter("id")));
		if(result > 0){
			response.sendRedirect("FindAllNotice?page=1");
		}else{
			out.print("<script>alert('删除失败，请重新删除！');history.go(-1);location.reload();</script>");
		}
		out.flush();
		out.close();
	}
}