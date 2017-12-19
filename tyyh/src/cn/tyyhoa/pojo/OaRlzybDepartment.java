package cn.tyyhoa.pojo;

import java.util.ArrayList;
import java.util.List;

public class OaRlzybDepartment {
    private Integer depart_id;

    private String depart_name;
    
    private List<OaRlzybUser> li = new ArrayList<OaRlzybUser>();
    

    public Integer getDepart_id() {
        return depart_id;
    }

    public void setDepart_id(Integer depart_id) {
        this.depart_id = depart_id;
    }

    public String getDepart_name() {
        return depart_name;
    }

    public void setDepart_name(String depart_name) {
        this.depart_name = depart_name == null ? null : depart_name.trim();
    }

	public List<OaRlzybUser> getLi() {
		return li;
	}

	public void setLi(List<OaRlzybUser> li) {
		this.li = li;
	}
}