package servlet.admin.users;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

import dao.User;
import beans.Users;

@SuppressWarnings("serial")
public class AddUser extends HttpServlet {

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

		String head = "";
		
		// 设置保存上传文件的目录
		String uploadDir = getServletContext().getRealPath("/file/user/head");
		if (uploadDir == null) {
			System.out.println("无法访问存储目录！");
			return;
		}
		File fUploadDir = new File(uploadDir);
		if (!fUploadDir.exists()) {
			if (!fUploadDir.mkdir()) {
				System.out.println("无法创建存储目录!");
				return;
			}
		}

		if (!DiskFileUpload.isMultipartContent(request)) {
			System.out.println("只能处理multipart/form-data类型的数据!");
			return;
		}

		DiskFileUpload fu = new DiskFileUpload();
		// 最多上传200M数据
		fu.setSizeMax(1024 * 1024 * 200);
		// 超过1M的字段数据采用临时文件缓存
		fu.setSizeThreshold(1024 * 1024);

		// 设置上传的普通字段的名称和文件字段的文件名所采用的字符集编码
		fu.setHeaderEncoding("UTF-8");

		// 得到所有表单字段对象的集合
		List fileItems = null;
		try {
			fileItems = fu.parseRequest(request);
		} catch (FileUploadException e) {
			out.println("<script language='javascript'>alert('修改失败!请按要求修改');history.go(-1);</script>");
			return;
		}

		// 处理每个表单字段
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
					//如果用户没有在FORM表单的文件字段中选择任何文件， 那么忽略对该字段项的处理
					if (pathSrc.trim().equals("")) {
						continue;
					}

					// 对上传的图片进行重新命名
					String fileName = fi.getName();
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
					String middlename = sdf.format(new Date(System.currentTimeMillis()));
					String lastname = Math.round(Math.random() * 1000) + "";
					String localFileName = middlename + lastname + "."+ fileExt;
					fi.write(new File(uploadDir, localFileName));
					head = "file\\user\\head\\"+localFileName;
				} catch (Exception e) {
					out.println("<script language='javascript'>alert('添加失败!');history.go(-1);</script>");
					return;
				} finally // 总是立即删除保存表单字段内容的临时文件
				{
					fi.delete();
				}
			}
		}
		
		Users user = new Users();
		user.setUn((String) request.getAttribute("un"));
		user.setPw((String) request.getAttribute("pw"));
		user.setName((String) request.getAttribute("name"));
		user.setHead(head);
		user.setContact((String) request.getAttribute("contact"));
		user.setIntroduction((String) request.getAttribute("introduction"));
		user.setTime(new Date(System.currentTimeMillis()));

		if(!user.getUn().equals(User.queryByUn(user.getUn()).getUn())){
			User.add(user);
			request.getRequestDispatcher("FindAllUser?page=1").forward(request, response);
		}else{
			out.println("<script language='javascript'>alert('该帐号已经存在！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}