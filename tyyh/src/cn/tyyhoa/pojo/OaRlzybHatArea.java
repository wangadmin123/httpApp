package cn.tyyhoa.pojo;

public class OaRlzybHatArea {
    private Integer id;

    private String areaID;

    private String area;

    private String father;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAreaID() {
        return areaID;
    }

    public void setAreaID(String areaID) {
        this.areaID = areaID == null ? null : areaID.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father == null ? null : father.trim();
    }
}