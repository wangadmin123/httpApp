package cn.tyyhoa.dao;

import java.util.List;

import cn.tyyhoa.pojo.OaRlzybLeaveType;

public interface OaRlzybLeaveTypeMapper {

	//查询所有离岗类型
    List<OaRlzybLeaveType> selectAllOaRlzybLeaveType();
}
