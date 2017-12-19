package cn.tyyhoa.service.impl;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaScbConsultAssistantSheetMapper;
import cn.tyyhoa.service.OaScbConsultAssistantSheetService;
/**
 * 报表
 * @author lenovo
 *
 */
@Service("OaScbConsultAssistantSheetService")
public class OaScbConsultAssistantSheetSerciceImpl implements
OaScbConsultAssistantSheetService {

	@Autowired
	OaScbConsultAssistantSheetMapper OaScbConsultAssistantSheetMapper;
	
	/*日报表——电话咨询量*/
	public int phoneControllers(Date day,Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.phoneControllers(day,consultTeacher);
	}

	/*日报表--电话上门量*/
	public int phoneControllersCome(Date day,Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.phoneControllersCome(day,consultTeacher);
	}

	/*日报——直接上门量*/
	public int ControllersDirectCome(Date day,Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.ControllersDirectCome(day,consultTeacher);
	}

	/*日报——总报名量*/
	public int Allenrolls(Date day,Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.Allenrolls(day,consultTeacher);
	}

	/*日报——总咨询量*/
	public int AllControllers(Date day,Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.AllControllers(day,consultTeacher);
	}

	/*日报——总上门量*/
	public int AllComes(Date day,Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.AllComes(day,consultTeacher);
	}

	/*日报——总定金量*/
	public int AllpayStatus(Date day,Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.AllpayStatus(day,consultTeacher);
	}

	/*周报表——电话咨询量*/
	public int WeekPhoneControllers(Date Nowday, Date Maxday, Date Minday,
			Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.WeekPhoneControllers(Nowday, Maxday, Minday, consultTeacher);
	}

	/*周报表--电话上门量*/
	public int WeekPhoneControllersCome( Date Nowday,
			Date Maxday,Date Minday,
			Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.WeekPhoneControllersCome(Nowday, Maxday, Minday, consultTeacher);
	}

	/*周报——直接上门量*/
	public int WeekControllersDirectCome( Date Nowday,
			Date Maxday,  Date Minday, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.WeekControllersDirectCome(Nowday, Maxday, Minday, consultTeacher);
	}

	/*周报——总报名量*/
	public int WeekAllenrolls(Date Nowday, Date Maxday, Date Minday,
			Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.WeekAllenrolls(Nowday, Maxday, Minday, consultTeacher);
	}

	/*周报——总咨询量*/
	public int WeekAllControllers(Date Nowday, Date Maxday, Date Minday,
			Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.WeekAllControllers(Nowday, Maxday, Minday, consultTeacher);
	}

	/*周报——总上门量*/
	public int WeekAllComes(Date Nowday, Date Maxday, Date Minday,
			Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.WeekAllComes(Nowday, Maxday, Minday, consultTeacher);
	}

	/*周报——总定金量*/
	public int WeekAllpayStatus(Date Nowday, Date Maxday, Date Minday,
			Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.WeekAllpayStatus(Nowday, Maxday, Minday, consultTeacher);
	}

	
	
	
	/*月报——电话咨询量*/
	public int MonthPhoneControllers(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.MonthPhoneControllers(day, consultTeacher);
	}

	/*月报--电话上门量*/
	public int MonthPhoneControllersCome(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.MonthPhoneControllersCome(day, consultTeacher);
	}

	/*月报——直接上门量*/
	public int MonthControllersDirectCome(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.MonthControllersDirectCome(day, consultTeacher);
	}

	/*月报——总报名量*/
	public int MonthAllenrolls(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.MonthAllenrolls(day, consultTeacher);
	}

	/*月报——总咨询量*/
	public int MonthAllControllers(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.MonthAllControllers(day, consultTeacher);
	}

	/*月报——总上门量*/
	public int MonthAllComes(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.MonthAllComes(day, consultTeacher);
	}

	/*周报——总定金量*/
	public int MonthAllpayStatus(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.MonthAllpayStatus(day, consultTeacher);
	}

	/*年报——电话咨询量*/
	public int YearPhoneControllers(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.YearPhoneControllers(day, consultTeacher);
	}

	/*年报--电话上门量*/
	public int YearPhoneControllersCome(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.YearPhoneControllersCome(day, consultTeacher);
	}

	/*年报——直接上门量*/
	public int YearControllersDirectCome(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.YearControllersDirectCome(day, consultTeacher);
	}

	/*年报——总报名量*/
	public int YearAllenrolls(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.YearAllenrolls(day, consultTeacher);
	}

	/*年报——总咨询量*/
	public int YearAllControllers(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.YearAllControllers(day, consultTeacher);
	}

	/*年报——总上门量*/
	public int YearAllComes(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.YearAllComes(day, consultTeacher);
	}

	/*年报——总定金量*/
	public int YearAllpayStatus(Date day, Integer consultTeacher) {
		
		return OaScbConsultAssistantSheetMapper.YearAllpayStatus(day, consultTeacher);
	}
	

	
	
	

}
