package cn.tyyhoa.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJybActivity;
import cn.tyyhoa.service.OaJybActiveService;

@RequestMapping("/employment_department")
@Controller
public class OaJybActiveController {
	
	@Autowired
	OaJybActiveService oaJybActiveService;
	
	public OaJybActiveService getOaJybActiveService() {
		return oaJybActiveService;
	}
	public void setOaJybActiveService(OaJybActiveService oaJybActiveService) {
		this.oaJybActiveService = oaJybActiveService;
	}
	@RequestMapping(value="/huodong")
	public String fafasfa(){
		
		
		
		
		
		return "employment_department/huodong";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/showhuodong",produces="application/json;charset=utf-8",method=RequestMethod.POST)
 	@ResponseBody
 	public Object wwfwgw(Integer index){
		List<OaJybActivity>  oaJybActivitys = oaJybActiveService.GetAllActivity(index, 10);
		HashMap<String, Object>	result = new HashMap<String, Object>();
		List< String []> list = new ArrayList<String []>();
		for (int i = 0; i < oaJybActivitys.size(); i++) {
			String sourceStr =oaJybActivitys.get(i).getActivity_photoid();
			String[] sourceStrArray;
			if(sourceStr==null){ sourceStrArray = new String[]{"","statics/employment_department/images1/demoUpload长城.jpg"};}
			else{sourceStrArray = sourceStr.split("D:/tomcat/webapps/tyyhoa/");}
			
			list.add(sourceStrArray);
			
		}
		
		
		int count = oaJybActiveService.AllCounts();
		int counts = count%10==0?count/10:count/10+1;
		result.put("index", index);
   	    result.put("oaJybActivitys", oaJybActivitys);
   	     result.put("count", counts);
   	  result.put("list", list);
   	  
		 
   	  return JSONArray.toJSONStringWithDateFormat(result, "yyyy-MM-dd");
		
	}
	
	
	
	@RequestMapping(value="/addhuodong")
	public String sgd(){
		return "employment_department/addhuodong";
	}
	
    @RequestMapping("/upload2")  
    public String upload2(HttpServletRequest request,HttpServletResponse response,OaJybActivity oaJybActivity,String time) throws IllegalStateException, IOException {  
        
    	String str = new String();
    	Date date = new Date();
    	DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
    	System.out.println("*********************"+time+date);
    	if(time != "" && time != null){try {
			oaJybActivity.setActivity_time(df.parse(time));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
    	else{oaJybActivity.setActivity_time(date);}
    	
    	
    	//创建一个通用的多部分解析器  
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
        //判断 request 是否有文件上传,即多部分请求  
        if(multipartResolver.isMultipart(request)){  
            //转换成多部分request    
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;  
            //取得request中的所有文件名  
            Iterator<String> iter = multiRequest.getFileNames();  
            while(iter.hasNext()){  
                //记录上传过程起始时的时间，用来计算上传时间  
                int pre = (int) System.currentTimeMillis();  
                //取得上传文件  
                MultipartFile file = multiRequest.getFile(iter.next());  
                if(file != null){  
                    //取得当前上传文件的文件名称  
                    String myFileName = file.getOriginalFilename();  
                    //如果名称不为“”,说明该文件存在，否则说明该文件不存在  
                    if(myFileName.trim() !=""){  
                        System.out.println(myFileName);  
                        //重命名上传后的文件名  
                        String fileName = "demoUpload" + file.getOriginalFilename();  
                        //定义上传路径  
                       /* String dd = request.getSession().getServletContext().getRealPath("statics/employment_department/images1/"+fileName);*/
                        String dd = "D:/tomcat/webapps/tyyhoa/statics/employment_department/images1/" + fileName;  
                        File localFile = new File(dd);  
                        file.transferTo(localFile); 
                        str+=dd;
                    }  
                }  
                //记录上传该文件后的时间  
                int finaltime = (int) System.currentTimeMillis();  
                
                
            }  
              
        }  
        oaJybActivity.setActivity_photoid(str);
        oaJybActiveService.insertSelective(oaJybActivity);
        return "employment_department/huodong";  
    }
	
    
    
    
    @RequestMapping("/hdd.html") 
    public String gdgsg(String id,HttpServletRequest request){
    	OaJybActivity oaJybActivity = oaJybActiveService.selectByPrimaryKey(Integer.parseInt(id));
    	request.setAttribute("oaJybActivity", oaJybActivity);
    	String sourceStr =oaJybActivity.getActivity_photoid();
		String[] sourceStrArray;
		if(sourceStr==null){ sourceStrArray = new String[]{"","statics/employment_department/images1/demoUpload长城.jpg"};}
		else{sourceStrArray = sourceStr.split("D:/tomcat/webapps/tyyhoa/");}
		
		request.setAttribute("sourceStrArray",sourceStrArray);
		DateFormat  df = new SimpleDateFormat("yyyy-MM-dd");
		String str=df.format( oaJybActivity.getActivity_time());
		request.setAttribute("time",str);
		return "employment_department/showhuodong";
    	
    	
    	
    	
    	
    }

}
