package cn.tyyhoa.pojo;

/**
 * 咨询课程表
 * @author lenovo
 *
 */
public class OaScbConsultlesson {
    private Integer id;//编号

    private String consultLesson;//咨询课程
    
    private Integer usesion;//是否可用

    public Integer getUse() {
		return usesion;
	}

	public void setUse(Integer usesion) {
		this.usesion = usesion;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConsultLesson() {
        return consultLesson;
    }

    public void setConsultLesson(String consultLesson) {
        this.consultLesson = consultLesson == null ? null : consultLesson.trim();
    }
}