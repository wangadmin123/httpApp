package cn.tyyhoa.util;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

public class GetIP {
	private static String getIpAddress() throws UnknownHostException {   
        InetAddress address = InetAddress.getLocalHost();
        return address.getHostAddress();   
    } 
}
