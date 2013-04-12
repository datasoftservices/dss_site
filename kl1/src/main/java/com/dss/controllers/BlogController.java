package com.dss.controllers;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dss.blogpost.BlogEntry;
import com.dss.blogpost.BlogService;
import com.dss.blogpost.Comment;
import com.dss.common.CommonService;
import com.dss.common.MailService;
import com.dss.common.MessageHelper;
import com.dss.common.Tag;
import com.dss.common.Tags;
import com.dss.newspost.NewsService;
import com.dss.security.Role;
import com.dss.security.RoleHelper;
import com.dss.security.UserDetails;
import com.dss.security.UserManagement;
import com.dss.security.Users;

@Controller
@RequestMapping("blog")
public class BlogController extends ExtraController {
	
	@Autowired
	private BlogService bs;
	
	@Autowired
	private NewsService ns;
	
	@Autowired
	private CommonService cs;
	
	@Autowired
	private UserManagement uman; 
	
	@RequestMapping(method = RequestMethod.GET)
	public String showBlogPosts(Map<String, Object> map,  HttpSession session, HttpServletRequest request) {
		
		session.setAttribute("author","");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String[] uri = request.getRequestURI().split("blog",2);
		session.setAttribute("uri","blog" + uri[uri.length-1]);
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		List<BlogEntry> blogItems = bs.listBlogs(filterTagList,rh.getAllAuthorizedRoles(r));
		map.put("blog", new BlogEntry());
		map.put("blogList", blogItems );
		
		map.put("newsItems", getLatestNews(rh.getAllAuthorizedRoles(r)));
		map.put("archiveList", getArchivesMap(blogItems));
		
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		map.put("roleList", Role.values());
		
		return "blog";
	}
	
	@RequestMapping(value = "/{author}", method = RequestMethod.GET)
	public String showBlogPostsByAuthor(Map<String, Object> map,  HttpSession session, HttpServletRequest request, @PathVariable("author") String author) {
		
		session.setAttribute("author",author);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String[] uri = request.getRequestURI().split("blog",2);
		session.setAttribute("uri","blog" + uri[uri.length-1]);
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		List<BlogEntry> blogItems = bs.listBlogs(filterTagList,rh.getAllAuthorizedRoles(r));
		
		Iterator it = blogItems.iterator();
		while(it.hasNext()){
			BlogEntry n = (BlogEntry)it.next();
			if(!(n.getAuthor().equals(author)))
					it.remove();
		}
		
		map.put("blog", new BlogEntry());
		map.put("blogList", blogItems );
		
		map.put("newsItems", ns.listNewsItems(null,rh.getAllAuthorizedRoles(r)));
		map.put("archiveList", getArchivesMap(blogItems));
		
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		map.put("roleList", Role.values());
		
		return "blog";
	}
	
	@RequestMapping(value = "/archives/{date}",method = RequestMethod.GET)
	public String showArchivedBlogPosts(Map<String, Object> map,  HttpSession session, HttpServletRequest request, @PathVariable("date") String date) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String[] uri = request.getRequestURI().split("blog",2);
	session.setAttribute("uri","blog" + uri[uri.length-1]);
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		List<BlogEntry> archives = bs.listBlogs(filterTagList,rh.getAllAuthorizedRoles(r));
		
		map.put("archiveList", getArchivesMap(archives));
		
		if(date != null){
		int month = 0;
		int year = 0;
		
		try{
		month = Integer.parseInt(date.substring(0,2));
		year = Integer.parseInt(date.substring(3));
		}
		catch(Exception e){
			System.out.println("BlogController::ln147 failed to parse" );
		}
		
		Iterator it = archives.iterator();
		while(it.hasNext()){
			BlogEntry b = (BlogEntry)it.next();
			Calendar c = Calendar.getInstance();
			c.setTime(b.getCreated());
			
			if(c.get(Calendar.MONTH)+1 != month || c.get(Calendar.YEAR) != year)
				it.remove();
		}
		}
		
		map.put("blog", new BlogEntry());
		map.put("blogList", archives);
		
		
		map.put("newsItems", ns.listNewsItems(null,rh.getAllAuthorizedRoles(r)));
		
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		
		return "blog";
		
	}
	
	@RequestMapping(value = "/single/{id}", method = RequestMethod.GET)
	public String showSingleBlogPost(Map<String, Object> map,  HttpSession session, HttpServletRequest request, @PathVariable("id") String id) {
		
		session.setAttribute("pre_login_url","");
		
		int blogId = 0;
		BlogEntry blog = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String[] uri = request.getRequestURI().split("blog",2);
		session.setAttribute("uri","blog" + uri[uri.length-1]);
		
		
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		try{
			blogId = Integer.parseInt(id);
			blog = bs.getBlogById(blogId,rh.getAllAuthorizedRoles(r));
		}
		catch(InsufficientAuthenticationException e){
			//session.setAttribute("trail", "");
			session.setAttribute("pre_login_url","blog" + uri[uri.length-1]);
			return "redirect:/login";
		}

		List<Comment> treeComments = new ArrayList<Comment>();
		List<Comment> listStyleComments = bs.getCommentsByBlog(blogId);
		
		if(listStyleComments!=null){
			for(int i = 0;i < listStyleComments.size();i++){
				if((Comment)listStyleComments.get(i).getOriginalComment()==null){
					treeComments.add(listStyleComments.get(i));
				}
			}
		}

		map.put("treeComments", treeComments);
		map.put("listStyle", listStyleComments);
		map.put("blog", blog);
		map.put("comment", new Comment());
		return "single_blog";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String updateBlog(@ModelAttribute("tag")
	Tag t, BindingResult result, HttpSession session) {
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		
		String uri = (String) session.getAttribute("uri");
		
		if (filterTagList == null){
			filterTagList = new ArrayList<Tag>();
			filterTagList.add(t);
		}
		else{
			
			if(filterTagList.contains(t))
				filterTagList.remove(t);
			else filterTagList.add(t);
		}
		
		session.setAttribute("filterTagList", filterTagList);

		return "redirect:/" + uri;
	}
	
	@RequestMapping(value = "/comment/add", method = RequestMethod.POST)
	public String addComment(@ModelAttribute("comment")
	Comment c, BindingResult result, HttpSession session) {
		
		String uri = (String) session.getAttribute("uri");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users u = new Users();
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			u = uman.getUser(auth.getName());
			c.setAuthor(u.getUserdetail().getFirstName() + " " + u.getUserdetail().getLastName());
			c.setUser(u);
		}
		
		c.setNumber(bs.getLastCommentNumber(c.getBlog().getId()));	
		if(c.getCreated()==null)
			c.setCreated(new Timestamp(new Date().getTime()));
		if(bs.getComment(c.getOriginalComment().getId()) == null){
			//referenced comment doesn't exist - remove it from the comment
			c.setOriginalComment(null);
		}
		if(c.getAuthor().equals("") || c.getComment().equals("")){
			// bad comment
		}
		else bs.addComment(c);
		return "redirect:/" + uri;
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String updateBlog(@ModelAttribute("blog")
	BlogEntry be, BindingResult result) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MessageHelper mh = new MessageHelper();
		
		be.setMessage(mh.escapeSpecialChar(be.getMessage()));
		be.setUser(uman.getUser(auth.getName()));
		be.initIntro();
		bs.updateBlog(be);

		return "redirect:/blog/manage";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addBlog(@ModelAttribute("blog")
	BlogEntry be, BindingResult result) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mail.xml");
		MailService mailService = (MailService) context.getBean("mailService");
		
		if(be.getCreated()==null)
			be.setCreated(new Date());
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		be.setUser(uman.getUser(auth.getName()));
		be.setAuthor(be.getUser().getUserdetail().getFirstName() + " " + be.getUser().getUserdetail().getLastName());
		be.initIntro();
		
		List<UserDetails> ud = uman.listUserDetails();
		BlogEntry n = bs.AddBlog(be);
		//mailService.sendNewContentAlert("http://www.datasoftservices.be/blog/single/"+n.getId(),ud,n,null);
		return "redirect:/blog/manage";
	}
	
	@RequestMapping(value = "/mail/alert", method = RequestMethod.POST)
	public String sendMail(@ModelAttribute("blog")
	BlogEntry be, BindingResult result) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mail.xml");
		MailService mailService = (MailService) context.getBean("mailService");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}


		
		List<UserDetails> ud = uman.listUserDetails();
		BlogEntry n = bs.getBlogById(be.getId(), rh.getAllAuthorizedRoles(r));
		mailService.sendNewContentAlert("http://www.datasoftservices.be/blog/single/"+n.getId(),ud,n,null);
		return "redirect:/blog/manage";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removeBlog(@ModelAttribute("blog")
	BlogEntry be, BindingResult result) {
		
		bs.removeBlog(be.getId());

		return "redirect:/blog/manage";
	}
	
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manageBlogPosts(Map<String, Object> map,  HttpSession session, HttpServletRequest request) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String[] uri = request.getRequestURI().split("/",3);
		session.setAttribute("uri",uri[2]);
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		List<BlogEntry> blogItems = bs.listBlogs(null,rh.getAllAuthorizedRoles(r));
		Collection authorities = auth.getAuthorities();
		Iterator authority = authorities.iterator();
		boolean isNotAdmin = true;
		while(authority.hasNext()){
			if(authority.next().toString().equals("ROLE_ADMIN")){
				isNotAdmin = false;
			}
		}
		
		Iterator it = blogItems.iterator();
		while(it.hasNext() && isNotAdmin){
			BlogEntry n = (BlogEntry)it.next();
			
			if(!(n.getUser().getUserName().equals(auth.getName())))
					it.remove();
		}
		
		map.put("blog", new BlogEntry());
		map.put("blogList", blogItems );
		
		map.put("newsItems", ns.listNewsItems(null,rh.getAllAuthorizedRoles(r)));
		map.put("archiveList", getArchivesMap(blogItems));
		
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		map.put("roleList", Role.values());
		
		return "manage_blog";
	}
	
	private Map<Date,String> getArchivesMap(List<BlogEntry> blogItems){
		Map<Date, String> archives = new TreeMap<Date, String>(Collections.reverseOrder());
		Iterator<BlogEntry> i = blogItems.iterator();
		while(i.hasNext()){
			BlogEntry ne = (BlogEntry)i.next();
			Calendar c = Calendar.getInstance();
			c.setTime(ne.getCreated());
			c.set(c.get(Calendar.YEAR),c.get(Calendar.MONTH),1);
			String month = String.format("%02d", c.get(Calendar.MONTH)+1);
			Integer year = c.get(Calendar.YEAR);
			String s = month + "_" + year;
			archives.put(c.getTime(), s);
		}
		return archives;
	}
	
}
