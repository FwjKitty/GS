package servlet.admin.users;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;

import beans.Users;

@SuppressWarnings("serial")
public class FindUser extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		Users user = User.queryByUn(request.getParameter("un"));
		request.setAttribute("user",user);
		RequestDispatcher rd = request.getRequestDispatcher("admin/user/editUser.jsp");
		rd.forward(request, response);
	}
}