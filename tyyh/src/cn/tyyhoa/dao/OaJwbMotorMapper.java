package cn.tyyhoa.dao;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaJwbMotor;

public interface OaJwbMotorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OaJwbMotor record);

    int insertSelective(OaJwbMotor record);

    OaJwbMotor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OaJwbMotor record);

    int updateByPrimaryKey(OaJwbMotor record);
    /**
     * 修改机房状态
     * @param oaJwbMotor
     * @return
     */
    public int updatemotor(@Param("status") int status,@Param("id") int id);
}