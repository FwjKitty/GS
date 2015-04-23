package servlet.front.courses;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import dao.Source;


import beans.Admins;
import beans.Sources;
import beans.Users;

@SuppressWarnings({ "serial", "deprecation" })
public class AddResource extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request, response);
	}
	
	@SuppressWarnings({"unchecked" })
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Sources resource = new Sources();
		
		String filename = null;
		//设置保存上传文件的目录
		String uploadDir = getServletContext().getRealPath("/sources");
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
					filename = fi.getName();
					fi.write(new File(uploadDir, filename));
				}catch (Exception e) {
					out.println("<script language='javascript'>alert('存储文件时出现错误！');history.go(-1);</script>");
					return;
				}finally
				{
					fi.delete();
				}
			}
		}
		
		resource.setFileName(filename);
		resource.setUn((String) request.getAttribute("un"));
		resource.setTime(new Date(System.currentTimeMillis()));
		int result = new Source().add(resource,(String) request.getAttribute("kind"));
		
		/*
		 * 首先判断数据是否保存成功
		 * 	若（result>0）保存成功 则判断是后台添加还是用户添加
		 * 		若（operation=add）后台添加 则返回后台
		 * 		若（operation=person）用户添加 则返回个人主页
		 * 	若（else）保存不成功 则显示添加出错
		 */
		if (result > 0) {
			if("add".equals((String)request.getAttribute("operation"))){
				HttpSession session = request.getSession();
				Admins admin = (Admins)session.getAttribute("admin");
				response.sendRedirect("AdminLogin?un="+admin.getUn()+"&pw="+admin.getPw());
			}else if("person".equals((String)request.getAttribute("operation"))){
				HttpSession session = request.getSession();
				Users user = (Users)session.getAttribute("user");
				response.sendRedirect("jsp/main/person.jsp?un="+user.getUn()+"&pw="+user.getPw());
			}
			
		} else {
			out.println("<script language='javascript'>alert('添加失败，请重新添加！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}