package cn.tyyhoa.pojo;

public class OaScbRanktype {
    private Integer id;//编号

    private String rank;//等级分类

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank == null ? null : rank.trim();
    }
}