package cn.tyyhoa.service;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
/**
 * 报表
 * @author lenovo
 *
 */
public interface OaScbConsultAssistantSheetService {
	/*日报表——电话咨询量*/
	public int phoneControllers(Date day,Integer consultTeacher);
	
	/*日报表--电话上门量*/
	public int phoneControllersCome(Date day,Integer consultTeacher);
	
	/*日报——直接上门量*/
	public int ControllersDirectCome(Date day,Integer consultTeacher);
	
	/*日报——总报名量*/
	public int Allenrolls(Date day,Integer consultTeacher);
	
	/*日报——总咨询量*/
	public int AllControllers(Date day,Integer consultTeacher);
	
	/*日报——总上门量*/
	public int AllComes(Date day,Integer consultTeacher);
	
	/*日报——总定金量*/
	public int AllpayStatus(Date day,Integer consultTeacher);
	
	
	
	
	/*周报表——电话咨询量*/
	public int WeekPhoneControllers(Date Nowday,Date Maxday,Date Minday,Integer consultTeacher);

	/*周报表--电话上门量*/
	public int WeekPhoneControllersCome(Date Nowday,Date Maxday,Date Minday,Integer consultTeacher);

	/*周报——直接上门量*/
	public int WeekControllersDirectCome(Date Nowday,Date Maxday,Date Minday,Integer consultTeacher);

	/*周报——总报名量*/
	public int WeekAllenrolls(Date Nowday,Date Maxday,Date Minday,Integer consultTeacher);

	/*周报——总咨询量*/
	public int WeekAllControllers(Date Nowday,Date Maxday,Date Minday,Integer consultTeacher);

	/*周报——总上门量*/
	public int WeekAllComes(Date Nowday,Date Maxday,Date Minday,Integer consultTeacher);

	/*周报——总定金量*/
	public int WeekAllpayStatus(Date Nowday,Date Maxday,Date Minday,Integer consultTeacher);

	
	
	
	/*月报——电话咨询量*/
	public int MonthPhoneControllers(Date day,Integer consultTeacher);
	
	/*月报--电话上门量*/
	public int MonthPhoneControllersCome(Date day,Integer consultTeacher);

	/*月报——直接上门量*/
	public int MonthControllersDirectCome(Date day,Integer consultTeacher);

	/*月报——总报名量*/
	public int MonthAllenrolls(Date day,Integer consultTeacher);

	/*月报——总咨询量*/
	public int MonthAllControllers(Date day,Integer consultTeacher);
	
	/*月报——总上门量*/
	public int MonthAllComes(Date day,Integer consultTeacher);

	/*周报——总定金量*/
	public int MonthAllpayStatus(Date day,Integer consultTeacher);
	
	
	
	
	
	/*年报——电话咨询量*/
	public int YearPhoneControllers(Date day,Integer consultTeacher);
	
	/*年报--电话上门量*/
	public int YearPhoneControllersCome(Date day,Integer consultTeacher);
	
	/*年报——直接上门量*/
	public int YearControllersDirectCome(Date day,Integer consultTeacher);
	
	/*年报——总报名量*/
	public int YearAllenrolls(Date day,Integer consultTeacher);
	
	/*年报——总咨询量*/
	public int YearAllControllers(Date day,Integer consultTeacher);
	
	/*年报——总上门量*/
	public int YearAllComes(Date day,Integer consultTeacher);
	
	/*年报——总定金量*/
	public int YearAllpayStatus(Date day,Integer consultTeacher);


}
