package com.dss.controllers;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
import com.dss.common.Tag;
import com.dss.common.Tags;
import com.dss.newspost.NewsEntry;
import com.dss.newspost.NewsService;
import com.dss.security.Role;
import com.dss.security.RoleHelper;
import com.dss.security.UserDetails;
import com.dss.security.UserManagement;
import com.dss.security.Users;

@Controller
@RequestMapping("news")
public class NewsController extends ExtraController {
	
	@Autowired
	private UserManagement uman;
	
	@Autowired
	private NewsService ns;
	
	@Autowired
	private CommonService cs;
	
	@Autowired
	private BlogService bs;

	@RequestMapping(method = RequestMethod.GET)
	public String showNewsPosts(Map<String, Object> map,  HttpSession session, HttpServletRequest request) {
		
		session.setAttribute("author","");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();	

		String[] uri = request.getRequestURI().split("news",2);
		session.setAttribute("uri","news" + uri[uri.length-1]);
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		List<NewsEntry> newsItems = ns.listNewsItems(filterTagList,rh.getAllAuthorizedRoles(r));
		

		map.put("blogList", getLatestBlogs(rh.getAllAuthorizedRoles(r)));
		
		map.put("news", new NewsEntry());
		map.put("newsList", newsItems);
		map.put("archiveList", getArchivesMap(newsItems));
		
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		map.put("roleList", Role.values());
		
		return "news";
	}
	
	@RequestMapping(value = "/{author}",method = RequestMethod.GET)
	public String showPostsByAuthor(Map<String, Object> map,  HttpSession session, HttpServletRequest request, @PathVariable("author") String author) {
		
		session.setAttribute("author",author);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String[] uri = request.getRequestURI().split("news",2);
		session.setAttribute("uri","news" + uri[uri.length-1]);
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		List<NewsEntry> newsItems = ns.listNewsItems(filterTagList,rh.getAllAuthorizedRoles(r));

		Iterator it = newsItems.iterator();
		while(it.hasNext()){
			NewsEntry n = (NewsEntry)it.next();
			if(!(n.getAuthor().equals(author)))
					it.remove();
		}
		map.put("blogList", getLatestBlogs(rh.getAllAuthorizedRoles(r)));
		
		map.put("news", new NewsEntry());
		map.put("newsList", newsItems);
		map.put("archiveList", getArchivesMap(newsItems));
		
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		map.put("roleList", Role.values());
		
		return "news";
	}
	
	@RequestMapping(value = "/archives/{date}",method = RequestMethod.GET)
	public String showArchivedBlogPosts(Map<String, Object> map,  HttpSession session, HttpServletRequest request, @PathVariable("date") String date) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String[] uri = request.getRequestURI().split("news",2);
		session.setAttribute("uri","news" + uri[uri.length-1]);
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		List<NewsEntry> archives = ns.listNewsItems(filterTagList,rh.getAllAuthorizedRoles(r));
		
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
			NewsEntry n = (NewsEntry)it.next();
			Calendar c = Calendar.getInstance();
			c.setTime(n.getCreated());
			
			if(c.get(Calendar.MONTH)+1 != month || c.get(Calendar.YEAR) != year)
				it.remove();
		}
		}
		
		map.put("blogList", getLatestBlogs(rh.getAllAuthorizedRoles(r)));
		
		map.put("news", new NewsEntry());
		map.put("newsList", archives);
		
		
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		
		return "news";
		
	}
	
	@RequestMapping(value = "/single/{id}", method = RequestMethod.GET)
	public String showNewsPosts(Map<String, Object> map,  HttpSession session, HttpServletRequest request, @PathVariable("id") String id) {
		
		session.setAttribute("pre_login_url","");
		
		int NewsId = 0;
		NewsEntry news = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();	

		String[] uri = request.getRequestURI().split("news",2);
		session.setAttribute("uri","news" + uri[uri.length-1]);

		
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		try{
			NewsId = Integer.parseInt(id);
			news = ns.getNewsById(NewsId, rh.getAllAuthorizedRoles(r));
		}
		catch(InsufficientAuthenticationException e){
			session.setAttribute("pre_login_url","news" + uri[uri.length-1]);
			return "redirect:/login";
		}
		
		List<Comment> treeComments = new ArrayList<Comment>();
		List<Comment> comments = ns.getCommentsByNews(NewsId);
		
		if(comments!=null){
			for(int i = 0;i < comments.size();i++){
				if((Comment)comments.get(i).getOriginalComment()==null){
					treeComments.add(comments.get(i));
				}
			}
		}

		map.put("treeComments", treeComments);
		map.put("listStyle", comments);
		map.put("news", news);
		map.put("comment", new Comment());
		map.put("newsItems", ns.listNewsItems(null,rh.getAllAuthorizedRoles(r)));
		map.put("archiveList", getArchivesMap(ns.listNewsItems(null,rh.getAllAuthorizedRoles(r))));
		map.put("tag", new Tag());
		return "single_news";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String updateBlog(@ModelAttribute("tag")
	Tag t, BindingResult result, HttpSession session, HttpServletRequest request) {
		
		String uri = (String) session.getAttribute("uri");

		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		
		if (filterTagList == null){
			filterTagList = new ArrayList<Tag>();
			filterTagList.add(t);
		}
		else{
			Iterator it = filterTagList.iterator();
			while(it.hasNext()){
				Tag temp = (Tag)it.next();
			}
			
			if(filterTagList.contains(t))
				filterTagList.remove(t);
			else filterTagList.add(t);
		}
		
		session.setAttribute("filterTagList", filterTagList);

		return "redirect:/" + uri;
	}
	
	@RequestMapping(value = "/manage",method = RequestMethod.GET)
	public String manageNewsPosts(Map<String, Object> map,  HttpSession session, HttpServletRequest request) {
		
		session.setAttribute("author","");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();	

		String[] uri = request.getRequestURI().split("news",2);
		session.setAttribute("uri","news" + uri[uri.length-1]);
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		
		List<NewsEntry> newsItems = ns.listNewsItems(filterTagList,rh.getAllAuthorizedRoles(r));
		Collection authorities = auth.getAuthorities();
		Iterator authority = authorities.iterator();
		boolean isNotAdmin = true;
		while(authority.hasNext()){
			if(authority.next().toString().equals("ROLE_ADMIN")){
				isNotAdmin = false;
			}
		}
		
		Iterator<NewsEntry> it = newsItems.iterator();
		while(it.hasNext() && isNotAdmin){
			NewsEntry n = it.next();
			
			if(!(n.getUser().getUserName().equals(auth.getName())))
					it.remove();
		}

		map.put("blogList", getLatestBlogs(rh.getAllAuthorizedRoles(r)));
		
		map.put("news", new NewsEntry());
		map.put("newsList", newsItems);
		map.put("archiveList", getArchivesMap(newsItems));
		
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		map.put("roleList", Role.values());
		
		return "manage_news";
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
		
		c.setNumber(ns.getLastCommentNumber(c.getNews().getId()));	
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
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addNews(@ModelAttribute("news")
	NewsEntry n,HttpSession session, BindingResult result) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mail.xml");
		MailService mailService = (MailService) context.getBean("mailService");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		n.setUser(uman.getUser(auth.getName()));
		n.setAuthor(n.getUser().getUserdetail().getFirstName() + " " + n.getUser().getUserdetail().getLastName());
		
		if(n.getCreated()==null)
			n.setCreated(new Date());
		
		List<UserDetails> ud = uman.listUserDetails();
		n.initIntro();
		NewsEntry ne = ns.addNewsItem(n);
		//mailService.sendNewContentAlert("http://www.datasoftservices.be/blog/single/"+ne.getId(),ud,null,ne);
		return "redirect:/news/manage";
	}
	
	@RequestMapping(value = "/mail/alert", method = RequestMethod.POST)
	public String sendMail(@ModelAttribute("news")
	NewsEntry ne, BindingResult result) {
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
		NewsEntry n = ns.getNewsById(ne.getId(), rh.getAllAuthorizedRoles(r));
		mailService.sendNewContentAlert("http://www.datasoftservices.be/blog/single/"+n.getId(),ud,null,n);
		return "redirect:/news/manage";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateBlog(@ModelAttribute("news")
	NewsEntry ne, BindingResult result) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		ne.setUser(uman.getUser(auth.getName()));
		ne.initIntro();
		ns.updateNewsItem(ne);

		return "redirect:/news";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String deleteBlog(@ModelAttribute("news")
	NewsEntry ne, BindingResult result) {

		ns.deleteNewsItem(ne);

		return "redirect:/news";
	}
	
	
	private Map<Date,String> getArchivesMap(List<NewsEntry> newsItems){
		Map<Date, String> archives = new TreeMap<Date, String>(Collections.reverseOrder());
		Iterator<NewsEntry> i = newsItems.iterator();
		while(i.hasNext()){
			NewsEntry ne = (NewsEntry)i.next();
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
