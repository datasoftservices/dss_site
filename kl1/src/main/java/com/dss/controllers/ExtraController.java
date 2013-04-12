package com.dss.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dss.blogpost.BlogEntry;
import com.dss.blogpost.BlogService;
import com.dss.jobs.Applicant;
import com.dss.jobs.Application;
import com.dss.jobs.Job;
import com.dss.jobs.JobService;
import com.dss.newspost.NewsEntry;
import com.dss.newspost.NewsService;
import com.dss.security.Role;



public class ExtraController {


	@Autowired
	private JobService js;
	
	@Autowired
	private BlogService bs;
	
	@Autowired
	private NewsService ns;
	
	public List<BlogEntry> getLatestBlogs(List<Role> roles){
		
		List<BlogEntry> limitedblogList = bs.listBlogs(null,roles); 
		Iterator<BlogEntry> iter = limitedblogList.iterator();
		int counter = 0;
	    while(iter.hasNext()) 
	    {
	        
	        BlogEntry be = iter.next();
	        counter++;
	        if(counter > 4){
	        	iter.remove();
	        }
	    }
	    return limitedblogList;
	}
	public List<NewsEntry> getLatestNews(List<Role> roles){
		
		List<NewsEntry> limitednewsList = ns.listNewsItems(null, roles); 
		Iterator<NewsEntry> iter = limitednewsList.iterator();
		int counter = 0;
	    while(iter.hasNext()) 
	    {
	        
	        NewsEntry be = iter.next();
	        counter++;
	        if(counter > 4){
	        	iter.remove();
	        }
	    }
	    return limitednewsList;
	}
	public List<Job> getLatestJobs(List<Role> roles){
		
		List<Job> list = js.listAllJobs(null,roles); 
		List<Job> limitedJobList = new ArrayList<Job>();

	    for (Iterator<Job> iter = list.iterator(); iter.hasNext(); ) 
	    {
	        Job j = iter.next();
	        if(new Date().after(j.getVisible_from()) && new Date().before(j.getVisible_until()) && limitedJobList.size()< 4){
	        	limitedJobList.add(j);
	        }
	    }
	    return limitedJobList;
	}
}
