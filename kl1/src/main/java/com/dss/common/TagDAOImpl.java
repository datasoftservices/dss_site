package com.dss.common;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dss.blogpost.BlogEntry;
import com.dss.jobs.Job;

@Repository
public class TagDAOImpl implements TagDAO {

	@Autowired
	private SessionFactory sf;
	
	@Override
	public List<Tag> ListTags() {
		return sf.getCurrentSession().createQuery("from Tag").list();
	}

	@Override
	public void addTag(Tag t) {
		sf.getCurrentSession().save(t);	
	}

	@Override
	public void removeTag(Tag t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTag(Tag t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Tags> ListTags(BlogEntry be) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Tags> ListTags(Job j) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addTags(Tags t) {
		sf.getCurrentSession().save(t);	
	}
	
	@Override
	public void deleteTags(Tags t) {
		sf.getCurrentSession().delete(t);
	}

}
