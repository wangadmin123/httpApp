package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaKfbJob;
import cn.tyyhoa.pojo.OaKfbJobExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OaKfbJobMapper {
    long countByExample(OaKfbJobExample example);

    int deleteByExample(OaKfbJobExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OaKfbJob record);

    int insertSelective(OaKfbJob record);

    List<OaKfbJob> selectByExample(OaKfbJobExample example);

    OaKfbJob selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OaKfbJob record, @Param("example") OaKfbJobExample example);

    int updateByExample(@Param("record") OaKfbJob record, @Param("example") OaKfbJobExample example);

    int updateByPrimaryKeySelective(OaKfbJob record);

    int updateByPrimaryKey(OaKfbJob record);
}