package servlet.admin.course;

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

import dao.Course;

import beans.Courses;

@SuppressWarnings({ "serial"})
public class UpdateCourse extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	@SuppressWarnings({"unchecked"})
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String file = null;
		// 设置保存上传文件的目录
		String uploadDir = getServletContext().getRealPath("/file/course");
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
			out.println("<script language='javascript'>alert('修改失败!请按要求修改');</script>");
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
					String fileName = "";
					fileName = fi.getName();
					//如果用户没有在FORM表单的文件字段中选择任何文件， 那么忽略对该字段项的处理
					if (fileName.equals("")) {
						continue;
					}
					// 对上传的图片进行重新命名
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
					String middlename = sdf.format(new Date(System.currentTimeMillis()));
					String lastname = Math.round(Math.random() * 1000) + "";
					String localFileName = middlename + lastname + "." + fileExt;
					fi.write(new File(uploadDir, localFileName));
					file = "file\\course\\"+localFileName;
				} catch (Exception e) {
					out.println("<script language='javascript'>alert('修改失败!请按要求修改');window.location.href='GetClubs?id='"+(String) request.getAttribute("id")+"';</script>");
					return;
				} finally // 总是立即删除保存表单字段内容的临时文件
				{
					fi.delete();
				}
			}
		}
		if(file == null){
			file = (String) request.getAttribute("filename");
		}else{
			String path = (String) request.getAttribute("filename");
			String path1 = getServletContext().getRealPath(path);
			File file1 = new File(path1);
			if (file1.exists()) {
				file1.delete();
				System.out.println("删除资源文件完成！ ");
			} else
				System.out.println("很抱歉,发生不可预料错误,您的文件删除操作没能成功! ");
		}
		
		String id = (String) request.getAttribute("id");
		String kind = (String) request.getAttribute("kind");
		Courses course = new Courses();
		course.setTitle((String)request.getAttribute("title"));
		course.setIntroduction((String)request.getAttribute("introduction"));
		course.setFileName(file);
		course.setUn((String) request.getAttribute("un"));
		course.setTime(new Date(System.currentTimeMillis()));
		course.setCourse_id(Integer.parseInt((String) request.getAttribute("course_id")));
		int result = Course.update(course, Integer.parseInt(id), kind+"_course");
		if(result != 0){
			response.sendRedirect("FindAllCourse?page=1&kind="+kind);
		}else{
			out.print("<script>alert('修改失败，请重新修改！');history.go(-1);</script>");
		}
		out.flush();
		out.close();
	}
}