package com.dss.controllers;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dss.common.MailService;
import com.dss.security.Role;
import com.dss.security.UserDetails;
import com.dss.security.UserForm;
import com.dss.security.UserManagement;
import com.dss.security.UserRoles;
import com.dss.security.Users;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserManagement uman;
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String initForm(Map<String, Object> map, HttpSession session, HttpServletRequest request, @PathVariable("id") String id){

		try{
			int userid = Integer.parseInt(id);
			map.put("uf", uman.getUserForm(userid));
			map.put("user", new UserForm());
			map.put("password", new Users());
			map.put("roleList", Role.values());
		}
		catch(Exception e){
			return "fout404";
		}
		
		return "user";
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String showUsers(Map<String, Object> map){
		

		List<UserDetails> users = uman.listUserDetails();
		
		map.put("user", new UserForm());
		map.put("userList", users);
		map.put("password", new Users());
		map.put("roleList", Role.values());
		return "manage_users";
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user")
	UserForm uf, BindingResult result) {

		uman.updateUser(uf.user, uf.detail);
		uman.updateUserRole(uf.role);

		return "redirect:/user/" + uf.user.getUserId();
	}
	
	
	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("password")
	Users u, HttpSession session, BindingResult result) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mail.xml");
		MailService mailService = (MailService) context.getBean("mailService");
		String pw = RandomAlphaNumericString(8);
		PasswordEncoder encoder = new ShaPasswordEncoder(256);
		String hash = encoder.encodePassword(pw, null);
		u.setUserPassword(hash);
		uman.updateUser(u);
		
		String body = "Beste," + "\r\n\r\n"+"Uw paswoord werd gereset."+ "\r\n" + "Uw nieuwe paswoord is " + pw +" . Gelieve bij het inloggen uw paswoord onmiddellijk te wijzigen." + "\r\n\r\n" + "Met vriendelijke groeten," + "\r\n\r\n\r\n" + "Bruno De Neve"+"\r\n"+"Datasoft Services";
		mailService.sendMailNewApplication("info@datasoftservices.be", u.getUserdetail().getEmail(), "", "AUTO-MAILER | paswoord reset", body, null, null);

		session.setAttribute("reset_ok", "reset_ok");
		return "redirect:/user/" + u.getUserId();
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user")
	UserForm uf, BindingResult result) {

		uf.user.setRoles(uf.role);
		uf.user.setUserdetail(uf.detail);
		uf.role.setUser(uf.user);
		uf.detail.setUser(uf.user);
		
		uman.addUser(uf.user);

		return "redirect:/users";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removeUser(@ModelAttribute("user")
	UserForm uf, HttpSession session, BindingResult result) {
			
		uman.removeUser(uf.user.getUserId());

		return "redirect:/users";
	}
	
	public String RandomAlphaNumericString(int size){
	    String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	    String ret = "";
	    int length = chars.length();
	    for (int i = 0; i < size; i ++){
	        ret += chars.split("")[ (int) (Math.random() * (length - 1)) ];
	    }
	    return ret;
	}
}
