package com.dss.controllers;

import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import com.dss.security.*;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController extends ExtraController{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BlogService bs;
	
	@Autowired
	private UserManagement uman;
	
	@Autowired
	private NewsService ns;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/","index"}, method = RequestMethod.GET)
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

			
		return "index";
	}
	
	@RequestMapping(value = {"version"}, method = RequestMethod.GET)
	public String wrongBrowserVersion(Map<String, Object> map) {
			
		return "version";
	}
	
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
 
		return "login";
	}
	
	@RequestMapping(value="/redirect", method = RequestMethod.GET)
	public String redirect(ModelMap model) {
 
		return "redirect";
	}
	
	
	
}
