// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybPositionService.java

package cn.tyyhoa.service;

import cn.tyyhoa.pojo.OaRlzybPosition;
import java.util.List;

public interface OaRlzybPositionService
{

	public abstract OaRlzybPosition selectByUserId(Integer integer);

	public abstract List<OaRlzybPosition> selectByDepartmentid(OaRlzybPosition oarlzybposition);


List<OaRlzybPosition> selectAll();
	
    List<OaRlzybPosition> selectAllByDepartId(Integer department_id);


}
