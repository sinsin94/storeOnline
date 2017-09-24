package com.store.util;

import javax.servlet.http.HttpServletRequest;

/**
 * ��Ҫע��HttpServletRequest�������ڷ�װ�����ϵķ�ҳ����
 * 
 * @author Administrator
 * 
 */
public class PageInfo {
	// HTTP����
	private HttpServletRequest req;
	// ÿҳ�ļ�¼��
	private int pageSize = 10;
	// ��ǰҳ
	private int currentPageNo = 1;
	// ��ʼ��¼��
	private int beginResult = 0;
	// �ܼ�¼��
	private int totalResult = 0;
	// ��ҳ��
	private int totalPage = 0;

	private PageBean page = null;

	/**
	 * ��ʼ��
	 * 
	 * @param req
	 *            HttpServletRequest HTTP����
	 */
	public PageInfo(HttpServletRequest req) {
		this.currentPageNo = req.getParameter("pageNO") != null
				&& !req.getParameter("pageNO").equals("") ? new Integer(
				req.getParameter("pageNO")).intValue() : 1;
		this.pageSize = req.getParameter("pageSize") != null
				&& !req.getParameter("pageSize").equals("") ? new Integer(
				req.getParameter("pageSize")).intValue() : 10;
		if (this.pageSize <= 0) {

			this.pageSize = 10;

		}
		this.req = req;
	}

	public PageInfo() {
		this.currentPageNo = 1;
		this.pageSize = 10;

	}

	public PageInfo(int currentPageNo) {

		this.currentPageNo = currentPageNo;
		this.pageSize = 10;

	}

	/**
	 * ������ҳ��
	 */
	private void countPages() {
		if (totalResult == 0) {
			this.totalPage = 1;
		} else {
			this.totalPage = (totalResult / pageSize); // �ܹ���ҳ
			if ((totalResult % pageSize) != 0)
				this.totalPage = this.totalPage + 1;
		}
	}

	public boolean isFirstPage() {

		if (this.currentPageNo <= 1) {

			return true;
		} else {
			return false;
		}
	}

	public boolean isLastPage() {

		if (this.currentPageNo >= this.totalPage) {

			return true;
		} else {
			return false;
		}
	}

	/**
	 * ��õ�ǰҳ
	 * 
	 * @return int ��ǰҳ
	 */
	public int getCurrentPageNo() {
		return currentPageNo;
	}

	/**
	 * ���ÿҳ�ļ�¼��
	 * 
	 * @return int
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * ����ܼ�¼��
	 * 
	 * @return int
	 */
	public int getTotalResult() {
		return totalResult;
	}

	/**
	 * ���õ�ǰҳ
	 * 
	 * @param current
	 *            int ��ǰҳ��
	 */
	public void setCurrentPageNo(int current) {
		this.currentPageNo = current;
	}

	/**
	 * ����ÿҳ�ļ�¼��
	 * 
	 * @param i
	 *            int ��¼��
	 */
	public void setPageSize(int i) {
		this.pageSize = i;
	}

	/**
	 * ��ÿ�ʼ��¼��
	 * 
	 * @return int ��ʼ��¼��
	 */
	public int getBeginResult() {
		if (totalPage != 1) {
			if (currentPageNo >= totalPage) {
				currentPageNo = totalPage;
				beginResult = (currentPageNo - 1) * pageSize;
				pageSize = totalResult - beginResult;
			} else {

				beginResult = (currentPageNo - 1) * pageSize;
			}
		}
		if (totalPage == 1) {
			currentPageNo = totalPage;

			beginResult = 0;
			pageSize = totalResult;
		}
		setRequestValue();
		return beginResult;
	}

	/**
	 * @param i
	 */
	public void setBeginResult(int i) {
		this.beginResult = i;
	}

	/**
	 * �����ҳ��
	 * 
	 * @return int ��ҳ��
	 */
	public int getTotalPage() {
		return totalPage;
	}

	/**
	 * @param totalResult
	 *            The totalResult to set. ���ø÷�ҳ��Ϣ�ܹ��ж�������¼
	 */
	public void setTotalResult(int totalResult) {
		this.totalResult = totalResult;
		countPages();
	}

	/**
	 * �������
	 */
	private void setRequestValue() {
		page = new PageBean();
		page.setFirstPage(isFirstPage());
		page.setLastPage(isLastPage());
		page.setPageNo(currentPageNo);
		page.setPageSize(pageSize);
		page.setSumPage(totalPage);
		page.setTotalResult(totalResult);

	}

	public PageBean getPageBean() {
		return page;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * ��ȡrequest����
	 * 
	 * @return
	 */
	public HttpServletRequest getReq() {
		return req;
	}

}
