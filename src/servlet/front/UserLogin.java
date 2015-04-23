package servlet.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Description;
import dao.User;

import beans.Descriptions;
import beans.Users;

@SuppressWarnings("serial")
public class UserLogin extends HttpServlet {

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
		String un = "";
		String pw = "";
		
		//获取验证码
		String valcode = request.getSession().getAttribute("valcode").toString();
		//获取用户填写的验证码
		String vcode = request.getParameter("vcode");
		/**
		 * 判断验证码是否正确
		 */
		if(valcode.equalsIgnoreCase(vcode)){
			HttpSession session = request.getSession(true);
			
			un = (String) request.getParameter("un");
			pw = (String) request.getParameter("pw");
			Users user = User.queryByUn(un);
			if(user.getUn() != null){
				if(pw.equals(user.getPw())){
					List<Descriptions> list_description = Description.queryAll();
					session.setAttribute("user", user);
					request.setAttribute("list_description", list_description);
					request.getRequestDispatcher("Main?page=1").forward(request, response);
				}else{
					out.print("<script>alert('密码与用户帐号不匹配！');history.go(-1);</script>");
				}
			}else{
				out.print("<script>alert('该用户不存在！');history.go(-1);</script>");
			}
		}else{
			out.println("<script language='javascript'>alert('验证码错误！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}