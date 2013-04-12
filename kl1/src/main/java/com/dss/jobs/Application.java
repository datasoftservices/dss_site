package com.dss.jobs;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "APPLICATION")
public class Application {

	private int id;
	public Applicant applicant;
	public Job job;
	public Resume resume;
	
	public Application() {
		super();
	}
	
	public Application(Applicant applicant, Job job, Resume resume) {
		super();
		this.applicant = applicant;
		this.job = job;
		this.resume = resume;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "APPLICANT_ID", nullable = false)
	public Applicant getApplicant() {
		return applicant;
	}
	
	public void setApplicant(Applicant applicant) {
		this.applicant = applicant;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "JOB_ID", nullable = false)
	public Job getJob() {
		return job;
	}
	
	public void setJob(Job job) {
		this.job = job;
	}
	
	@Transient
	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	
}
