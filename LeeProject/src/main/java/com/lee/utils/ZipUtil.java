package com.lee.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipOutputStream;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Expand;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

public class ZipUtil {

	/**
	 *
	 * @param file    要压缩的文件
	 * @param zipFile 压缩文件存放地方
	 */
	public static void zip(File file, File zipFile) {
		ZipOutputStream outputStream = null;
		try {
			outputStream = new ZipOutputStream(new FileOutputStream(zipFile));
			zipFile(outputStream, file, "");
			if (outputStream != null) {
				outputStream.flush();
				outputStream.close();
			}
		} catch (IOException ex) {
			Logger.getLogger(ZipUtil.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				outputStream.close();
			} catch (IOException ex) {
				Logger.getLogger(ZipUtil.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
	}

	/**
	 *
	 * @param output   ZipOutputStream对象
	 * @param file     要压缩的文件或文件夹
	 * @param basePath 条目根目录
	 */
	private static void zipFile(ZipOutputStream output, File file, String basePath) {
		FileInputStream input = null;
		try {
			// 文件为目录
			if (file.isDirectory()) {
				// 得到当前目录里面的文件列表
				File list[] = file.listFiles();
				basePath = basePath + (basePath.length() == 0 ? "" : "/") + file.getName();
				// 循环递归压缩每个文件
				for (File f : list) {
					zipFile(output, f, basePath);
				}
			} else {
				// 压缩文件
				basePath = (basePath.length() == 0 ? "" : basePath + "/") + file.getName();
				// System.out.println(basePath);
				output.putNextEntry(new ZipEntry(basePath));
				input = new FileInputStream(file);
				int readLen = 0;
				byte[] buffer = new byte[1024 * 8];
				while ((readLen = input.read(buffer, 0, 1024 * 8)) != -1) {
					output.write(buffer, 0, readLen);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// 关闭流
			if (input != null) {
				try {
					input.close();
				} catch (IOException ex) {
					Logger.getLogger(ZipUtil.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
		}
	}

	/**
	 *
	 * @param sourceZip 待解压文件路径
	 * @param destDir   解压到的路径
	 */
	public static void unZip(String sourceZip, String destDir) {
		// 保证文件夹路径最后是"/"或者"\"
		char lastChar = destDir.charAt(destDir.length() - 1);
		if (lastChar != '/' && lastChar != '\\') {
			destDir += File.separator;
		}
		Project p = new Project();
		Expand e = new Expand();
		e.setProject(p);
		e.setSrc(new File(sourceZip));
		e.setOverwrite(false);
		e.setDest(new File(destDir));
		/*
		 * ant下的zip工具默认压缩编码为UTF-8编码， 而winRAR软件压缩是用的windows默认的GBK或者GB2312编码 所以解压缩时要制定编码格式
		 */
		e.setEncoding("gbk");
		e.execute();
	}

	/**
	 * 功能:压缩多个文件成一个zip文件
	 * 
	 * @param srcfile：源文件列表
	 * @param zipfile：压缩后的文件
	 */
	public static void zipFiles(List<File> srcfile, File zipfile) {
		byte[] buf = new byte[1024];
		try {
			// ZipOutputStream类：完成文件或文件夹的压缩
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipfile));
			for (int i = 0; i < srcfile.size(); i++) {
				FileInputStream in = new FileInputStream(srcfile.get(i));
				out.putNextEntry(new ZipEntry(srcfile.get(i).getName()));
				int len;
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
				out.closeEntry();
				in.close();
			}
			out.close();
			System.out.println("压缩完成.");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 功能:解压缩
	 * 
	 * @param zipfile：需要解压缩的文件
	 * @param descDir：解压后的目标目录
	 */
	public static void unZipFiles(File zipfile, String descDir) {
		try {
			ZipFile zf = new ZipFile(zipfile);
			for (Enumeration entries = zf.getEntries(); entries.hasMoreElements();) {
				ZipEntry entry = (ZipEntry) entries.nextElement();
				String zipEntryName = entry.getName();
				InputStream in = zf.getInputStream(entry);
				OutputStream out = new FileOutputStream(descDir + zipEntryName);
				byte[] buf1 = new byte[1024];
				int len;
				while ((len = in.read(buf1)) > 0) {
					out.write(buf1, 0, len);
				}
				in.close();
				out.close();
				System.out.println("解压缩完成.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// String sourcePath = "E:/新建文本文档.txt";
		// String destPath = "E:/新建文本文档.zip";
		// unZip(sourcePath, destPath);
		// zip(new File("E:/新建文本文档.txt"), new File("E:/新建文本文档.zip"));
		// System.out.println("压缩完成——————————————");
		// 2个源文件
		File f1 = new File("E:\\temp.xlsx");
		File f2 = new File("E:\\temp2.xlsx");
		List<File> srcfile=new ArrayList<File>();
		srcfile.add(f1);
		srcfile.add(f2);
		// 压缩后的文件
		File zipfile = new File("E:\\temp2.zip");
		ZipUtil.zipFiles(srcfile, zipfile);
		// 需要解压缩的文件
		// File file = new File("E:\\temp2.zip");
		// 解压后的目标目录
		// String dir = "E:\\upload\\";
		// ZipUtil.unZipFiles(file, dir);
	}
}
