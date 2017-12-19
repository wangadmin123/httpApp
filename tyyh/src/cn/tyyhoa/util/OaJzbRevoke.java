package cn.tyyhoa.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;



public class OaJzbRevoke {
	/**
	 * 48小时
	 * @param time
	 * @return
	 */
	
		public boolean Revoke(Date time){
			long now = System.currentTimeMillis();
			long now1 =  time.getTime();
			if(now-now1>=172800000){
				return true;
			}else{
				return false;
			}
		}
		
	
}
