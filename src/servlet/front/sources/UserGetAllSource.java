package servlet.front.sources;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import dao.Source;

import beans.Sources;

@SuppressWarnings("serial")
public class UserGetAllSource extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		if(null == request.getSession().getAttribute("user")){
			RequestDispatcher rd = request.getRequestDispatcher("Main");
			rd.forward(request, response);
		}else{
			String kind = request.getParameter("kind");
			int page = Integer.parseInt(request.getParameter("page"));
			int count = Source.getCount(kind);
			List<Sources> list_source = new ArrayList<Sources>();
			list_source = Source.getPageResult(kind, page, DefaultData.pageSize);
			request.setAttribute("list_source", list_source);
			request.setAttribute("page", String.valueOf(page));
			request.setAttribute("count", String.valueOf(count));
			request.setAttribute("kind", kind);
			RequestDispatcher rd = request.getRequestDispatcher("front/source/showSource.jsp");
			rd.forward(request, response);
		}
	}
}