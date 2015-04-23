package servlet.admin.description;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import dao.Description;
import beans.Descriptions;


@SuppressWarnings("serial")
public class FindAllDescription extends HttpServlet {

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
		List<Descriptions> list_description = new ArrayList<Descriptions>();
		int count = Description.getCount();
		list_description = Description.getPageResult(page, DefaultData.pageSize);
		
		request.setAttribute("list_description", list_description);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		request.getRequestDispatcher("admin/description/allDescription.jsp").forward(request, response);
	}
}