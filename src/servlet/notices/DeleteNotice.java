package servlet.notices;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Admins;

import dao.Notice;


@SuppressWarnings("serial")
public class DeleteNotice extends HttpServlet {

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
		String title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
		int result = new Notice().delete(title);
		if(result > 0){
			HttpSession session = request.getSession();
			Admins admin = (Admins)session.getAttribute("admin");
			response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw());
		}else{
			out.print("<script>alert('删除失败，请重新删除！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}