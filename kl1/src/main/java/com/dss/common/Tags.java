package com.dss.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.dss.blogpost.BlogEntry;
import com.dss.jobs.Job;
import com.dss.newspost.NewsEntry;


@Entity
@Table(name = "TAGS")
public class Tags {
	
	private int id;
	private Tag tag;
	private BlogEntry blog;
	private Job job;
	private NewsEntry news;

	public Tags(){
		super();
	}
	public Tags(Tag tag, BlogEntry blog) {
		super();
		this.tag = tag;
		this.blog = blog;
	}
	
	public Tags(Tag tag, Job job) {
		super();
		this.tag = tag;
		this.job = job;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "ID", unique = true, nullable = false, precision = 10, scale = 0)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "TAG_ID", nullable = false)
	public Tag getTag() {
		return tag;
	}
	public void setTag(Tag tag) {
		this.tag = tag;
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
	@JoinColumn(name = "JOB_ID", nullable = true)
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "NEWS_ID", nullable = true)
	public NewsEntry getNews() {
		return news;
	}
	public void setNews(NewsEntry news) {
		this.news = news;
	}
	
	
}
