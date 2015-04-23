package servlet.admin.users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DefaultData;

import dao.User;

import beans.Users;

@SuppressWarnings("serial")
public class FindAllUser extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		List<Users> list_user = new ArrayList<Users>();
		list_user = User.getPageResult(DefaultData.pageSize, page);
		int count = User.getCount();
		request.setAttribute("list_user", list_user);
		request.setAttribute("page", String.valueOf(page));
		request.setAttribute("count", String.valueOf(count));
		request.getRequestDispatcher("admin/user/allUser.jsp").forward(request, response);
	}

}
