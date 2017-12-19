package cn.tyyhoa.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


import com.google.gson.Gson;


import cn.tyyhoa.util.MessageUtil;

@ServerEndpoint("/web/chat")
public class WebsocketController {
	
	private static  Set<WebsocketController>  ss= new HashSet<WebsocketController>();
	private static  List<String>  nickNames=new ArrayList<String>();
	private Session  session ;
	private Gson gson=new Gson();
	private String nickName;
	@OnOpen
	public void OpenConnect(Session session){
		String queryString= session.getQueryString();
		this.nickName = queryString.substring(queryString.indexOf("=")+1);
		System.out.println(nickName);
		ss.add(this);
		nickNames.add(nickName);
		this.session = session;
	}
	
	@OnMessage(maxMessageSize=1000)
	public void receiveMsg(Session session,String msg){
		if ("close".equals(msg)) {
			wsclose();
		}else{
			MessageUtil mu=gson.fromJson(msg, MessageUtil.class);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dat=df.format(new Date()).toString();
			mu.setDate(dat);
			broadcast(ss,gson.toJson(mu));
		}
	}
	
	@OnClose
	public void wsclose(){
		ss.remove(this);
		nickNames.remove(nickName);
	}
	
	
	private void  broadcast(Set<WebsocketController>  ss, String msg){
		for (Iterator iterator = ss.iterator(); iterator.hasNext();) {
			WebsocketController helloWorld = (WebsocketController) iterator.next();
			try {
				helloWorld.session.getBasicRemote().sendText(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}
}
