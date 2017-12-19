// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   OaRlzybUser.java

package cn.tyyhoa.pojo;

import java.util.List;

// Referenced classes of package cn.tyyhoa.pojo:
//			OaRlzybEmployee, OaRlzybPosition

public class OaRlzybUser{

	private Integer user_id;
	private String user_name;
	private String user_pwd;
	private Integer emp_id;//员工ID
	private Integer login_type;
	private String stu_id;
	private String old_pwd;
	private String new_pwd;
	private String name;//员工名字 
	private OaRlzybEmployee emp;
	private OaRlzybPosition position;//职位实体
	private List<OaRlzybFunction> user_functions;
	private String rands;
	private Integer logincont;
	private String emp_name;//登录人名称
	private String position_name; 
	
	private Integer position_id;
	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Integer getPosition_id() {
		return position_id;
	}

	public void setPosition_id(Integer position_id) {
		this.position_id = position_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public Integer getLogincont() {
		return logincont;
	}

	public void setLogincont(Integer logincont) {
		this.logincont = logincont;
	}

	public String getRands() {
		return rands;
	}

	public void setRands(String rands) {
		this.rands = rands;
	}

	public OaRlzybUser()
	{
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getLogin_type() {
		return login_type;
	}

	public void setLogin_type(Integer login_type) {
		this.login_type = login_type;
	}

	
	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public OaRlzybEmployee getEmp()
	{
		return emp;
	}

	public void setEmp(OaRlzybEmployee emp)
	{
		this.emp = emp;
	}
	
	public String getOld_pwd() {
		return old_pwd;
	}

	public void setOld_pwd(String old_pwd) {
		this.old_pwd = old_pwd;
	}

	public String getNew_pwd() {
		return new_pwd;
	}

	public void setNew_pwd(String new_pwd) {
		this.new_pwd = new_pwd;
	}

	public OaRlzybPosition getPosition()
	{
		return position;
	}

	public void setPosition(OaRlzybPosition position)
	{
		this.position = position;
	}

	
	public List<OaRlzybFunction> getUser_functions() {
		return user_functions;
	}

	public void setUser_functions(List<OaRlzybFunction> user_functions) {
		this.user_functions = user_functions;
	}

	public Integer getUser_id()
	{
		return user_id;
	}

	public void setUser_id(Integer user_id)
	{
		this.user_id = user_id;
	}

	public String getUser_name()
	{
		return user_name;
	}

	public void setUser_name(String user_name)
	{
		this.user_name = user_name != null ? user_name.trim() : null;
	}

	public String getUser_pwd()
	{
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd)
	{
		this.user_pwd = user_pwd != null ? user_pwd.trim() : null;
	}

	public Integer getEmp_id()
	{
		return emp_id;
	}

	public void setEmp_id(Integer emp_id)
	{
		this.emp_id = emp_id;
	}
}
