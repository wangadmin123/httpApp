package cn.tyyhoa.pojo;

public class OaJzbGroup {

		private Integer id;
		private String group_name;//小组名称
		private Integer deleteStatus;//删除状态
		private Integer grade_id;//班级id
		private String student_name;//学生姓名
		
		public String getStudent_name() {
			return student_name;
		}
		public void setStudent_name(String student_name) {
			this.student_name = student_name;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getGroup_name() {
			return group_name;
		}
		public void setGroup_name(String group_name) {
			this.group_name = group_name;
		}
		public Integer getDeleteStatus() {
			return deleteStatus;
		}
		public void setDeleteStatus(Integer deleteStatus) {
			this.deleteStatus = deleteStatus;
		}
		public Integer getGrade_id() {
			return grade_id;
		}
		public void setGrade_id(Integer grade_id) {
			this.grade_id = grade_id;
		}
	
 
		
}
