package cn.tyyhoa.pojo;

public class OaJzbMembership {
    private Integer member_Id;//编号

    private String member;//成员

    public Integer getMember_Id() {
        return member_Id;
    }

    public void setMember_Id(Integer member_Id) {
        this.member_Id = member_Id;
    }

    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member == null ? null : member.trim();
    }
}