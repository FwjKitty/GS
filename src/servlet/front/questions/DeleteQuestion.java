package servlet.front.questions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Admins;

import dao.Question;


@SuppressWarnings("serial")
public class DeleteQuestion extends HttpServlet {

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
		
		int result = new Question().delete(Integer.parseInt(request.getParameter("id")));
		if(result > 0){
			HttpSession session = request.getSession();
			Admins admin = (Admins)session.getAttribute("admin");
			response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw());
			System.out.println(result);
		}else{
			out.println("<script>alert('删除失败，请重新操作！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}