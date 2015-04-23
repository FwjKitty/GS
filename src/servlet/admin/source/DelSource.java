package servlet.admin.source;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Sources;

import dao.Source;


@SuppressWarnings("serial")
public class DelSource extends HttpServlet {

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
		
		String id = request.getParameter("id");
		String kind = request.getParameter("kind");
		
		Sources source = Source.queryById(Integer.parseInt(id), kind);
		int result = Source.delete(Integer.parseInt(id),kind);
		
		if(result > 0){
			String filename = getServletContext().getRealPath(source.getFileName());
			Source.delFile(filename);
			response.sendRedirect("FindAllSource?page=1&kind="+kind);
		}else{
			out.print("<script>alert('删除失败，请重新删除！');history.go(-1);location.reload();</script>");
		}
		out.flush();
		out.close();
	}
}