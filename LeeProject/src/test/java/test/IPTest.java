package test;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class IPTest {

	public static void main(String[] args) {
//		AddressUtils au = new AddressUtils();
//		String ip = "10.41.225.2";  
//		String address = "";  
//		try {
//			address = au.getJson("ip="+ip, "UTF8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		System.out.println(address);
		         InetAddress addr = null;
				try {
					addr = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  
		         String ip=addr.getHostAddress().toString(); //获取本机ip  
		         String hostName=addr.getHostName().toString(); //获取本机计算机名称  
		         System.out.println(ip);
		         System.out.println(hostName);
		    }
		 

}
