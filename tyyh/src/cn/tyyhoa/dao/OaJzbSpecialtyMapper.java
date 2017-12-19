package cn.tyyhoa.dao;

import java.util.List;

import cn.tyyhoa.pojo.OaJzbSpecialty;

public interface OaJzbSpecialtyMapper {
    public int addInsert(OaJzbSpecialty record);

    int insertSelective(OaJzbSpecialty record);
    
    List<OaJzbSpecialty> getSecialtys();
}