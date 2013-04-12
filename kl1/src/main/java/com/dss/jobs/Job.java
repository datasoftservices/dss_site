package com.dss.jobs;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

import com.dss.common.Tags;
import com.dss.security.Role;

@Entity
@Table(name = "JOB")
public class Job {

	private int id;
	private String title;
	private String description;
	private String location;
	private String reference;
	private String type;
	private String category;
	private Date visible_from;
	private Date visible_until;
	private Role visible_for;
	private String period;
	private Date startDate;
	private Set<Application> application;
	private List<Tags> tags;
	
	public Job() {
		super();
	}
	
	public Job(String title, String description, String location) {
		super();
		this.title = title;
		this.description = description;
		this.location = location;
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
	@Column(name = "TITLE", nullable = false, length = 200)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name = "DESCRIPTION", nullable = false, length = 5000)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name = "LOCATION", nullable = true, length = 100)
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Column(name = "REFERENCE", nullable = true, length = 10)
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	@Column(name = "TYPE", nullable = true, length = 50)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "CATEGORY", nullable = true, length = 50)
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "SHOW_FROM", nullable = false, length = 10)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	public Date getVisible_from() {
		return visible_from;
	}
	public void setVisible_from(Date visible_from) {
		this.visible_from = visible_from;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "SHOW_UNTIL", nullable = false, length = 10)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	public Date getVisible_until() {
		return visible_until;
	}
	public void setVisible_until(Date visible_until) {
		this.visible_until = visible_until;
	}
	@Column(name = "VISIBLE_FOR_ROLE", nullable = false, length = 15)
	@Enumerated(EnumType.STRING) 
	public Role getVisible_for() {
		return visible_for;
	}
	public void setVisible_for(Role visible_for) {
		this.visible_for = visible_for;
	}
	@Column(name = "PERIOD", nullable = true, length = 50)	
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "START", nullable = false, length = 10)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "job")
	public Set<Application> getApplication() {
		return application;
	}

	public void setApplication(Set<Application> application) {
		this.application = application;
	}
	
	public void generateReference(int i){
		String number = String.format("%03d", i);

		reference = location.toUpperCase().substring(0, 3)+"_"+category.replace('.', ' ').trim().toUpperCase().substring(0, 3)+number;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "job")
	public List<Tags> getTags() {
		return tags;
	}

	public void setTags(List<Tags> tags) {
		this.tags = tags;
	}
	
	
}
