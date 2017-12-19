// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybSubfieldMapper.java

package cn.tyyhoa.dao;

import cn.tyyhoa.pojo.OaRlzybSubfield;
import java.util.List;

public interface OaRlzybSubfieldMapper
{

	public abstract int deleteByPrimaryKey(Integer subfield_id);

	public abstract int insert(OaRlzybSubfield oarlzybsubfield);

	public abstract int insertSelective(OaRlzybSubfield oarlzybsubfield);

	public abstract OaRlzybSubfield selectByPrimaryKey(Integer integer);

	public abstract int updateByPrimaryKeySelective(OaRlzybSubfield oarlzybsubfield);

	public abstract int updateByPrimaryKey(OaRlzybSubfield oarlzybsubfield);

	public abstract List<OaRlzybSubfield> selectByPositionId(Integer integer);
	
	public abstract List<OaRlzybSubfield> selectByNotPositionId(Integer integer);

	public abstract List<OaRlzybSubfield> selectAllSubfield();

	public abstract int subfield_to_position(OaRlzybSubfield oarlzybsubfield);

	public abstract int subfield_out_position(OaRlzybSubfield oarlzybsubfield);

	public abstract List<OaRlzybSubfield> selectCanDelSubfield();
}
