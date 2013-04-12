package com.dss.security;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "USER_ROLES")
public class UserRoles {

	private int userRoleId;
	private Role authority;
	private Users user;
	
	public UserRoles() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserRoles(Role authority, Users user) {
		super();
		this.authority = authority;
		this.user = user;
	}

	@Id
	@GeneratedValue(generator="foreign")
	@GenericGenerator(name="foreign", strategy="foreign", 
	                                  parameters= @Parameter(name="property", value="user") )
	@Column(name = "USER_ID", unique = true, nullable = false)
	public int getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
	}

	@Column(name = "AUTHORITY", nullable = false, length = 15)
	@Enumerated(EnumType.STRING) 
	public Role getAuthority() {
		return authority;
	}

	public void setAuthority(Role authority) {
		this.authority = authority;
	}

	@OneToOne(fetch = FetchType.LAZY, optional = false)
	@PrimaryKeyJoinColumn
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	@Override
	public int hashCode() {
		
		if(authority.equals("ROLE_ADMIN")){
			return 1;
		}
		if(authority.equals("ROLE_EMPLOYEE")){
			return 2;
		}
		if(authority.equals("ROLE_GUEST")){
			return 3;
		}
		return 0;
	}

	@Override
	public boolean equals(Object obj) {
        if (obj == null)
            return false;
        if (obj == this)
            return true;
        if (obj.getClass() != getClass())
            return false;
        final UserRoles ur = (UserRoles)obj;
        return ur.getAuthority().equals(authority);

	}
	
	
	
	
}
