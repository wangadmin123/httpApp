package cn.tyyhoa.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 发送指定文件到客户端 
 * @author "sw"
 *
 */
public class SendFileUtil {

	/**
	 * 将文件发送到客户端
	 * @param response 
	 * @param filePhth
	 * @param fileName
	 */
    public static void  FileToClient(HttpServletRequest request,HttpServletResponse response , String filePhth, String fileName){
        // 设置response参数，可以打开下载页面
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        InputStream is =null;
        try {
        	File file = new File(filePhth);
            is = new FileInputStream(file);
            response.reset();
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName).getBytes("gbk"), "iso-8859-1"));
            ServletOutputStream out = response.getOutputStream();
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            e.printStackTrace();
        } finally {
            if (bis != null)
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (bos != null)
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if( is!=null){
            	 try {
            		 is.close();
                 } catch (IOException e) {
                     e.printStackTrace();
                 }
            }
        }
    }
    
    /**
     * 将生成的excel发送给客户端
     * @param response
     * @param os
     * @param fileName
     */
    public static void  sendExcel(HttpServletResponse response , ByteArrayOutputStream os, String fileName){
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
        	String downLoadName = new String((fileName+".xls").getBytes("gbk"), "iso8859-1");  
            response.reset();
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ downLoadName);
            ServletOutputStream out = response.getOutputStream();
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            e.printStackTrace();
        } finally {
            if (bis != null)
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (bos != null)
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
    }
    
    /**
     * 将生成的word发送给客户端
     * @param response
     * @param os
     * @param fileName
     */
    public static void  sendWord(HttpServletResponse response , ByteArrayOutputStream os, String fileName){
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            response.reset();
            response.setContentType("application/msword;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName + ".docx").getBytes("gbk"), "iso-8859-1"));
            ServletOutputStream out = response.getOutputStream();
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            e.printStackTrace();
        } finally {
            if (bis != null)
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            if (bos != null)
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
        }
    }
}
