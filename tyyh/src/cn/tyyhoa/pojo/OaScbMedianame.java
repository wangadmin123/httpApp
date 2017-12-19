package cn.tyyhoa.pojo;

/**
 * 媒体名称
 * @author lenovo
 *
 */
public class OaScbMedianame {
    private Integer id;//编号

    private String mediaName;//媒体名称

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMediaName() {
        return mediaName;
    }

    public void setMediaName(String mediaName) {
        this.mediaName = mediaName == null ? null : mediaName.trim();
    }
}