package cn.tyyhoa.pojo;

public class OaScbConsultway {
    private Integer id;//编号

    private String consultWay;//咨询方式
    
    private int usesion;

    public int getUsesion() {
		return usesion;
	}

	public void setUsesion(int usesion) {
		this.usesion = usesion;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getConsultWay() {
        return consultWay;
    }

    public void setConsultWay(String consultWay) {
        this.consultWay = consultWay == null ? null : consultWay.trim();
    }
}