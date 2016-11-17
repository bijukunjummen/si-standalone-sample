package standalone;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.messaging.Message;
import org.springframework.messaging.PollableChannel;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:test-httpgateway.xml")
public class TestHttpOutboundGateway {
	
	@Autowired @Qualifier("test.channel")
	PollableChannel testChannel;

	@Test
	public void testHttpOutbound() {
		Message<?> message = testChannel.receive();
		assertThat(message.getPayload()).isNotNull();
	}
	

}
