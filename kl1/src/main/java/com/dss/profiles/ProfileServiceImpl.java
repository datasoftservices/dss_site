package com.dss.profiles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dss.security.Users;

@Service
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	private ProfileDAO profDAO;

	@Override
	@Transactional
	public void addCertification(Certification c) {
		profDAO.addCertification(c);
	}

	@Override
	@Transactional
	public Certification getCertificationById(Integer id) {
		return profDAO.getCertificationById(id);
	}
	
	@Override
	@Transactional
	public void removeCertification(Certification c) {
		profDAO.removeCertification(c);
	}

	@Override
	@Transactional
	public List<Certification> getCertifications() {
		return profDAO.getCertifications();
	}

	@Override
	@Transactional
	public void addCertifications(Certifications c) {
		profDAO.addCertifications(c);
	}

	@Override
	@Transactional
	public void removeCertifications(Certifications c) {
		profDAO.removeCertifications(c);
	}

	@Override
	@Transactional
	public List<Certifications> getCertificationsForUser(Users u) {
		return profDAO.getCertificationsForUser(u);
	}

}
