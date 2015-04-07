package servlet.notices;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Notice;

import beans.Admins;
import beans.Notices;


@SuppressWarnings("serial")
public class AddNotice extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		Notices notice = new Notices();
		
		notice.setTitle((String) request.getParameter("title"));
		notice.setTime(new Date(System.currentTimeMillis()));
		notice.setContent((String) request.getParameter("content"));
		
		int result = new Notice().add(notice);
		
		if(result > 0){
			HttpSession session = request.getSession();
			Admins admin = (Admins)session.getAttribute("admin");
			response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw());
		}else{
			out.print("<script>alert('添加失败，请重新添加！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}