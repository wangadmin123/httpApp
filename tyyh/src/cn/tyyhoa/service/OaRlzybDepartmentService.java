// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybDepartmentService.java

package cn.tyyhoa.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.tyyhoa.pojo.OaRlzybDepartment;


public interface OaRlzybDepartmentService
{

	public abstract List<OaRlzybDepartment> selectAllDepartment();
	List<OaRlzybDepartment> selectAll();
	
	public List<OaRlzybDepartment> chooseposition();
}
