package servlet.front.notices;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Notice;


import beans.Notices;

@SuppressWarnings("serial")
public class QueryByTitle extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
		Notices notice = new Notice().query(title);
		
		if(notice.getTitle() != null){
			request.setAttribute("title", title);
			request.setAttribute("notice", notice);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/notice/updateNotice.jsp");
			rd.forward(request, response);
		}else{
			out.print("<script>alert('修改公告"+ title + "失败，请重新修改！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}