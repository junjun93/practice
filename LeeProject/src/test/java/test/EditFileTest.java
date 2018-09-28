package test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class EditFileTest {

	public static void main(String[] args) {
		String slectiveFont = "黑体";
		String replace = "*{font-family: '" + slectiveFont + "', Serif;}";
		String filePath = "E:\\public - 副本.css";
		File file = new File(filePath);
		BufferedReader br = null;
        String line = null;
        StringBuffer buf = new StringBuffer();
        
        try {
            // 根据文件路径创建缓冲输入流
            br = new BufferedReader(new FileReader(filePath));
            
            // 循环读取文件的每一行, 对需要修改的行进行修改, 放入缓冲对象中
            while ((line = br.readLine()) != null) {
            	if (line.indexOf("*{font-family") != -1) {
            		line = replace;
				}
				buf.append(line+"\r\n");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭流
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    br = null;
                }
            }
        }
        
 BufferedWriter bw = null;
        
        try {
            // 根据文件路径创建缓冲输出流
            bw = new BufferedWriter(new FileWriter(filePath));
            // 将内容写入文件中
            bw.write(buf.toString());
            System.out.println("写入完毕！");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭流
            if (bw != null) {
                try {
                    bw.close();
                } catch (IOException e) {
                    bw = null;
                }
            }
        }
        
        
//		BufferedReader br = null;
//		BufferedWriter bw = null;
//		String str = null;
//		StringBuilder buf = new StringBuilder();
//		try {
//			br = new BufferedReader(new FileReader(file));
//			bw = new BufferedWriter(new PrintWriter(file));
//			while ((str = br.readLine()) != null) {
//				if (str.indexOf("*{font-family") != -1) {
//					str = replace;
//				}
//				buf.append(str);
////				pw.write(str);
//			}
//			bw.write(buf.toString());
//			System.out.println("写入完毕！");
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.err.println("写入失败！");
//		} finally {
//			try {
//				bw.close();
//				br.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//
//	}
//		String slectiveFont = "楷体";
//		String replace = "*{font-family: '" + slectiveFont + "', Serif;}";
//		File file = new File("E:\\public - 副本.css");
//		RandomAccessFile raf = null;
//		try {
//			raf = new RandomAccessFile(file, "rw");
//			String str = null;
//			long lastPoint = 0; // 记住上一次的偏移量
//			while ((str = raf.readLine()) != null) {
//				final long ponit = raf.getFilePointer();
//				if (str.indexOf("*{font-family") != -1) {
//					raf.seek(lastPoint);
////					raf.writeBytes(replace);
//					raf.writeUTF(replace);
//				}
//				lastPoint = ponit;
//			}
//			System.out.println("写入完毕！");
//		} catch (Exception e) {
//			System.err.println("写入失败！");
//			e.printStackTrace();
//		} finally {
//			try {
//				raf.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
	}
}
