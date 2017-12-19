package cn.tyyhoa.pojo;

public class OaJwbArrangingCourse {
	private Integer id;
	private OaJwbGrade classId;
	private Integer course;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public OaJwbGrade getClassId() {
		return classId;
	}
	public void setClassId(OaJwbGrade classId) {
		this.classId = classId;
	}
	public Integer getCourse() {
		return course;
	}
	public void setCourse(Integer course) {
		this.course = course;
	}
}
