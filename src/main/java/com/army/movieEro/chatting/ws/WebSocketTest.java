package com.army.movieEro.chatting.ws;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.army.movieEro.chatting.vo.UserInfoVO;





// @ServerEndpoint : 클라이언트에서 접속할 서버 주소
@ServerEndpoint(value = "/chat", 
        configurator = GetHttpSessionConfigurator.class)
public class WebSocketTest {	

	private static final Logger log = LoggerFactory.getLogger(WebSocketTest.class);
	private static Map<String,Session> sessionMap = Collections
			.synchronizedMap(new HashMap<String,Session>());
	
	private ObjectMapper mapper = new ObjectMapper();
	
	// @OnMessage : 클라이언트로부터 메시지가 도착했을 경우 처리
	@OnMessage
	public void onMessage(String text, Session session) throws IOException {

	    TypeReference<HashMap<String,Object>> typeRef 
	            = new TypeReference<HashMap<String,Object>>() {};

		Map<String,String> map = mapper.readValue(text, typeRef);
		log.info("text = >{}",map);
		String targetId = map.get("target");
		
		synchronized (sessionMap) {
			final Iterator<String> it = sessionMap.keySet().iterator();
			while(it.hasNext()) {
				final String key = it.next();
				if(key.equals(targetId)) {
					Session ss = sessionMap.get(key);
					ss.getBasicRemote().sendText(text);
				}
			}
		}
	}
	
	private String getSessionKey(Session session) {
		final Iterator<String> it = sessionMap.keySet().iterator();
		while(it.hasNext()) {
			final String key = it.next();
			if(session.equals(sessionMap.get(key))){
				return key;
			}
		}
		return null;
	}
	
	// @OnOpen : 클라이언트가 접속을 할 때
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		System.out.println(session);
		final HttpSession hs = (HttpSession) config.getUserProperties()
                .get(HttpSession.class.getName());
		//로그인처리를 했다는 가정하에 로그인을 할경우
		//http세션에 UserInfoVO를 저장한 후 웹소케세션을 매핑시킴.
		//final UserInfoVO uiv = (UserInfoVO)hs.getAttribute("userInfo");
		//final String userId = uiv.getUiId();
		final String userId = (String) hs.getAttribute("member");
		
		sessionMap.put(userId, session);
	}

	// @OnClose : 클라이언트와 접속이 끊어졌을 때
	@OnClose
	public void onClose(Session session) {
		String key = getSessionKey(session);
		if(key!=null) {
			sessionMap.remove(key);
		}
	}
}
