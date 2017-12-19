package cn.tyyhoa.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

/**
 * 咨询助理报表
 * @author lenovo
 *
 */
public interface OaScbConsultAssistantSheetMapper {

	/*日报表——电话咨询量*/
	public int phoneControllers(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*日报表--电话上门量*/
	public int phoneControllersCome(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*日报——直接上门量*/
	public int ControllersDirectCome(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*日报——总报名量*/
	public int Allenrolls(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*日报——总咨询量*/
	public int AllControllers(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*日报——总上门量*/
	public int AllComes(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*日报——总定金量*/
	public int AllpayStatus(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	
	
	
	/*周报表——电话咨询量*/
	public int WeekPhoneControllers(@Param("Nowday")Date Nowday,@Param("Maxday")Date Maxday,@Param("Minday")Date Minday,@Param("consultTeacher")Integer consultTeacher);
	
	/*周报表--电话上门量*/
	public int WeekPhoneControllersCome(@Param("Nowday")Date Nowday,@Param("Maxday")Date Maxday,@Param("Minday")Date Minday,@Param("consultTeacher")Integer consultTeacher);

	/*周报——直接上门量*/
	public int WeekControllersDirectCome(@Param("Nowday")Date Nowday,@Param("Maxday")Date Maxday,@Param("Minday")Date Minday,@Param("consultTeacher")Integer consultTeacher);

	/*周报——总报名量*/
	public int WeekAllenrolls(@Param("Nowday")Date Nowday,@Param("Maxday")Date Maxday,@Param("Minday")Date Minday,@Param("consultTeacher")Integer consultTeacher);

	/*周报——总咨询量*/
	public int WeekAllControllers(@Param("Nowday")Date Nowday,@Param("Maxday")Date Maxday,@Param("Minday")Date Minday,@Param("consultTeacher")Integer consultTeacher);

	/*周报——总上门量*/
	public int WeekAllComes(@Param("Nowday")Date Nowday,@Param("Maxday")Date Maxday,@Param("Minday")Date Minday,@Param("consultTeacher")Integer consultTeacher);

	/*周报——总定金量*/
	public int WeekAllpayStatus(@Param("Nowday")Date Nowday,@Param("Maxday")Date Maxday,@Param("Minday")Date Minday,@Param("consultTeacher")Integer consultTeacher);

	
	
	
	/*月报——电话咨询量*/
	public int MonthPhoneControllers(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*月报--电话上门量*/
	public int MonthPhoneControllersCome(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*月报——直接上门量*/
	public int MonthControllersDirectCome(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	/*月报——总报名量*/
	public int MonthAllenrolls(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*月报——总咨询量*/
	public int MonthAllControllers(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);
	
	/*月报——总上门量*/
	public int MonthAllComes(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	/*月报——总定金量*/
	public int MonthAllpayStatus(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	
	
	
	/*年报——电话咨询量*/
	public int YearPhoneControllers(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	/*年报--电话上门量*/
	public int YearPhoneControllersCome(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	/*年报——直接上门量*/
	public int YearControllersDirectCome(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	/*年报——总报名量*/
	public int YearAllenrolls(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	/*年报——总咨询量*/
	public int YearAllControllers(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	/*年报——总上门量*/
	public int YearAllComes(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

	/*年报——总定金量*/
	public int YearAllpayStatus(@Param("day")Date day,@Param("consultTeacher")Integer consultTeacher);

}
