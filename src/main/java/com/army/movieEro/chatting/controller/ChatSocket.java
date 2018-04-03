package com.army.movieEro.chatting.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatSocket")
public class ChatSocket {

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
	
	@OnError
	public void onError(Session session, Throwable thr) {
		System.err.println("org.apache.tomcat.websocket.pojo.PojoEndpointBase onError");
		System.err.println("심각: No error handling configured for [com.army.movieEro.chatting.controller.ChatSocket] and the following error occurred\r\n" + 
				"java.io.IOException: 현재 연결은 사용자의 호스트 시스템의 소프트웨어의 의해 중단되었습니다");
	}
}