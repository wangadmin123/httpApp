package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybWorkorder;

public interface OaRlzybWorkordersService {

	int workorderupdate(OaRlzybWorkorder oaRlzybWorkorder);

	OaRlzybWorkorder selectById(Integer workorder_id);

	List<OaRlzybWorkorder> selectAll(Integer emp_id);

	int addWorkorder(OaRlzybWorkorder workorder);

	long countByEmp_id(Integer empid);

}
