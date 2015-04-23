package servlet.front.sources;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Source;


import beans.Sources;

@SuppressWarnings("serial")
public class QueryByName extends HttpServlet {

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
		
		String id = new String(request.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
		String kind = (String) request.getParameter("kind");
		Sources resource = Source.query(Integer.parseInt(id),kind);
		if(resource.getFileName() != null){
			request.setAttribute("resource", resource);
			request.setAttribute("kind", kind);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/resource/updateResource.jsp");
			rd.forward(request, response);
		}else{
			out.print("<script>alert('修改失败，请重新尝试！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}