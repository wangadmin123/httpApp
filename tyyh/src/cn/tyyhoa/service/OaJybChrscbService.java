package cn.tyyhoa.service;

import java.util.Date;
import java.util.List;



import cn.tyyhoa.pojo.OaScbRecord;

public interface OaJybChrscbService {
public List<OaScbRecord> GetChrscbById( int stu_id);
	
	public List<OaScbRecord>  GetChrscbByTime( Date eventtime, int stu_id);

}
