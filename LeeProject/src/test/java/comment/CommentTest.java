package comment;

import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

public class CommentTest {

	private AnnotationConfigApplicationContext context;

	@Test
	public void test() {
//		context = new AnnotationConfigApplicationContext(CommentTest.class);
//		CommentTest commentTest = context.getBean(CommentTest.class);
		 BeanFactory beanFactory=new ClassPathXmlApplicationContext("spring.xml");
		 CommentTest commentTest=(CommentTest)beanFactory.getBean("commentTest");
//		System.out.println(commentTest.a+"——————————————————");
	}
}
