package servlet.front.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Description;

import beans.Descriptions;

@SuppressWarnings("serial")
public class Main extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		List<Descriptions> list_description = new ArrayList<Descriptions>();
		list_description = Description.queryAll();
		request.setAttribute("list_description", list_description);
		if(null == request.getSession().getAttribute("user")){
			RequestDispatcher rd = request.getRequestDispatcher("front/index.jsp");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("front/main.jsp");
			rd.forward(request, response);
		}
	}
}