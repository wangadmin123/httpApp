package cn.tyyhoa.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybReportMapper;
import cn.tyyhoa.pojo.OaJybReport;
import cn.tyyhoa.service.OaJybRecordService;
@Service("oaJybRecordService")
public class OaJybRecordServiceImpl implements OaJybRecordService {
	@Autowired
	private OaJybReportMapper oaJybReportMapper;
	
	public OaJybReportMapper getOaJybReportMapper() {
		return oaJybReportMapper;
	}

	public void setOaJybReportMapper(OaJybReportMapper oaJybReportMapper) {
		this.oaJybReportMapper = oaJybReportMapper;
	}

	@Override
	public int insertSelective(OaJybReport oaJybReport) {
		// TODO Auto-generated method stub
		return oaJybReportMapper.insertSelective(oaJybReport);
	}

	

	@Override
	public OaJybReport selectByPrimaryKey(Integer report_id) {
		// TODO Auto-generated method stub
		return oaJybReportMapper.selectByPrimaryKey(report_id);
	}

	@Override
	public List<OaJybReport> GetAllReport(int index, int pageSize,
			String report_type, Date report_createtime,int emp_id) {
		// TODO Auto-generated method stub
		return oaJybReportMapper.GetAllReport((index-1)*pageSize, pageSize, report_type, report_createtime,emp_id);
	}

	@Override
	public int allcounts(String report_type, Date report_createtime,int emp_id) {
		// TODO Auto-generated method stub
		return oaJybReportMapper.allcounts(report_type, report_createtime,emp_id);
	}

	@Override
	public int updateByPrimaryKeySelective(OaJybReport record) {
		// TODO Auto-generated method stub
		return oaJybReportMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	 public List<OaJybReport> GetAllpeople() {
		// TODO Auto-generated method stub
		return oaJybReportMapper.GetAllpeople();
	}

	@Override
	public int allbumencounts(String report_type, Date report_createtime,
			String report_people) {
		// TODO Auto-generated method stub
		return oaJybReportMapper.allbumencounts(report_type, report_createtime, report_people);
	}

	@Override
	public List<OaJybReport> GetbumenReport(int index, int pageSize,
			String report_type, Date report_createtime, String report_people) {
		// TODO Auto-generated method stub
		return oaJybReportMapper.GetbumenReport((index-1)*pageSize, pageSize, report_type, report_createtime, report_people);
	}

}
