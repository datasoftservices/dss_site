package com.dss.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dss.blogpost.BlogEntry;
import com.dss.jobs.Job;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private TagDAO tagDAO;
	@Override
	@Transactional
	public List<Tag> ListTags() {
		return tagDAO.ListTags();
	}

	@Override
	@Transactional
	public void addTag(Tag t) {
		tagDAO.addTag(t);
	}

	@Override
	@Transactional
	public void removeTag(Tag t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public void updateTag(Tag t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public List<Tags> ListTags(BlogEntry be) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public List<Tags> ListTags(Job j) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void addTags(Tags t) {
		tagDAO.addTags(t);		
	}

	@Override
	@Transactional
	public void deleteTags(Tags t) {
		tagDAO.deleteTags(t);			
	}

}
