package test;

public class MapperSQLMaker {

	public static void main(String[] args) {
		String table = "t_user";
		String tablecol = "id\r\n" + 
				"name\r\n" + 
				"feedbackMan\r\n" + 
				"tel\r\n" + 
				"submitStatus\r\n" + 
				"startTime\r\n" + 
				"endTime\r\n" + 
				"Q1\r\n" + 
				"Q2\r\n" + 
				"Q3\r\n" + 
				"Q4\r\n" + 
				"Q5\r\n" + 
				"Q6\r\n" + 
				"Q7\r\n" + 
				"";
//		System.out.println(updateSelectiveSQL(table, tablecol));
//		System.out.println(insertSQL(table, tablecol));
		System.out.println(insertSelectiveSQL(table, tablecol));
	}

	static String updateSelectiveSQL(String table, String tablecol) {
		String updatesql = "	update " + table + "\r\n<set>";

		String[] cols = tablecol.split("\r\n");
		for (int i = 0; i < cols.length; i++) {
			updatesql += "<if test=\"" + cols[i] + " != null\">\r\n" + "				" + cols[i] + " = #{" + cols[i]
					+ "},\r\n" + "			</if>\r\n";
		}
		updatesql += "</set>\r\n" + "		where id = #{id}";
		return updatesql;
	}

	static String insertSelectiveSQL(String table, String tablecol) {
		String insertSelectiveSQL = "insert into " + table + "\r\n"
				+ "<trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">";

		String[] cols = tablecol.split("\r\n");
		for (int i = 0; i < cols.length; i++) {
			insertSelectiveSQL += "<if test=\"" + cols[i] + " != null\">\r\n" + "				" + cols[i] + ",\r\n"
					+ "			</if>\r\n";
		}
		insertSelectiveSQL += "</trim>\r\n" + "		<trim prefix=\"values (\" suffix=\")\" suffixOverrides=\",\">";
		for (int i = 0; i < cols.length; i++) {
			insertSelectiveSQL += "<if test=\"" + cols[i] + " != null\">\r\n" + "				#{" + cols[i] + "},\r\n"
					+ "			</if>\r\n";
		}
		insertSelectiveSQL += "</trim>";
		return insertSelectiveSQL;
	}

	static String insertSQL(String table, String tablecol) {
		String insertSQL = "insert into " + table + "(";
		String[] cols = tablecol.split("\r\n");
		String cs1 = "";
		String cs2 = "";
		for (int i = 0; i < cols.length; i++) {
			cs1 += cols[i] + ",";
			cs2 += "#{" + cols[i] + "},";
		}
		cs1 = cs1.substring(0, cs1.length() - 1);
		cs2 = cs2.substring(0, cs2.length() - 1);
		insertSQL += cs1 + ")values (" + cs2 + ");";
		return insertSQL;
	}

//	resultColumn生成
	static String resultColumn(String tablecol) {
		String resultColumn = "";
		String[] ss = tablecol.split("\r\n");
		for (int i = 0; i < ss.length; i++) {
			resultColumn+="<result column=\"" + ss[i] + "\" property=\"" + ss[i] + "\">";
		}
		return resultColumn;

	}

}
