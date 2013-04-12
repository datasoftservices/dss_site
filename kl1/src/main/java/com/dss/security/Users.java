package com.dss.security;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

import com.dss.newspost.NewsEntry;

@Entity
@Table(name = "USERS")
public class Users {
	
	private int userId;
	private String userName;
	private String userPassword;
	private int enabled;
	private UserDetails userdetail;
	private UserRoles roles;
	private Set<NewsEntry> newsItems;
	//private Profile profile;
	
	public Users(){
		super();
	}
	
	public Users(int userId, String userName, String userPassword, int enabled) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.enabled = enabled;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "USER_ID", unique = true, nullable = false, precision = 10, scale = 0)
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	@Column(name = "USERNAME", nullable = false, length = 45)
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name = "PASSWORD", nullable = false, length = 64)
	public String getUserPassword() {
		return userPassword;
	}
	
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	@Column(name = "ENABLED", nullable = false, length = 1)
	public int getEnabled() {
		return enabled;
	}
	
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@OneToOne(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
	public UserDetails getUserdetail() {
		return userdetail;
	}

	public void setUserdetail(UserDetails userdetail) {
		this.userdetail = userdetail;
	}
	
	
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL, optional = true)
	public UserRoles getRoles() {
		return roles;
	}

	public void setRoles(UserRoles roles) {
		this.roles = roles;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<NewsEntry> getNewsItems() {
		return newsItems;
	}

	public void setNewsItems(Set<NewsEntry> newsItems) {
		this.newsItems = newsItems;
	}

/*	@OneToOne(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}
*/
	public int hashCode(){
		return userId;
	}
	
	public boolean equals(Object o){
        if (o == null)
            return false;
        if (o == this)
            return true;
        if (o.getClass() != getClass())
            return false;
        
        final Users u = (Users)o;
        if(u.getUserId()!= userId)
        	return false;
        
        return true;
	}
	
}
