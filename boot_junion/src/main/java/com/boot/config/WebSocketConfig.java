package com.boot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
    	registry.addEndpoint("/ws").setAllowedOrigins("http://localhost:8282").withSockJS();
    }

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.enableSimpleBroker("/sub");
        registry.setApplicationDestinationPrefixes("/pub");
    }
}
//@@@@@@@@@@ 웹소켓이 브라우저와 연결되지 않는 문제 .setAllowedOrigins("*")을 지움으로 해결 @@@@@@@@@@@@@@@
//registry.addEndpoint("/ws").setAllowedOrigins("*").withSockJS();
//registry.addEndpoint("/ws").setAllowedOrigins("http://localhost:8282").withSockJS();