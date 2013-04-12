package com.dss.common;

import java.util.List;

import com.dss.blogpost.BlogEntry;
import com.dss.blogpost.BlogService;
import com.dss.jobs.Job;

public interface CommonService {

	public List<Tag> ListTags();
	public List<Tags> ListTags(BlogEntry be);
	public List<Tags> ListTags(Job j);
	public void addTag(Tag t);
	public void removeTag(Tag t);
	public void updateTag(Tag t);
	public void addTags(Tags t);
	public void deleteTags(Tags t);

}
