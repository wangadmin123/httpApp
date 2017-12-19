package cn.tyyhoa.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;


import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

/**
 * 图片的工具类
 * @author "zy"
 *
 */
public class IMGUtil {
	
	/**
     * 获取网络图片
     * @param url
     * @param request
     * @throws Exception
     */
    public static BufferedImage getImg(HttpServletRequest request,String url) throws Exception {
		URL httpurl = new URL(url);
		URLConnection con = httpurl.openConnection();
		//不超时
		con.setConnectTimeout(0);
		//不允许缓存
		con.setUseCaches(false);
		con.setDefaultUseCaches(false);
		InputStream is = con.getInputStream();
		//先读入内存
		ByteArrayOutputStream buf = new ByteArrayOutputStream(8192);
		byte[] b = new byte[1024];
		int len;
		while ((len = is.read(b)) != -1) {
			buf.write(b, 0, len);
		}
		//读图像
		is=new ByteArrayInputStream(buf.toByteArray());
		return ImageIO.read(is);
	}
    
    
}
