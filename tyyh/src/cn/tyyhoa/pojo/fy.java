package cn.tyyhoa.pojo;


import java.util.ArrayList;
import java.util.List;

public class fy {
	// ��ǰҳ��
		private Integer currPageNo;
		// ��ҳ��
		private Integer totalPageCount;
		// ������
		private Integer totalCount;
		// ÿҳ��ʾ����
		private Integer pageSize = 3;
		// ��ǰҪ��ʾ������ ��ҳ�뷢���ı�

		public Integer getCurrPageNo() {
			return currPageNo;
		}

		public void setCurrPageNo(Integer currPageNo) {
			this.currPageNo = currPageNo;
		}

		public Integer getTotalPageCount() {
			return totalPageCount;
		}

		public void setTotalPageCount(Integer totalPageCount) {
			this.totalPageCount = totalPageCount;
		}

		public Integer getTotalCount() {
			return totalCount;
		}

		public void setTotalCount(Integer totalCount) {
			// ������
			this.totalCount = totalCount;
			// ��ҳ��
			this.totalPageCount = (this.totalCount % this.pageSize == 0) ? (this.totalCount / this.pageSize)
					: (this.totalCount / this.pageSize + 1);
		}

		public Integer getPageSize() {
			return pageSize;
		}

		public void setPageSize(Integer pageSize) {
			this.pageSize = pageSize;
		}

		private List<OaScbOperation> getOaScbOperationList;

		public List<OaScbOperation> getGetOaScbOperationList() {
			return getOaScbOperationList;
		}

		public void setGetOaScbOperationList(List<OaScbOperation> getOaScbOperationList) {
			this.getOaScbOperationList = getOaScbOperationList;
		}

	}