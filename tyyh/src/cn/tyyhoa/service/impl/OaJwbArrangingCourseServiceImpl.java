package cn.tyyhoa.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import cn.tyyhoa.dao.OaJwbArrangingCourseMapper;
import cn.tyyhoa.pojo.OaJwbArrangingCourse;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.service.OaJwbArrangingCourseService;

@Service("oaJwbArrangingCourseService")
public class OaJwbArrangingCourseServiceImpl implements OaJwbArrangingCourseService {
	@Resource(name="oaJwbArrangingCourseMapper")
	private OaJwbArrangingCourseMapper ojacm;
	public OaJwbArrangingCourseMapper getOjacm() {
		return ojacm;
	}

	public void setOjacm(OaJwbArrangingCourseMapper ojacm) {
		this.ojacm = ojacm;
	}

	@Override
	public Integer addArrange(OaJwbArrangingCourse ojac) {
		// TODO Auto-generated method stub
		return ojacm.addArrange(ojac);
	}

	@Override
	public Integer updateArrange(Integer cid, Integer course) {
		// TODO Auto-generated method stub
		return ojacm.updateArrange(cid, course);
	}

	@Override
	public Integer delArrange(Integer cid) {
		// TODO Auto-generated method stub
		return ojacm.delArrange(cid);
	}

	@Override
	public List<OaJwbArrangingCourse> getArrange(Map map) {
		// TODO Auto-generated method stub
		return ojacm.getArrange(map);
	}

	@Override
	public List<OaJwbGrade> getUnArranging(@Param("pon") Integer pon,@Param("psize") Integer psize) {
		// TODO Auto-generated method stub
		return ojacm.getUnArranging(pon,psize);
	}

	@Override
	public Integer getUnArrangingcount() {
		// TODO Auto-generated method stub
		return ojacm.getUnArrangingcount();
	}

	@Override
	public Integer getArrangecount(Map map) {
		// TODO Auto-generated method stub
		return ojacm.getArrangecount(map);
	}

}
