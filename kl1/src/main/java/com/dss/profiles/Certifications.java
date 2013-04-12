package com.dss.profiles;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.dss.security.UserDetails;

@Entity
@Table(name = "CERTIFICATIONS")
public class Certifications {


	private int id;
	private Certification certification;
	private UserDetails detail;
	private Date certificationDate;

	public Certifications(){
		super();
	}
	public Certifications(Certification certification, UserDetails UserDetails) {
		super();
		this.certification = certification;
		this.detail = UserDetails;
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
	@JoinColumn(name = "CERTIFICATION_ID", nullable = false)
	public Certification getCertification() {
		return certification;
	}
	public void setCertification(Certification certification) {
		this.certification = certification;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "USER_ID", nullable = true)
	public UserDetails getDetail() {
		return detail;
	}
	public void setDetail(UserDetails UserDetails) {
		this.detail = UserDetails;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "CERTIFICATION_DATE", nullable = false, length = 10)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	public Date getCertificationDate() {
		return certificationDate;
	}
	public void setCertificationDate(Date certificationDate) {
		this.certificationDate = certificationDate;
	}
	

}
