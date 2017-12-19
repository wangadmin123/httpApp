package cn.tyyhoa.pojo;

public class OaScbInfosource {
    private Integer id;//编号

    private String infoSource;//信息来源（网络/其他)

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInfoSource() {
        return infoSource;
    }

    public void setInfoSource(String infoSource) {
        this.infoSource = infoSource == null ? null : infoSource.trim();
    }
}