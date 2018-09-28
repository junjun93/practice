package test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 读取图片名称
 * @author Lee
 *
 */
public class PathTest {

	public static void main(String[] args) {
		System.out.println(System.getProperty("user.dir"));
//		String webRoot = request.getSession().getServletContext().getRealPath("/");
//		if (webRoot == null) {
//			webRoot = this.getClass().getClassLoader().getResource("/").getPath();
//		System.out.println(System.getProperty("user.dir"));
//		System.out.println(getWebRoot());
//		System.out.println(PathTest.class.getResource("")+"————————————————————");
//		System.out.println(getClass().getResource("/")+"————————————————————");
//		System.out.println(getClass().getClassLoader().getResource("")+"————————————————————");
//		System.out.println(getClass().getClassLoader().getResource("/")+"————————————————————");
		System.out.println(PathTest.class.getClassLoader().getResource("").getPath()+"————————————————————");
//		System.out.println(request.getContextPath()+"————————————————————");
//		System.out.println(Thread.currentThread().getContextClassLoader().getResource("").getPath().replaceAll("%20", " ")+"————————————————————");
	}
	
	//获取本地项目根目录
	public static String getWebRoot() {
//		String webRoot = request.getSession().getServletContext().getRealPath("/");
		String webRoot = Thread.currentThread().getContextClassLoader().getResource("").getPath().replaceAll("%20", " ");
	    if(webRoot == null){
	        webRoot = Thread.currentThread().getContextClassLoader().getResource("").getPath().replaceAll("%20", " ");
	        webRoot = webRoot.substring(0,webRoot.indexOf("WEB-INF"));
	    }
	    return webRoot;
	}

}
