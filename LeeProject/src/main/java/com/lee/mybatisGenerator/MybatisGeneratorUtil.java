package com.lee.mybatisGenerator;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
 
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;
 
public class MybatisGeneratorUtil {
 
	public static void main(String[] args) throws Exception {
		MybatisGeneratorUtil mg = new MybatisGeneratorUtil();
		mg.generator();
	}
 
	public  void generator() throws Exception {
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
//		File configFile = new File("src/main/resources/generatorConfig.xml");
//		//指定逆向工程配置文件
        File configFile = new File(this.getClass().getClassLoader().getResource("mybatisGenerator/generatorConfig.xml").getPath().replaceAll("%20", " "));
        ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(configFile);
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		myBatisGenerator.generate(null);
		System.out.println("生成完毕>>>>>>>>>>>>>>>>>>");
	}
 
}
