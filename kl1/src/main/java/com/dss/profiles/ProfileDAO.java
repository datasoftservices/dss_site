package com.dss.profiles;

import java.util.List;

import com.dss.security.Users;

public interface ProfileDAO {

	public void addCertification(Certification c);
	public void removeCertification(Certification c);
	public List<Certification> getCertifications();
	public void addCertifications(Certifications c);
	public void removeCertifications(Certifications c);
	public List<Certifications> getCertificationsForUser(Users u);
	public Certification getCertificationById(Integer id);
}
