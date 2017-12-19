package cn.tyyhoa.pojo;

public class OaJzbQuestion {
    private Integer id;//问题编号

    private String question;//问题

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }
}