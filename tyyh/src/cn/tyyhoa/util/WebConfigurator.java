package cn.tyyhoa.util;

import java.util.Set;

import javax.websocket.Endpoint;

import javax.websocket.server.ServerApplicationConfig;
import javax.websocket.server.ServerEndpointConfig;

public class WebConfigurator implements  ServerApplicationConfig {
	public Set<Class<?>> getAnnotatedEndpointClasses(Set<Class<?>> arg0) {
		// TODO Auto-generated method stub
		System.out.println("正在扫描所有的webSocket服务！！！");
		return arg0;
	}

	public Set<ServerEndpointConfig> getEndpointConfigs(
			Set<Class<? extends Endpoint>> arg0) {
		// TODO Auto-generated method stub
		return null;
	}
}
