package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybWodetails;
import cn.tyyhoa.pojo.OaRlzybWodetailsExample;

public interface OaRlzybWodetailsService {

	int insertwodetails(OaRlzybWodetails oaRlzybWodetails);

	List<OaRlzybWodetails> SelectWoByThisMonth(Integer emp_id);

	List<OaRlzybWodetails> selectByWorkorderId(OaRlzybWodetailsExample wodetailsExample);

}
