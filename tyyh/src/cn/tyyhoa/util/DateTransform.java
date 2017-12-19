package cn.tyyhoa.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

public class DateTransform implements WebBindingInitializer{
	public void initBinder(WebDataBinder binder, WebRequest request) {
		//日期转换器
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
				}
}
