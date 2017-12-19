package cn.tyyhoa.service;

import java.util.List;

import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaScbConsultlesson;

/**
 * 课程
 * @author lenovo
 *
 */
public interface OaScbSpecialtyService {

	/*查询所有的课程*/
    public List<OaScbConsultlesson> ConsultlessonFind();
}
