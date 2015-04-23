package servlet.admin.notices;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Notice;

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
		
		Notices notice = new Notices();
		notice.setId(Integer.valueOf(request.getParameter("id")));
		notice.setTitle((String) request.getParameter("title"));
		notice.setContent((String) request.getParameter("content"));
		notice.setUn((String)request.getSession().getAttribute("un"));
		notice.setTime(new Date(System.currentTimeMillis()));
		
		int result = Notice.update(notice);
		if(result != 0){
			response.sendRedirect("FindAllNotice?page=1");
		}else{
			out.print("<script>alert('修改 "+notice.getTitle()+" 失败，请重新修改！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}