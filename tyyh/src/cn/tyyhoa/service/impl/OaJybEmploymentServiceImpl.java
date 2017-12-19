package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJybChronicleMapper;
import cn.tyyhoa.dao.OaJybCompanyMapper;
import cn.tyyhoa.dao.OaJybEmploymentMapper;
import cn.tyyhoa.dao.OaRlzybHatCityMapper;
import cn.tyyhoa.dao.OaRlzybHatProvinceMapper;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJybCompany;
import cn.tyyhoa.pojo.OaJybEmployment;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybHatCity;
import cn.tyyhoa.pojo.OaRlzybHatProvince;
import cn.tyyhoa.service.OaJybEmploymentService;

@Service(value="OaJybEmploymentService")
public class OaJybEmploymentServiceImpl implements OaJybEmploymentService{
	@Autowired
	private OaJybEmploymentMapper oaJybEmploymentMapper;
	
	@Autowired
	private OaRlzybHatProvinceMapper oaRlzybHatProvinceMapper;
		

	@Autowired
	private OaRlzybHatCityMapper oaRlzybHatCityMapper;
	
	@Autowired
	private OaJybCompanyMapper oaJybCompanyMapper;
	
	
	@Autowired
	private OaJybChronicleMapper oaJybChronicleMapper;

	public void setOaJybChronicleMapper(OaJybChronicleMapper oaJybChronicleMapper) {
		this.oaJybChronicleMapper = oaJybChronicleMapper;
	}


	public void setOaJybCompanyMapper(OaJybCompanyMapper oaJybCompanyMapper) {
		this.oaJybCompanyMapper = oaJybCompanyMapper;
	}


	public void setOaRlzybHatCityMapper(OaRlzybHatCityMapper oaRlzybHatCityMapper) {
		this.oaRlzybHatCityMapper = oaRlzybHatCityMapper;
	}
	
	
	public void setOaRlzybHatProvinceMapper(
			OaRlzybHatProvinceMapper oaRlzybHatProvinceMapper) {
		this.oaRlzybHatProvinceMapper = oaRlzybHatProvinceMapper;
	}

	public void setOaJybEmploymentMapper(OaJybEmploymentMapper oaJybEmploymentMapper) {
		this.oaJybEmploymentMapper = oaJybEmploymentMapper;
	}

	@Override
	public List<OaJybEmployment> selectOaJybEmployments(Map<String, Object> m) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectOaJybEmployments(m);
	}


	@Override
	public int selectOaJybEmploymentByCount(Map<String, Object> emp) {
		return oaJybEmploymentMapper.count(emp);
	}


	@Override
	public List<OaJybEmployment> selectCity() {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectCity();
	}


	@Override
	public int empinsertSelective(OaJybEmployment record) {	
		return oaJybEmploymentMapper.empinsertSelective(record);
	}

	@Override
	public OaJybEmployment selectempbyterm(OaJybEmployment record) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectempbyterm(record);
	}

	@Override
	public int selectEmpStatic(Map<String, Comparable> m) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectEmpStatic(m);
	}

	@Override
	public List<OaRlzybHatProvince> selectAllcity1() {
		// TODO Auto-generated method stub
		return oaRlzybHatProvinceMapper.selectAllOaRlzybHatProvince();
	}

	@Override
	public List<OaRlzybHatCity> selectAllcity2(String ProvinceId) {
		// TODO Auto-generated method stub
		return oaRlzybHatCityMapper.selectSomeOaRlzybHatCityByfather(ProvinceId);
	}


	@Override
	public List<OaJybCompany> GetAllComList() {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.GetAllComList();
	}


	@Override
	public OaJybCompany GetByComLEnglist(Integer comid) {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.GetByComLEnglist(comid);
	}


	@Override
	public List<OaJzbStudent> selectDaiStu(Map m) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectDaiStu(m);
	}


	@Override
	public int selStuCount(Map o) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selStuCount(o);
	}


	@Override
	public List<OaJzbStudent> daiCity() {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.daiCity();
	}


	@Override
	public OaRlzybHatCity selectByCityPojoKey(String city) {
		// TODO Auto-generated method stub
		return oaRlzybHatCityMapper.selectByCityPojoKey(city);
	}


	@Override
	public List<OaJzbStudent> daibanji() {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.daibanji();
	}

	@Override
	public List<OaJzbStudent> daixueli() {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.daixueli();
	}


	@Override
	public List<OaJybEmployment> selectRecord(String className) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectRecord(className);
	}


	@Override
	public List<OaJybEmployment> selectClassName() {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectClassName();
	}


	@Override
	public List<OaJybEmployment> selectCity1(String className) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectCity1(className);
				
	}


	@Override
	public List<OaJzbStudent> selectAllBiyeStu() {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectAllBiyeStu();
	}


	@Override
	public List<OaJybEmployment> selectDaiEmp(Map m) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectDaiEmp(m);
	}


	@Override
	public void StuStatus(int stuId) {
		// TODO Auto-generated method stub
		oaJybEmploymentMapper.StuStatus(stuId);
	}


	@Override
	public void StuStatus2(int gradeId) {
		oaJybEmploymentMapper.StuStatus2(gradeId);
		
	}


	@Override
	public List<OaJzbStudent> selectDaiStu2(int id) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectDaiStu2(id);
	}


	@Override
	public int updateByPrimaryKeySelective(OaJybEmployment record) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.updateByPrimaryKeySelective(record);
	}


	@Override
	public int insertSelective(OaJybChronicle oaJybChronicle) {
		// TODO Auto-generated method stub
		return oaJybChronicleMapper.insertSelective(oaJybChronicle);
	}


	@Override
	public List<OaJybEmployment> selectOaJybEmployments2(Map<String, Object> m) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectOaJybEmployments2(m);
	}


	@Override
	public List<OaJybEmployment> selectRecord2() {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectRecord2();
	}


	@Override
	public int selectEmpStatic2(Map<String, Comparable> m) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectEmpStatic2(m);
	}


	@Override
	public List<OaJwbGrade> empClass(int empTecid,int positionid) {
		return oaJybEmploymentMapper.empClass(empTecid,positionid);
	}


	@Override
	public int count2(Map<String, Object> emp) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.count2(emp);
	}
/*

	@Override
	public OaJybCompany GetByComLEnglist2(String comName) {
		// TODO Auto-generated method stub
		return oaJybCompanyMapper.GetByComLEnglist2(comName);
	}

*/


	@Override
	public int insertId(int id) {
		// TODO 自动生成的方法存根
		return oaJybEmploymentMapper.insertId(id);
	}


	@Override
	public OaJybEmployment selectoneEmp(int stuid) {
		// TODO Auto-generated method stub
		return oaJybEmploymentMapper.selectoneEmp(stuid);
	}
	
}
