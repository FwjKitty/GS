package servlet.front.users;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import dao.User;

import beans.Admins;
import beans.Users;


@SuppressWarnings({ "serial", "deprecation" })
public class UpdateUser extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings({ "unchecked" })
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String head = null;
		//设置保存上传文件的目录
		String uploadDir = getServletContext().getRealPath("/head");
		if (uploadDir == null) {
			out.println("无法访问存储目录！");
			return;
		}
		File fUploadDir = new File(uploadDir);
		if (!fUploadDir.exists()) {
			if (!fUploadDir.mkdir()) {
				out.println("无法创建存储目录!");
				return;
			}
		}

		if (!DiskFileUpload.isMultipartContent(request)) {
			out.println("只能处理multipart/form-data类型的数据!");
			return;
		}

		DiskFileUpload fu = new DiskFileUpload();

		//设置上传的普通字段的名称和文件字段的文件名所采用的字符集编码
		fu.setHeaderEncoding("UTF-8");

		//得到所有表单字段对象的集合
		List fileItems = null;
		try {
			fileItems = fu.parseRequest(request);
		} catch (FileUploadException e) {
			out.println("<script language='javascript'>alert('解析数据时出现错误！');history.go(-1);</script>");
			return;
		}

		//处理每个表单字段
		Iterator i = fileItems.iterator();
		while (i.hasNext()) {
			FileItem fi = (FileItem) i.next();
			if (fi.isFormField()) {
				String content1 = fi.getString("UTF-8");
				String fieldName = fi.getFieldName();
				request.setAttribute(fieldName, content1);
			} else {
				try {
					String pathSrc = fi.getName();
					/*如果用户没有在FORM表单的文件字段中选择任何文件，那么忽略对该字段项的处理*/
					if (pathSrc.trim().equals("")) {
						continue;
					}
					head = fi.getName();
					fi.write(new File(uploadDir, head));
				}catch (Exception e) {
					out.println("<script language='javascript'>alert('存储文件时出现错误！');history.go(-1);</script>");
					return;
				}finally
				{
					fi.delete();
				}
			}
		}
		
		String un = (String) request.getAttribute("un");
		String operation = (String) request.getAttribute("operation");
		Users user = new Users();
		user.setUn((String) request.getAttribute("un"));
		user.setPw((String) request.getAttribute("pw"));
		if(head == null){
			user.setHead((String) request.getAttribute("head"));
		}else{
			head = "head\\"+head;
			user.setHead(head);
		}
		user.setName((String) request.getAttribute("name"));
		user.setContact((String) request.getAttribute("contact"));
		user.setIntroduction((String) request.getAttribute("introduction"));
//		Date time = null;
//		try {
//			SimpleDateFormat sd = new SimpleDateFormat( "yyyy-MM-dd" );
//			java.util.Date date = sd.parse(request.getParameter("time"));
//			time = new Date(date.getTime());
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		user.setTime(time);
		int result = new User().update(un, user);
		/**
		 * 若operation=admin_update 管理员修改用户资料
		 * 若operation=person 用户修改资料
		 */
		if(result != 0){
			if("admin_update".equals(operation)){
				HttpSession session = request.getSession();
				Admins admin = (Admins)session.getAttribute("admin");
				response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw()+"&value="+admin.getValue());
			}else if("user_update".equals(operation)){
				RequestDispatcher rd = request.getRequestDispatcher("QueryByUn?un=" + un + "&pw=" + user.getPw() + "&operation=" + operation);
				rd.forward(request, response);
			}
		}else{
			out.print("<script>alert('修改用户" + un + "资料失败，请重新修改！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}