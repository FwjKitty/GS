package servlet.admin.source;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Source;


import beans.Sources;

@SuppressWarnings("serial")
public class FindSource extends HttpServlet {

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
		
		int id = Integer.parseInt(request.getParameter("id"));
		String kind = request.getParameter("kind");
		Sources source = null;
		source = Source.queryById(id, kind);
		
		if(source != null){
			request.setAttribute("source", source);
			request.setAttribute("kind", kind);
			request.getRequestDispatcher("admin/source/editSource.jsp").forward(request, response);
		}else{
			out.println("<script>alert('该信息不存在！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}