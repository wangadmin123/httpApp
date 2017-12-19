package cn.tyyhoa.pojo;

import java.io.Serializable;

/**
 * 阶段
 */
public class OaJwbSemester implements Serializable{

	private static final long serialVersionUID = 3795790157428880300L;
	private Integer id;
	private String stage;
	public OaJwbSemester() {
	}
	public OaJwbSemester(Integer id, String stage) {
		super();
		this.id = id;
		this.stage = stage;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	
	
}
