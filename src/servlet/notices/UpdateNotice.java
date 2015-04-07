package servlet.notices;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Notice;


import beans.Admins;
import beans.Notices;

@SuppressWarnings("serial")
public class UpdateNotice extends HttpServlet {

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
		
		String title = new String(request.getParameter("title2").getBytes("ISO-8859-1"),"UTF-8");
		Notices notice = new Notices();
		notice.setTitle((String) request.getParameter("title"));
		notice.setContent((String) request.getParameter("content"));
		Date time = null;
		try {
			SimpleDateFormat sd = new SimpleDateFormat( "yyyy-MM-dd" );
			java.util.Date date = sd.parse(request.getParameter("time"));
			time = new Date(date.getTime());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		notice.setTime(time);
		
		int result = new Notice().update(notice, title);
		if(result != 0){
			HttpSession session = request.getSession();
			Admins admin = (Admins)session.getAttribute("admin");
			response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw());
		}else{
			out.print("<script>alert('修改失败" + title + "，请重新修改！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}