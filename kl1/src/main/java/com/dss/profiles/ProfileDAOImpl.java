package com.dss.profiles;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dss.security.Users;

@Repository
public class ProfileDAOImpl implements ProfileDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	

	@Override
	public void addCertification(Certification c) {
		sessionFactory.getCurrentSession().save(c);	
	}
	
	@Override
	public Certification getCertificationById(Integer id) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Certifications c where c.id = :param");
		query.setParameter("param", id);
		if(!query.list().isEmpty()){
			return (Certification) query.list().get(0);
		}
		else return null;
	}

	@Override
	public void removeCertification(Certification c) {
		sessionFactory.getCurrentSession().delete(c);
		
	}

	@Override
	public List<Certification> getCertifications() {
		Query query = sessionFactory.getCurrentSession().createQuery("from Certification");
		return query.list();
	}

	@Override
	public void addCertifications(Certifications c) {
		sessionFactory.getCurrentSession().save(c);
		
	}

	@Override
	public void removeCertifications(Certifications c) {
		sessionFactory.getCurrentSession().delete(c);
		
	}

	@Override
	public List<Certifications> getCertificationsForUser(Users u) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Certifications c where c.detail.userId = :userId");
		query.setParameter("userId", u.getUserId());
		return query.list();
	}

}
