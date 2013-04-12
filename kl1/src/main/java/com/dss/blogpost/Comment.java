package com.dss.blogpost;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
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

import com.dss.newspost.NewsEntry;
import com.dss.security.Users;

@Entity
@Table(name = "COMMENT")
public class Comment {

	private int id;
	private String author;
	private Timestamp created;
	private String comment;
	private int number;
	private Users user;
	private Comment originalComment;
	private Set<Comment> repliedTocomment;
	private BlogEntry blog;
	private NewsEntry news;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
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

	@Column(name = "AUTHOR", nullable = false, length = 75)
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "CREATED", nullable = false, length = 10)
	@DateTimeFormat(pattern="dd/MM/yyyy HH:mm:ss")
	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	@Column(name = "COMMENT", nullable = false, length = 20000)
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Column(name = "NUMBER", nullable = false, precision = 5, scale = 0)
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", nullable = true)
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ORIGINAL_COMMENT_ID", nullable = true)
	public Comment getOriginalComment() {
		return originalComment;
	}

	public void setOriginalComment(Comment originalComment) {
		this.originalComment = originalComment;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "originalComment")
	public Set<Comment> getRepliedTocomment() {
		return repliedTocomment;
	}

	public void setRepliedTocomment(Set<Comment> repliedTocomment) {
		this.repliedTocomment = repliedTocomment;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "BLOG_ID", nullable = true)
	public BlogEntry getBlog() {
		return blog;
	}

	public void setBlog(BlogEntry blog) {
		this.blog = blog;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "NEWS_ID", nullable = true)
	public NewsEntry getNews() {
		return news;
	}

	public void setNews(NewsEntry news) {
		this.news = news;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Comment))
			return false;
		Comment other = (Comment) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	
}
