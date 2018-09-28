package com.lee.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lee.mybatisGenerator.MybatisGeneratorUtil;
import com.lee.utils.AddressUtils;
import com.lee.utils.Base64Util;
import com.lee.utils.CurrencyUtil;
import com.lee.utils.DeleteFileUtil;
import com.lee.utils.JSONUtil;
import com.lee.utils.PropertiesUtil;
import com.lee.utils.ResponseUtils;
import com.lee.utils.TranslationUtils;
import com.lee.utils.ZipUtil;
import com.lee.utils.excelUnits.ExcelToSQL;
import com.lee.utils.excelUnits.ExcelUtils;
import com.lee.utils.excelUnits.Table;

import oracle.jdbc.driver.OracleDriver;

@Controller
@RequestMapping("/tool")
public class ToolController implements Runnable {
	private static final Logger log = Logger.getLogger(ToolController.class);
	@Value("${a}")
	private String jdbc;
	// protected static final String FILEPATH = "E:/upload/";
	protected static final String FILEPATH = getWebRoot() + File.separator + "others\\";
	// protected static final String FILEPATH =
	// "/home/apacheTomcat-Fupin-8.0.50/censusInfo/";

	// 获取项目根目录
	public static String getWebRoot() {
		String webRoot = Thread.currentThread().getContextClassLoader().getResource("").getPath().replaceAll("%20",
				" ");
		webRoot = webRoot.substring(0, webRoot.indexOf("WEB-INF"));
		if (webRoot == null) {
			webRoot = Thread.currentThread().getContextClassLoader().getResource("").getPath().replaceAll("%20", " ");
			webRoot = webRoot.substring(0, webRoot.indexOf("WEB-INF"));
		}
		return webRoot;
	}

	private String fileName;
	private Date uploadTime;
	private String status;
	private File newFile;
	private String dbType;

	public String getDbType() {
		return dbType;
	}

	public void setDbType(String dbType) {
		this.dbType = dbType;
	}

	public File getNewFile() {
		return newFile;
	}

	public void setNewFile(File newFile) {
		this.newFile = newFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	ExcelUtils r = new ExcelUtils();
	ExcelToSQL eq = new ExcelToSQL();

	@RequestMapping("/{page}")
	// 如果参数名一样可以不用定义value
	public String tool(@PathVariable(value = "page") String page) {
		System.out.println(jdbc + "——————");
		return "tool/" + page;
	}

	// 生成base64
	@RequestMapping("/generateBase64/{in}")
	@ResponseBody
	public String generateBase64(@PathVariable String in) {
		return Base64Util.getBase64(in);
	}

	// 解析base64
	@RequestMapping("/parseBase64/{in}")
	@ResponseBody
	public String parseBase64(@PathVariable String in) {
		return Base64Util.getFromBase64(in);
	}

	// 英汉翻译
	@RequestMapping(value="/translation/{in}")
	@ResponseBody
	public String translation(@PathVariable String in) throws Exception {
		String result=TranslationUtils.getTranslateResult(in);
		System.out.println(result + "——————");
		return result;
	}

	// 人民币大写转换
	// @RequestMapping(value
	// ="/toChinaUpperMoney/{in}",produces="text/plain;charset=UTF-8")
	@RequestMapping("/toChinaUpperMoney/{in}")
	@ResponseBody
	public String toChinaUpperMoney(@PathVariable String in) {
		CurrencyUtil c = new CurrencyUtil();
		String chinaUpperMoney = null;
		try {
			chinaUpperMoney = c.toChinaUpper(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(chinaUpperMoney + "——————");
		return chinaUpperMoney;
	}

	@RequestMapping("/generator")
	public void generator(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String type = request.getParameter("type");
		String ip = request.getParameter("ip");
		String port = request.getParameter("port");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String DBorInstance = request.getParameter("DBorInstance");
		String tableName = request.getParameter("tableName");
		String domainObjectName = request.getParameter("domainObjectName");

		Map<String, Object> result = new HashMap<String, Object>();
		String url = "jdbc:mysql://" + ip + ":" + port + "/" + DBorInstance;
		String dbconfig = url + "<br/>jdbc_username=" + name + "<br/>jdbc_password=********";
		Connection connection = null;
		// 定义连接
		connection = null;
		try {
			if (type.indexOf("MySQL") != -1) {
				// 加载驱动
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(url, name, pwd);
			} else if (type.indexOf("Oracle") != -1) {
				Driver driver = new OracleDriver();
				DriverManager.deregisterDriver(driver);
				Properties pro = new Properties();
				pro.put("user", name);
				pro.put("password", pwd);
				connection = driver.connect("jdbc:oracle:thin:@" + ip + ":" + port + ":" + DBorInstance, pro);
				// if (connection != null) {
				// System.out.println("OK————————————————————");
				// // result.put("info", "连接成功！你的连接信息:" + "<br/>" + dbconfig);
				// }
			}
			ResultSet rs = connection.getMetaData().getTables(null, null, tableName, null);
			if (rs.next()) {
				System.out.println("表存在!!!");
				PropertiesUtil p = new PropertiesUtil("mybatis_generator.properties");
				System.out.println(p.getProperties().get("tableName"));
				if (type.indexOf("MySQL") != -1) {
					p.writeProperty("jdbc_driver", "com.mysql.jdbc.Driver");
					p.writeProperty("jdbc_url",
							"jdbc:mysql://" + ip + ":" + port + "/" + DBorInstance + "?serverTimezone=UTC");
				} else if (type.indexOf("Oracle") != -1) {
					p.writeProperty("jdbc_driver", "oracle.jdbc.driver.OracleDriver");
					p.writeProperty("jdbc_url", "jdbc:oracle:thin:@" + ip + ":" + port + ":" + DBorInstance);
				}
				p.writeProperty("jdbc_username", name);
				p.writeProperty("jdbc_password", pwd);
				p.writeProperty("tableName", tableName);
				p.writeProperty("domainObjectName", domainObjectName);
				p.writeProperty("targetProject", FILEPATH);
				String todayTime = new SimpleDateFormat("yyMMdd-HHmmss").format(new Date());
				p.writeProperty("modelPackage", "Generator" + todayTime);
				p.writeProperty("sqlMapperPackage", "Generator" + todayTime);
				p.writeProperty("daoMapperPackage", "Generator" + todayTime);
				System.out.println(p.getProperties().get("tableName"));
				MybatisGeneratorUtil mybatisGeneratorUtil = new MybatisGeneratorUtil();
				mybatisGeneratorUtil.generator();
				File[] files = new File(FILEPATH + "Generator" + todayTime + File.separator).listFiles();
				List<File> srcfile = Arrays.asList(files);
				// 压缩后的文件
				File zipfile = new File(FILEPATH + "Generator" + todayTime + ".zip");
				ZipUtil.zipFiles(srcfile, zipfile);
				log.info("生成完毕！！！——————————————");
				System.out.println("生成完毕！！！——————————————");
				DeleteFileUtil dfu = new DeleteFileUtil();
				System.out.println(dfu.forceDelete(FILEPATH + "Generator" + todayTime) + "——————");
				result.put("status", "ok");
				result.put("fileName", zipfile.getName());
				// download(zipfile.getName(), request, response);
			} else {
				System.out.println("表不存在!!!");
				result.put("status", "error");
				result.put("info", "该数据库中不存在该表!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "error");
			result.put("info", "异常，连接失败！请检查你的数据配置信息<br>" + e.getMessage());
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
		System.out.println(result);
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	@RequestMapping("/getInfoByIP")
	public void getInfoByIP(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String ip = request.getParameter("ip").trim();
		AddressUtils au = new AddressUtils();
		String IPinfo = "";
		try {
			IPinfo = au.getJson("ip=" + ip, "UTF8");
		} catch (Exception e) {
			e.printStackTrace();
			IPinfo = e.getCause().toString();
		}
		// 返回结果
		ResponseUtils.renderJson(response, JSONUtil.object2String(IPinfo));
	}

	/**
	 * 文件上传
	 */
	@RequestMapping("/uploadFile")
	public String uploadFile(MultipartFile file, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// 上传文件的文件夹位置
		// String rootPath =
		// request.getSession().getServletContext().getRealPath("uploads/");
		String path = FILEPATH;
		// 原始名称
		String originalFileName = file.getOriginalFilename();
		// 新文件名
		String newFileName = originalFileName;
		// 新文件
		File newFile = new File(path + File.separator + newFileName);
		// 判断目标文件所在目录是否存在
		if (!newFile.getParentFile().exists()) {
			// 如果目标文件所在的目录不存在，则创建父目录
			newFile.getParentFile().mkdirs();
		}
		// 将内存中的数据写入磁盘
		file.transferTo(newFile);
		// result.put("status", "ok");
		// 完整的url
		// String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH)+1)
		// + "/" + newFileName;
		return "redirect:tool/fileManager";
	}

	/**
	 * 文件下载
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(@RequestParam(value = "filename") String filename, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// request.getSession().getServletContext().getRealPath("statics\\upload")+"\\"+filename;
		String path = FILEPATH + filename;

		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
		// 转码，免得文件名中文乱码
		filename = URLEncoder.encode(filename, "UTF-8");
		response.setContentType("multipart/form-data");

		// 设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename=" + filename);
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
		bis.close();
	}

	// 下载Excel模板文件
	@RequestMapping("/downloadTemp")
	public void downloadTemp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("others\\temp.xlsx");
		String filename = "temp.xlsx";

		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
		// 转码，免得文件名中文乱码
		filename = URLEncoder.encode(filename, "UTF-8");
		response.setContentType("multipart/form-data");

		// 设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename=" + filename);
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
		bis.close();

	}

	// Excel转换SQL
	@RequestMapping("parseExcel")
	public void parseExcel(@RequestParam("dbType") String dbType, MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		Map<String, Object> result = new HashMap<String, Object>();
		String path = FILEPATH;// 上传的路径
		String originalFileName = file.getOriginalFilename();
		// 新文件名
		String sqlFileName = originalFileName.replaceAll(".xlsx", ".sql").replaceAll(".xls", ".sql");
		// String dateDirs = new SimpleDateFormat("yyMMddHHmmss").format(new Date());
		// 新文件
		File newFile = new File(path + File.separator + originalFileName);
		// 判断目标文件所在目录是否存在
		if (!newFile.getParentFile().exists()) {
			// 如果目标文件所在的目录不存在，则创建父目录
			newFile.getParentFile().mkdirs();
		}
		// 将内存中的数据写入磁盘
		file.transferTo(newFile);
		String msg = eq.checkNull(newFile.getPath(), dbType);
		// System.out.println(msg);
		if (msg.indexOf("error:") != -1) {
			result.put("status", "error");
			result.put("info", msg.replaceAll("\r\n", "<br/>"));
			// System.out.println(forceDelete(newFile)+"——————");
		} else {
			// 生成SQL文件
			ToolController tc = new ToolController();
			tc.setNewFile(newFile);
			tc.setDbType(dbType);
			Thread thread = new Thread(tc);
			thread.start();
			result.put("status", "ok");
			DeleteFileUtil dfu = new DeleteFileUtil();
			System.out.println(dfu.forceDelete(newFile.getPath()) + "——————");
		}
		// newFile.delete();// 删除表格文件
		// new File(sqlFile).delete();// 删除SQL文件
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	public void run() {
		String path = FILEPATH;
		// String dateDirs = new SimpleDateFormat("yyMMddHHmmss").format(new Date());
		String sqlFileName = newFile.getName().replaceAll(".xlsx", ".sql").replaceAll(".xls", ".sql");
		List<List<String>> lines = r.parseExcel(newFile.getPath());
		List<Table> tables = eq.tableMaker(lines);
		File sqlFile = new File(path + File.separator + sqlFileName);
		// if (!new File(sqlFile).getParentFile().exists()) {
		// // 如果目标文件所在的目录不存在，则创建父目录
		// new File(sqlFile).getParentFile().mkdirs();
		// }
		PrintWriter pw = null;
		try {
			pw = new PrintWriter(sqlFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		String sqls = null;
		if (dbType.indexOf("MySQL") != -1) {
			sqls = eq.MySQLMaker(tables);
		} else {
			sqls = eq.OracleMaker(tables);
		}
		// System.out.println(dbType);
		// System.out.println(sqls);
		pw.write(sqls);
		pw.close();
	}

	// 测试数据库连接性
	@RequestMapping("/testJDBC")
	public void testJDBC(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		String ip = request.getParameter("ip");
		String port = request.getParameter("port");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String DBorInstance = request.getParameter("DBorInstance");

		Map<String, Object> result = new HashMap<String, Object>();
		String url = "jdbc:mysql://" + ip + ":" + port + "/" + DBorInstance;
		String dbconfig = url + "<br/>jdbc_username=" + name + "<br/>jdbc_password=********";
		Connection connection = null;
		if (type.indexOf("MySQL") != -1) {
			// 定义连接
			connection = null;
			try {
				// 加载驱动
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(url, name, pwd);
				System.out.println(connection + "OK————————————————————");
				if (connection != null) {
					result.put("status", "ok");
					result.put("info", "连接成功！你的连接信息:" + "<br/>" + dbconfig);
				}
			} catch (Exception e) {
				e.printStackTrace();
				result.put("status", "error");
				result.put("info", "异常，连接失败！请检查你的数据配置信息" + e.getMessage());
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
			}
		} else if (type.indexOf("Oracle") != -1) {
			try {
				Driver driver = new OracleDriver();
				DriverManager.deregisterDriver(driver);
				Properties pro = new Properties();
				pro.put("user", name);
				pro.put("password", pwd);
				connection = driver.connect("jdbc:oracle:thin:@" + ip + ":" + port + ":" + DBorInstance, pro);
				if (connection != null) {
					System.out.println("OK————————————————————");
					result.put("status", "ok");
					result.put("info", "连接成功！你的连接信息:" + "<br/>" + dbconfig);
				}
			} catch (Exception e) {
				e.printStackTrace();
				result.put("status", "error");
				result.put("info", "异常，连接失败！请检查你的数据配置信息" + e.getMessage());
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
			}
		}
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	@RequestMapping("/writeJDBC")
	public void writeJDBC(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		String webRoot = request.getSession().getServletContext().getRealPath("/");
		String ip = request.getParameter("ip");
		String port = request.getParameter("port");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String db = request.getParameter("db");
		File file = new File(webRoot + "\\WEB-INF\\classes\\jdbc.properties");
		System.out.println(webRoot + "______________________________________________");
		System.out.println(file.exists() + "______________________________________________");
		PrintWriter pw = null;
		String dbconfig = "validationQuery:SELECT 1\r\njdbc_url=jdbc:mysql://" + ip + ":" + port + "/" + db
				+ "?useUnicode=true&characterEncoding=UTF-8\r\n" + "jdbc_username=r" + name + "\r\n" + "jdbc_password="
				+ pwd;
		try {
			pw = new PrintWriter(file);
			pw.write(dbconfig);
			result.put("status", "ok");
			result.put("info", "写入完毕！");
		} catch (IOException e) {
			e.printStackTrace();
			result.put("status", "ok");
			result.put("info", "写入失败！" + e.getCause());
		} finally {
			try {
				if (pw != null) {
					pw.close();
				}
			} catch (Exception ioe) {
				System.out.println("Error in closing the Stream");
			}
		}
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	@RequestMapping("/DBTest")
	public String DBTest(ModelMap result, HttpServletRequest request, HttpServletResponse response) {
		Properties prop = new Properties();
		// 获取文件的输入流
		InputStream ips = this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		try {
			// 把文件通过流加载进来
			prop.load(ips);
			// 从prop中获取数据库连接参数
			String s = prop.getProperty("jdbc_url").replaceAll("%2B", "+");
			String s1 = prop.getProperty("jdbc_username");
			String s2 = prop.getProperty("jdbc_password");
			String ip = s.substring(s.indexOf("//") + 2, s.lastIndexOf(":"));
			String port = s.substring(s.lastIndexOf(":") + 1, s.lastIndexOf("/"));
			String db = null;
			if (s.indexOf("?") != -1) {
				db = s.substring(s.lastIndexOf("/") + 1, s.lastIndexOf("?"));
			} else {
				db = s.substring(s.lastIndexOf("/") + 1);
			}
			String name = s1;
			String pwd = s2;
			result.put("dbconfig", s);
			result.put("ip", ip);
			result.put("port", port);
			result.put("db", db);
			result.put("name", name);
			result.put("pwd", pwd);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ips != null) {
					ips.close();
				}
			} catch (IOException ioe) {
				System.out.println("Error in closing the Stream");
			}
		}

		return "tool/DBTest";
	}

	// 下载Excel文件
	public void downloadFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Map<String, Object> result = new HashMap<String, Object>();
		// String id = request.getParameter("id");

		String path = FILEPATH;
		String fileName = "20180905171256新建文本文档.xlsx";
		// 1、设置response 响应头
		response.reset();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(fileName, "UTF-8"));

		File file = new File(path, fileName);
		System.out.println(file + "——————————————————————");
		// 2、 读取文件--输入流
		InputStream input = new FileInputStream(file);
		// 3、 写出文件--输出流
		OutputStream out = response.getOutputStream();
		byte[] buff = new byte[1024];
		int index = 0;
		// 4、执行 写出操作
		while ((index = input.read(buff)) != -1) {
			out.write(buff, 0, index);
			out.flush();
		}
		out.close();
		input.close();
	}
}
