package servlet.admin.notices;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import dao.Notice;
import beans.Notices;


@SuppressWarnings("serial")
public class FindAllNotice extends HttpServlet {

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
		List<Notices> list_notice = new ArrayList<Notices>();
		int count = Notice.getCount();
		list_notice = Notice.getPageResult(page, DefaultData.pageSize);
		
		request.setAttribute("list_notice", list_notice);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		request.getRequestDispatcher("admin/notice/allNotice.jsp").forward(request, response);
	}
}