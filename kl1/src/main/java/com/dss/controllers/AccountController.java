package com.dss.controllers;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dss.blogpost.BlogEntry;
import com.dss.common.Tag;
import com.dss.common.Tags;
import com.dss.profiles.Certifications;
import com.dss.profiles.ProfileService;
import com.dss.security.Role;
import com.dss.security.RoleHelper;
import com.dss.security.UserDetails;
import com.dss.security.UserManagement;
import com.dss.security.Users;

@Controller
public class AccountController {
	
	@Autowired
	private UserManagement uman;
	
	@Autowired
	private ProfileService prof;
	
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String showAccountSettings(Map<String, Object> map, HttpSession session) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users currentUser = uman.getUser(auth.getName());
		
		map.put("user", currentUser);
		map.put("password", new Users());
		map.put("cert", new Certifications());
		map.put("profile", currentUser.getUserdetail());
		map.put("certList", prof.getCertifications());
		map.put("userCertList", prof.getCertificationsForUser(currentUser));
		
		
		return "account";
	}
	
	@RequestMapping(value = "/account/reset", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("password")
	Users u, BindingResult result,  HttpSession session) {

		PasswordEncoder encoder = new ShaPasswordEncoder(256);
		String hash = encoder.encodePassword(u.getUserPassword(), null);
		u.setUserPassword(hash);
		uman.updateUser(u);
		
		SecurityContextHolder.clearContext();
		//session.invalidate();
		return "redirect:/reset";
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String resetPasswordSuccess(Map<String, Object> map, HttpSession session) {
		
		
		return "reset";
	}
	@RequestMapping(value = "/account/profile", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("profile")
	UserDetails ud, BindingResult result,  HttpSession session) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		uman.updateUser(uman.getUser(auth.getName()), ud);
		return "redirect:/account";
	}
	
	@RequestMapping(value = "/account/certification", method = RequestMethod.POST)
	public String updateCertification(@ModelAttribute("cert")
	Certifications c, BindingResult result,  HttpSession session) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		prof.addCertifications(c);
		return "redirect:/account";
	}
	
	@RequestMapping(value = "/account/certification/delete", method = RequestMethod.POST)
	public String deleteCertification(@ModelAttribute("cert")
	Certifications c, BindingResult result,  HttpSession session) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		prof.removeCertifications(c);
		return "redirect:/account";
	}
	
/*	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception {   
	  binder.registerCustomEditor(List.class,"certifications", new CustomCollectionEditor(List.class) {
	    @Override
	    protected Object convertElement(Object element) {
	      String id = (String) element;
	      return prof.getCertificationById(Integer.valueOf(id));
	    }
	  });
	}*/
}
