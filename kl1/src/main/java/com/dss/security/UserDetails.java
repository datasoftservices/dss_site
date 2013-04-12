package com.dss.security;

import java.util.Collections;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.dss.profiles.Certifications;
import com.dss.profiles.CertificationsComparable;

@Entity
@Table(name = "USER_DETAILS")
public class UserDetails {

	private Users user;
	private int userId;
	private String firstName;
	private String lastName;
	private String email;
	private List<Certifications> certifications;
	private String visible;
	private String employedSince;
	private String imageURL;
	private String description;
	private String position;
	private String linkedinURL;
	
	public UserDetails() {
		super();
	}

	public UserDetails(Users user, String firstName, String lastName,String email) {
		super();
		this.user = user;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
	}
	
	public void setUser(Users user) {
		this.user = user;
	}
	@Id
	@GeneratedValue(generator="foreign")
	@GenericGenerator(name="foreign", strategy="foreign", 
	                                  parameters= @Parameter(name="property", value="user") )
	@Column(name = "USER_ID", unique = true, nullable = false)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public Users getUser() {
		return user;
	}

	@Column(name = "FIRSTNAME", nullable = false, length = 45)
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	@Column(name = "LASTNAME", nullable = false, length = 75)
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Column(name = "EMAIL", nullable = true, length = 75)
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "detail")
	public List<Certifications> getCertifications() {
		if(certifications!=null && !certifications.isEmpty()){

		Collections.sort(certifications,new CertificationsComparable());
		}
		return certifications;
	}
	public void setCertifications(List<Certifications> certifications) {
		this.certifications = certifications;
	}
	
	@Column(name = "VISIBLE", nullable = true, length = 1)
	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}

	@Column(name = "EMPLOYEE_SINCE", nullable = true, length = 30)
	public String getEmployedSince() {
		return employedSince;
	}

	public void setEmployedSince(String employedSince) {
		this.employedSince = employedSince;
	}

	@Column(name = "IMAGE_URL", nullable = true, length = 150)
	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	@Column(name = "DESCRIPTION", nullable = true, length = 20000)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "POSITION", nullable = true, length = 75)
	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Column(name = "LINKEDIN_URL", nullable = true, length = 100)
	public String getLinkedinURL() {
		return linkedinURL;
	}

	public void setLinkedinURL(String linkedinURL) {
		this.linkedinURL = linkedinURL;
	}

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
        
        final UserDetails u = (UserDetails)o;
        if(u.getUserId()!= userId)
        	return false;
        
        return true;
	}
}
