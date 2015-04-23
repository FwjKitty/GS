package servlet.admin.source;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import beans.Sources;

import dao.Source;

@SuppressWarnings("serial")
public class FindAllSource extends HttpServlet {

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
		int count = Source.getCount(kind);
		List<Sources> list_source = new ArrayList<Sources>();
		list_source = Source.getPageResult(kind, page, DefaultData.pageSize);
		
		request.setAttribute("list_source", list_source);
		request.setAttribute("kind", kind);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		request.getRequestDispatcher("admin/source/allSource.jsp").forward(request, response);
	}
}