package com.dss.blogpost;


import java.util.Date;
import java.util.List;
import java.util.Set;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.dss.common.Tags;
import com.dss.security.Role;
import com.dss.security.Users;

@Entity
@Table(name = "BLOG_ENTRY")
public class BlogEntry {
	
	private int id;
	private String intro;
	private String message;
	private String author;
	private String title;
	private Date created;
	private Role visibleFor;
	
	private Users user;
	private Set<Tags> tags;
	private Set<Comment> comments;
	
	public BlogEntry() {
	}

	public BlogEntry(int id, String message, Date created) {
		super();
		this.id = id;
		this.message = message;
		this.created = created;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "BLOG_ID", unique = true, nullable = false, precision = 5, scale = 0)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "INTRO", nullable = true, length = 2000)	
	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	@Column(name = "MESSAGE", nullable = true, length = 20000)
	public String getMessage() {
		return message;
	}
	
	@Column(name = "AUTHOR", nullable = false, length = 75)
	public String getAuthor() {
		return author;
	}
	
	@Column(name = "TITLE", nullable = true, length = 100)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
	@Temporal(TemporalType.DATE)
	@Column(name = "CREATED", nullable = true, length = 10)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
	
	@Column(name = "VISIBLE_FOR_ROLE", nullable = true, length = 15)
	@Enumerated(EnumType.STRING) 
	public Role getVisibleFor() {
		return visibleFor;
	}

	public void setVisibleFor(Role visibleFor) {
		this.visibleFor = visibleFor;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", nullable = false)
	public Users getUser() {
		return user;
	}
	
	public void setUser(Users user) {
		this.user = user;
	}
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "blog")
	public Set<Tags> getTags() {
		return tags;
	}

	public void setTags(Set<Tags> tags) {
		this.tags = tags;
	}
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "blog")
	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public void initIntro(){
		String[] arr = message.split("<intro>", 2);
		intro = "";
		for(int i = 0;i < arr.length-1;i++){
			intro = intro + arr[i];
		}
	}
}
