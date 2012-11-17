package standalone;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/httpgateway.xml");
		applicationContext.registerShutdownHook();
	}
}
