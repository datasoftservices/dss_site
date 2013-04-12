package com.dss.controllers;

import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dss.blogpost.*;
import com.dss.newspost.*;
import com.dss.profiles.CertificationsComparable;
import com.dss.profiles.ProfileService;
import com.dss.security.*;



/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("team")
public class ProfileController extends ExtraController{
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);
	
	@Autowired
	private BlogService bs;
	
	@Autowired
	private UserManagement uman;
	
	@Autowired
	private NewsService ns;
	
	@Autowired
	private ProfileService prof;
	
	@RequestMapping(method = RequestMethod.GET)
	public String home(Map<String, Object> map) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		map.put("news", new NewsEntry());
		map.put("newsItems", ns.listNewsItems(null,rh.getAllAuthorizedRoles(r)));
		map.put("extraJobs", getLatestJobs(rh.getAllAuthorizedRoles(r)));
		map.put("extraBlogs", getLatestBlogs(rh.getAllAuthorizedRoles(r)));
		List<UserDetails> profiles = null;
		if(r == null){
		profiles = uman.listUserDetails("1");
		}
		else{
			profiles = uman.listUserDetails();
			Iterator<UserDetails> it = profiles.iterator();
			while(it.hasNext()){
				if(it.next().getFirstName().toUpperCase().equals("ADMIN")){
					it.remove();
				}
			}
		}
		
/*		if (profiles != null){
			Iterator<UserDetails> it = profiles.iterator();
			while(it.hasNext()){
				UserDetails next = it.next();
				if(next.getDescription()==null||next.getDescription().equals("")){
					it.remove();
				}
			}
			
			
		}*/	
		map.put("profiles", profiles);
		return "profiles";
	}
	

	
	
	
}
