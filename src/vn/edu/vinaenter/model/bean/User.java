package vn.edu.vinaenter.model.bean;

import javax.validation.constraints.NotEmpty;

public class User {
	private int id;
	
	private int enable;
	
	private int role_id;
	
	@NotEmpty(message="Vui lòng nhập Fullname")
	private String fullname;
	
	@NotEmpty(message="Vui lòng nhập Username")
	private String username;
	
	private String password;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public User(int id, int enable, int role_id, String fullname, String username, String password, String name) {
		super();
		this.id = id;
		this.enable = enable;
		this.role_id = role_id;
		this.fullname = fullname;
		this.username = username;
		this.password = password;
		this.name = name;
	}

	public User() {
		super();
	}

}
