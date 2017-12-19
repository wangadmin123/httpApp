package cn.tyyhoa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tyyhoa.pojo.OaRlzybContract;

public interface OaRlzybContractMapper {
    int deleteByPrimaryKey(Integer contract_num);

    int insert(OaRlzybContract record);

    int insertSelective(OaRlzybContract record);

    OaRlzybContract selectByPrimaryKey(Integer contract_num);

    int updateByContractEndDate(OaRlzybContract record);

    int updateByPrimaryKey(OaRlzybContract record);
    /**
     * 查询全部合同信息
     * @return
     */
    List<OaRlzybContract> selectAllContract();
    
    OaRlzybContract showInfo(@Param("emp_id")Integer emp_id);
    
    List<OaRlzybContract> selectContractId();
}