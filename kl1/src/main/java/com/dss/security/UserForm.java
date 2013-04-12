package com.dss.security;

public class UserForm {

	public Users user;
	public UserDetails detail;
	public UserRoles role;
	
	public UserForm(){
	super();
	}
	
	public UserForm(Users user, UserDetails detail, UserRoles role) {
		super();
		this.user = user;
		this.detail = detail;
		this.role = role;	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public UserDetails getDetail() {
		return detail;
	}

	public void setDetail(UserDetails detail) {
		this.detail = detail;
	}

	public UserRoles getRole() {
		return role;
	}

	public void setRole(UserRoles role) {
		this.role = role;
	}
}
