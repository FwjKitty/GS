package servlet.admin.users;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Users;

import dao.User;


@SuppressWarnings("serial")
public class DelUser extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String un = request.getParameter("un");
		Users user = User.queryByUn(un);
		int result = User.delete(un);
		
		if(result > 0){
			String head = getServletContext().getRealPath(user.getHead());
			User.delFile(head);
			response.sendRedirect("FindAllUser?page=1");
		}else{
			out.print("<script>alert('删除失败，请重新删除！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}