package test;

import java.util.Date;

public class StringTest {

	public static void main(String[] args) {
			String s ="Q1\r\n" + 
					"Q2\r\n" + 
					"Q3\r\n" + 
					"Q4\r\n" + 
					"Q5\r\n" + 
					"Q6\r\n" + 
					"Q7\r\n" + 
					"";
			
//			System.out.println(s.replaceAll("\r\n", ","));
			String [] ss =s.split("\r\n");
			for (int i = 0; i < ss.length; i++) {
//				String[] sss =ss[i].split("-");
//				"Q1":Q1
				System.out.println("\""+ss[i]+"\":"+ss[i]+",");
			}
	}

}
