package com.dss.newspost;

import java.util.Date;
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

import com.dss.security.Role;
import com.dss.security.Users;
import com.dss.blogpost.Comment;
import com.dss.common.Tags;

@Entity
@Table(name = "NEWS_ENTRY")
public class NewsEntry {
	
	private int id;	
	private String intro;
	private String message;
	private String author;
	private String title;
	private String link;
	private Date created;
	private Role visibleFor;

	private Users user;
	private Set<Tags> tags;
	private Set<Comment> comments;
	
	public NewsEntry() {
		super();
	}
	
	public NewsEntry(Users user, int id, String message) {
		super();
		this.user = user;
		this.id = id;
		this.message = message;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", nullable = false)
	public Users getUser() {
		return user;
	}
	
	public void setUser(Users user) {
		this.user = user;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ID", unique = true, nullable = false, precision = 5, scale = 0)
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "intro", nullable = true, length = 5000)
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
	
	public void setMessage(String message) {
		this.message = message;
	}

	@Column(name = "AUTHOR", nullable = false, length = 75)
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Column(name = "TITLE", nullable = true, length = 100)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "LINK", nullable = true, length = 200)
	public String getLink() {
		return link;
	}
	
	public void setLink(String link) {
		this.link = link;
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
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "news")
	public Set<Tags> getTags() {
		return tags;
	}

	public void setTags(Set<Tags> tags) {
		this.tags = tags;
	}
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "news")
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
