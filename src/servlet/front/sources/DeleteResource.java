package servlet.front.sources;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Admins;

import dao.Source;


@SuppressWarnings("serial")
public class DeleteResource extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
		String value = new String(request.getParameter("value").getBytes("ISO-8859-1"),"UTF-8");
		
		int result = new Source().delete(Integer.parseInt(id),value);
		
		if(result > 0){
			HttpSession session = request.getSession();
			Admins admin = (Admins)session.getAttribute("admin");
			response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw());
		}else{
			out.print("<script>alert('删除失败，请重新删除！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}