package com.lee.utils.excelUnits;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ExcelToSQL {

	// 将集合转换成Table类型
	public List<Table> tableMaker(List<List<String>> lines) {
		// 对表名进行去重
		Set<String> tn = new HashSet<String>();
		// Set<String> tablecomment = new HashSet<String>();
		Col col = null;
		Table table = null;
		List<Col> cs = null;
		List<Table> ts = new ArrayList<Table>();
		for (List<String> l : lines) {
			tn.add(l.get(0));
		}
		List<String> tablename = new ArrayList<String>(tn);
		System.out.println("表：" + tablename);
		// 循环表名，创建表名示例
		for (int j = 0; j < tablename.size(); j++) {
			table = new Table();
			String tn1 = tablename.get(j);
			cs = new ArrayList<Col>();
			for (int i = 0; i < lines.size(); i++) {
				List<String> l = lines.get(i);
				if (l.get(l.size() - 1) == null) {
					l.set(l.size() - 1, "");
				}
				if (tn1.equals(l.get(0))) {
					table.setName(l.get(0));
					table.setComment(l.get(1));
					col = new Col();
					col.setName(l.get(2));
					col.setComment(l.get(3));
					col.setType(l.get(4));
					col.setColLength(l.get(5));
					col.setPk(l.get(6));
					cs.add(col);
				} else {
					continue;
				}
				table.setColList(cs);
			}
			ts.add(table);
		}
		return ts;
	}

	public String MySQLMaker(List<Table> ts) {
		if (ts == null) {
			return null;
		}
		String dropTable = "";// 删表语句
		String createTable = ""; // 建表语句
		String cols = "";// 表字段备用语句
		String result = "";
		for (int i = 0; i < ts.size(); i++) {
			Table t = ts.get(i);
			cols = "";
			for (int j = 0; j < t.getColList().size(); j++) {
				Col c = t.getColList().get(j);
				if (c.getPk().indexOf("是") != -1) {
					c.setPk("PRIMARY KEY");
				} else {
					c.setPk("");
				}

				if ("date".equalsIgnoreCase(c.getType()) || "time".equalsIgnoreCase(c.getType())
						|| "enum".equalsIgnoreCase(c.getType()) || "set".equalsIgnoreCase(c.getType())) {
					c.setColLength("");
				} else {
					c.setColLength("(" + c.getColLength() + ")");
				}
				cols += c.getName() + " " + c.getType() + c.getColLength() + c.getPk() + " COMMENT '" + c.getComment()
						+ "',";
			}
			cols = cols.substring(0, cols.length() - 1);
			// 删表语句
			dropTable = "DROP TABLE " + t.getName() + ";\r\n";
			// 建表语句
			createTable = "CREATE TABLE " + t.getName() + "(" + cols + ") COMMENT '" + t.getComment() + "';\r\n";
			result += dropTable + createTable + "\r\n";
		}

		return result;
	}

	public String OracleMaker(List<Table> ts) {
		if (ts == null) {
			return null;
		}
		String dropTable = "";// 删表语句
		String createTable = ""; // 建表语句
		String commentTable = ""; // 表备注语句
		String commentCols = ""; // 表字段语句
		String cols = "";// 表字段备用语句
		String result = "";
		for (int i = 0; i < ts.size(); i++) {
			Table t = ts.get(i);
			cols = "";
			commentCols = "";
			for (int j = 0; j < t.getColList().size(); j++) {
				Col c = t.getColList().get(j);
				if (c.getPk().indexOf("是") != -1) {
					c.setPk("PRIMARY KEY");
				} else {
					c.setPk("");
				}
				cols += c.getName() + " " + c.getType() + "(" + c.getColLength() + ") " + c.getPk() + ",";
				// 表字段备注语句
				commentCols += "COMMENT ON COLUMN " + t.getName() + "." + c.getName() + " is '" + c.getComment()
						+ "';\r\n";
			}

			cols = cols.substring(0, cols.length() - 1);
			// 删表语句
			dropTable = "DROP TABLE " + t.getName() + ";\r\n";
			// 建表语句
			createTable = "CREATE TABLE " + t.getName() + "(" + cols + ");\r\n";
			// 表备注语句
			commentTable = "COMMENT ON TABLE " + t.getName() + " is '" + t.getComment() + "';\r\n";
			result += dropTable + createTable + commentTable + commentCols + "\r\n";
		}
		return result;
	}

	// 检查空值
	public String checkNull(String filePath, String dbType) {
		String regex1 = "[a-zA-Z0-9_]+";
		String regex = "[a-zA-Z0-9]+";
		String numRegex = "[0-9]+";

		String message = "";
		ExcelUtils r = new ExcelUtils();
		List<List<String>> lines = r.parseExcel(filePath);
		for (int i = 0; i < lines.size(); i++) {
			if (lines.get(i).size()<7) {
				return "error:模板表格数据有误！！！";
			}
			for (int j = 0; j < 5; j++) {
				if (lines.get(i).get(j) == null || "".equals(lines.get(i).get(j))) {
					// System.out.println(i+"行"+j+"列有空值！！！");
					message += "error:第" + (i + 2) + "行 " + (j + 1) + "列有空值！！！\r\n";
				}

			}
			if (dbType.indexOf("Oracle") != -1 && lines.get(i).get(0).length() > 30) {
				message += "error:第" + (i + 2) + "行 表名列超过30个字符！！！\r\n";
			} else if (dbType.indexOf("Oracle") != -1 && lines.get(i).get(2).length() > 30) {
				message += "error:第" + (i + 2) + "行 字段名列超过30个字符！！！\r\n";
			}
			if (!"".equals(lines.get(i).get(0)) && !lines.get(i).get(0).matches(regex1)) {
				message += "warning:第" + (i + 2) + "行 表名列有非法字符！！！\r\n";
			}
			if (!"".equals(lines.get(i).get(2)) && !lines.get(i).get(2).matches(regex1)) {
				message += "warning:第" + (i + 2) + "行 字段名列有非法字符！！！\r\n";
			}
			if (!"".equals(lines.get(i).get(4)) && !lines.get(i).get(4).matches(regex)) {
				message += "error:第" + (i + 2) + "行 类型列有非法字符！！！\r\n";
			}
			if (!"".equals(lines.get(i).get(5)) && !lines.get(i).get(5).matches(numRegex)) {
				message += "error:第" + (i + 2) + "行 长度列有非法字符！！！\r\n";
			}

		}
		if ("".equals(message)) {
			return "正常";
		}
		return message.replaceAll("1列", "表名列").replaceAll("2列", "表备注列").replaceAll("3列", "字段列")
				.replaceAll("4列", "字段备注列").replaceAll("5列", "类型列");
	}

}
