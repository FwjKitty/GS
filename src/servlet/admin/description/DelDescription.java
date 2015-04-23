package servlet.admin.description;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Descriptions;

import dao.Description;

@SuppressWarnings("serial")
public class DelDescription extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		Descriptions description = Description.queryById(Integer.parseInt(request.getParameter("id")));
		int result = Description.del(Integer.parseInt(request.getParameter("id")));
		
		if(result > 0){
			String image = description.getImage();
			image = getServletContext().getRealPath(description.getImage());
			String introduce = description.getIntroduce();
			introduce = getServletContext().getRealPath(description.getIntroduce());
			Description.delFile(image, introduce);
			response.sendRedirect("FindAllDescription?page=1");
		}else{
			out.print("<script>alert('删除失败');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}

}
