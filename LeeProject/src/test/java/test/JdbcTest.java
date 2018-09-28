package test;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.lee.service.UserService;

public class JdbcTest {

	@Autowired
	private UserService userService;
	
	public static void main(String[] args) {
		System.out.println("jdbc_url=jdbc:mysql://192.168.232.132:3306/db1?useUnicode=true&characterEncoding=UTF-8\r\n"
				+ "jdbc_username=root\r\n" + "jdbc_password=123456");

	}

	public static String test() {
		String url = "jdbc:mysql://192.168.232.132:3306/db1?useUnicode=true&characterEncoding=UTF-8";
		String name = "root";
		String pwd = "123456";
		// 定义连接
		Connection connection = null;
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			// 加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, name, pwd);
			return "Ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@Test
	public void writeJDBC() throws IOException {
		File file = new File("src/main/resources/db.properties");
		System.out.println(file);
		PrintWriter pw = new PrintWriter(file);
		String dbconfig = "jdbc_url=jdbc:mysql://192.168.232.132:3306/db1?useUnicode=true&characterEncoding=UTF-8\r\n"
				+ "jdbc_username=root\r\n" + "jdbc_password=1234wqe56";
		pw.write(dbconfig);
		pw.close();
		System.out.println("写出完毕");
		// PrintWriter pw = null;
		// System.out.println(this.getClass().getResource("/db.properties"));
		// Properties props = Resources.getResourceAsProperties("db.properties");
		// System.out.println(props.get("jdbc_url"));
		// props.setProperty("jdbc_url", "123");
		// System.out.println(props.get("jdbc_url"));
		// System.out.println("修改完毕");
		// Properties pro = new Properties();
		// FileInputStream fis = null;
		// String path =
		// jdbcTest.class.getClassLoader().getResource("db.properties").getFile();
		// // 路径中有空格，路径会将空格自动转为 %20，所以把他替换为了空格
		// path = path.replace("%20", " ");
		// File file = new File(path);
		// BufferedInputStream bis = null;
		// try {
		// fis = new FileInputStream(file);
		// bis = new BufferedInputStream(fis);
		// pro.load(bis);
		// FileOutputStream fos = new FileOutputStream(file);
		// pro.setProperty("jdbc_url", "123");
		// pro.store(fos, null);
		// fos.close();
		// System.out.println("修改完毕");
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		// String path =
		// jdbcTest.class.getClassLoader().getResource("db.properties").getFile();
		// // 路径中有空格，路径会将空格自动转为 %20，所以把他替换为了空格
		// path = path.replace("%20", " ");
		// File file = new File(path);
		//// String file1 = this.getClass().getResource("db.properties").getFile();
		//// File file = new File(this.getClass().getClassLoader().getResource());
		// String
		// dbconfig="jdbc_url=jdbc:mysql://192.168.232.132:3306/db1?useUnicode=true&characterEncoding=UTF-8\r\n"
		// +
		// "jdbc_username=root\r\n" +
		// "jdbc_password=1234wqe56";
		// PrintWriter pw = null;
		// try {
		// pw = new PrintWriter(file);
		// } catch (FileNotFoundException e) {
		// e.printStackTrace();
		// }
		// pw.write(dbconfig);
		// pw.close();// 这个主要是结束打印文本
		// System.out.println("写出完毕");
	}

	@Test
	public void test2() {
		String s = "jdbc_url=jdbc:mysql://192.168.232.132:3306/db1?useUnicode=true&characterEncoding=UTF-8";
		String s1 = "jdbc_username=root";
		String s2 = "jdbc_password=123456";
		String ip = s.substring(s.indexOf("//")+2, s.lastIndexOf(":"));
		String port = s.substring(s.lastIndexOf(":")+1, s.lastIndexOf("/"));
		String db = s.substring(s.lastIndexOf("/")+1, s.lastIndexOf("?"));
		String name = s1.substring(s.indexOf("=")+1);
		String pwd = s2.substring(s.indexOf("=")+1);
		//		System.out.println(s.indexOf("//"));
		System.out.println(ip);
		System.out.println(port);
		System.out.println(db);
		System.out.println(name);
		System.out.println(pwd);

	}
	
	@Test
	public void test3() {
		Properties prop=new Properties();
		//获取文件的输入流
		InputStream ips=this.getClass().getClassLoader()
				.getResourceAsStream("db.properties");
		try {
			//把文件通过流加载进来
			prop.load(ips);
			//从prop中获取数据库连接参数
//			String s = "jdbc:mysql://192.168.232.132:3306/db1?useUnicode=true&characterEncoding=UTF-8";
//			String s1 = "root";
//			String s2 = "123456";
			String s = prop.getProperty("jdbc_url");
			String s1 = prop.getProperty("jdbc_username");
			String s2 = prop.getProperty("jdbc_password");
			String ip = s.substring(s.indexOf("//")+2, s.lastIndexOf(":"));
			String port = s.substring(s.lastIndexOf(":")+1, s.lastIndexOf("/"));
			String db = s.substring(s.lastIndexOf("/")+1, s.lastIndexOf("?"));
			String name = s1;
			String pwd = s2;
			System.out.println(ip);
			System.out.println(port);
			System.out.println(db);
			System.out.println(name);
			System.out.println(pwd);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


}
