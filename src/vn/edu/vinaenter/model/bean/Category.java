package vn.edu.vinaenter.model.bean;

import javax.validation.constraints.NotEmpty;

public class Category {
	private int cid;

	@NotEmpty(message = "Vui lòng không để trống Tên danh mục")
	private String cname;

	private int total;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Category() {
		super();
	}

	public Category(int cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}

	public Category(int cid, @NotEmpty(message = "Vui lòng không để trống Tên danh mục") String cname, int total) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.total = total;
	}

}
