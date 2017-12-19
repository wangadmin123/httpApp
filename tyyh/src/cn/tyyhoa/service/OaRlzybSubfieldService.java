// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybSubfieldService.java

package cn.tyyhoa.service;





import java.util.List;

import cn.tyyhoa.pojo.OaRlzybSubfield;


public interface OaRlzybSubfieldService
{

	public  int deleteByPrimaryKey(Integer integer);

	public  int insert(OaRlzybSubfield oarlzybsubfield);

	public  List<OaRlzybSubfield> selectByPositionId(Integer integer);

	public  List<OaRlzybSubfield> selectAllSubfield();

	public  int subfield_to_position(OaRlzybSubfield oarlzybsubfield);

	public  int subfield_out_position(OaRlzybSubfield oarlzybsubfield);

	public  List<OaRlzybSubfield> selectCanDelSubfield();
	
	public abstract List<OaRlzybSubfield> selectByNotPositionId(Integer integer);
}
