package vn.edu.vinaenter.model.bean;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;

public class Land {
	private int lid;
	private int count_views;
	private int cid;
	
	private double area;
	private Timestamp date_create;
	
	private String picture;
	
	@NotEmpty(message="Không để trống tên tin")
	private String lname;
	
	@NotEmpty(message="Không để trống mô tả")
	private String description;
	
	@NotEmpty(message="Không để trống địa chỉ")
	private String address;
	private String cname;
	
	@NotEmpty(message="Không để trống chi tiết")
	private String detail;

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getDate_create() {
		return date_create;
	}

	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCount_views() {
		return count_views;
	}

	public void setCount_views(int coutn_views) {
		this.count_views = coutn_views;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Land(int lid, int coutn_views, int cid, double area, Timestamp date_create, String picture, String lname,
			String description, String address, String cname, String detail) {
		super();
		this.lid = lid;
		this.count_views = coutn_views;
		this.cid = cid;
		this.area = area;
		this.date_create = date_create;
		this.picture = picture;
		this.lname = lname;
		this.description = description;
		this.address = address;
		this.cname = cname;
		this.detail = detail;
	}

	public Land() {
		super();
	}

}
