package com.dss.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dss.blogpost.BlogEntry;
import com.dss.common.CommonService;
import com.dss.common.MailService;
import com.dss.common.Tag;
import com.dss.common.Tags;
import com.dss.exceptions.UserException;
import com.dss.jobs.Applicant;
import com.dss.jobs.ApplicantValidator;
import com.dss.jobs.Application;
import com.dss.jobs.ApplicationValidator;
import com.dss.jobs.Job;
import com.dss.jobs.JobService;
import com.dss.jobs.Resume;
import com.dss.newspost.NewsEntry;
import com.dss.newspost.NewsService;
import com.dss.security.Role;
import com.dss.security.RoleHelper;
import com.dss.security.UserManagement;
import com.dss.security.Users;

@Controller
@RequestMapping("jobs")
public class JobsController {

	@Autowired
	private JobService js;
	
	@Autowired
	private NewsService ns;
	
	@Autowired
	private ApplicantValidator val;
	
	@Autowired
	private CommonService cs;
	
	@Autowired
	private UserManagement uman; 
	
	@RequestMapping(value = {"","/werken"},method = RequestMethod.GET)
	public String jobsPage(HttpSession session, Map<String, Object> map,HttpServletRequest request){
		
		if(request.getRequestURI().contains("werken")){
			session.setAttribute("werken", "true");
		}
		else
			session.setAttribute("werken", "false");
		Applicant a = (Applicant)session.getAttribute("sessionApplicant");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		map.put("news", new NewsEntry());
		map.put("newsItems", ns.listNewsItems(null,rh.getAllAuthorizedRoles(r)));

		map.put("application", new Application(a,new Job(),null));
		
		List<Job> jobsList = new ArrayList<Job>();
		List<Job> closedJobsList = new ArrayList<Job>();
		for(Job j : js.listAllJobs(filterTagList,rh.getAllAuthorizedRoles(r))){
			if(new Date().after(j.getVisible_from()) && new Date().before(j.getVisible_until())){
				jobsList.add(j);
			}
			else closedJobsList.add(j);
		}
		map.put("jobsList",jobsList);
		map.put("closedJobsList",closedJobsList);
		map.put("applicantsList", js.listApplicants());
		map.put("applicationsList", js.listApplications());
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		map.put("roleList", Role.values());
		
		map.put("job", new Job());
		return "jobs";
		
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String updateBlog(@ModelAttribute("tag")
	Tag t, BindingResult result, HttpSession session) {
		
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

		return "redirect:/jobs";
	}
	
	@RequestMapping(value = "/add/application", method = RequestMethod.POST)
	public String addApplication(@ModelAttribute("application")Application application, BindingResult result, HttpSession session){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-mail.xml");
		
		MailService mailService = (MailService) context.getBean("mailService");
		application.setJob(js.findJob(application.job.getReference()));
		
		ArrayList<String> applicationSuccess;
		applicationSuccess = (ArrayList<String>) session.getAttribute("applicationSuccess");
		if(applicationSuccess==null)
			applicationSuccess = new ArrayList<String>();
		 
		val.validate(application.applicant, result);
		if (result.hasErrors()) {
			session.setAttribute("errorOnSubmit", application.job.getReference());
			session.setAttribute("errorList", result.getFieldErrors());
			return "redirect:/jobs"; 
		} else {
			String body = "Beste " + application.applicant.getFirstName()+"," + "\r\n\r\n"+"Bedankt!"+ "\r\n" + "Uw sollicitatie wordt momenteel in overweging genomen en wij nemen zo snel mogelijk contact op met u." + "\r\n\r\n" + "Met vriendelijke groeten," + "\r\n\r\n\r\n" + "Bruno De Neve"+"\r\n"+"Datasoft Services";
			String HTMLbody = "<p>Beste, </p><p>Bedankt voor uw sollicitatie. We bekijken uw cv en nemen zo snel mogelijk contact op met u.</p><p>Alvast bedankt!</p></br>" + "<p>Met vriendelijke groeten,</p><p>  </p><p>   </p><table class='MsoNormalTable' border='0' cellspacing='0' cellpadding='0' style='border-collapse:collapse'><tr><td width='302' valign='top' style='width:8.0cm;border:none;border-right:solid #BFBFBF 1.0pt;padding:0cm 5.4pt 0cm 5.4pt'><p class='MsoNormal' style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;line-height:115%'><a href='http://www.datasoftservices.be target='_blank'><span style='font-size:10.0pt;line-height:115%;text-decoration:none'><img border='0' width='144' height='61' id='_x0000_i1026' src='http://datasoftservices.be/resources/images/footer_logo.jpg' alt=''></span></a><p></p></p></td><td width='463' style='width:347.3pt;padding:0cm 5.4pt 0cm 5.4pt'><p class='MsoNormal' align='center' style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-align:center;line-height:115%;text-autospace:none'><b><span style='color:#244061'>&#8220;Datasoft Services uw partner in IT detachering&#8221; <br></span></b><span style='font-size:10.0pt;line-height:115%;color:#244061'>Onze ICT consultants zijn gecertifieerde experts die helpen bij de realisatie van uw .NET/C# en JAVA/J2EE projecten</span><p></p></p></td></tr></table><div><div class='MsoNormal'><span><hr size='2' width='100%' align='left'></span></div></div><p class='MsoNormal' style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b><u><span style='font-size:7.0pt;font-family:'Verdana','sans-serif';color:#999999'>DISCLAIMER</span></u></b><span style='font-size:7.0pt;font-family:'Verdana','sans-serif';color:#999999'>: De informatie, verzonden met dit e-mailbericht is uitsluitend bestemd voor de geadresseerde(n). Openbaarmaking, vermenigvuldiging en/of verspreiding van deze informatie aan derden is niet toegestaan. Datasoft Services is niet aansprakelijk voor de onjuiste of onvolledige transmissie, noch voor de laattijdigheid, noch voor de vernietiging van data tengevolge van deze transmissie. Indien u dit e-mailbericht ontvangt terwijl het niet voor u bedoeld is, verzoeken wij u ons hierover per omgaande te berichten en het bericht te vernietigen.</span><p></p></p>";
			
			js.addApplicant(application.applicant);
			js.addApplication(application);
			if(application.resume.getFile().isEmpty() == false){
	        String filePath = "/home/admin/domains/datasoftservices.be/resumes/" + application.resume.getFile().getOriginalFilename();
	        File dest = new File(filePath);
	        dest.mkdirs();
	        try {
	        	application.resume.getFile().transferTo(dest);
	        	String subject = "Sollicitatie / "+application.getJob().getTitle()+" / "+application.applicant.getFirstName()+" "+application.applicant.getLastName();
				mailService.sendMailNewApplication("sollicitatie@datasoftservices.be", "info@datasoftservices.be", application.applicant.getEmail(), subject, body, HTMLbody, dest);
				
			}
	        catch (IllegalStateException e) {
				System.out.println("checkpoint charlie");
				e.printStackTrace();
			} catch (IOException e) {
				System.out.println("checkpoint delta");
				e.printStackTrace();
			}
			}
			else{
			 try {

		        	String subject = "Sollicitatie / "+application.getJob().getTitle()+" / "+application.applicant.getFirstName()+" "+application.applicant.getLastName();
					mailService.sendMailNewApplication("sollicitatie@datasoftservices.be", "info@datasoftservices.be", application.applicant.getEmail(), subject, body, null, null);
					
				}
		        catch (Exception e) {
					e.printStackTrace();
				}
			}
			 
	        js.findApplicant(application.applicant);
			session.setAttribute("sessionApplicant", application.applicant);
			
			applicationSuccess.add(application.job.getReference());
			session.setAttribute("applicationSuccess", applicationSuccess);
			return "redirect:/jobs"; 
		}

	}
	
	@RequestMapping(value = "/add/job", method = RequestMethod.POST)
	public String addJob(@ModelAttribute("job")Job j, BindingResult result){
		
		j.generateReference(js.findLastRefNumber(j.getLocation().toUpperCase().substring(0, 3)+"_"+j.getCategory().replace('.', ' ').trim().substring(0, 3)));
		js.addJob(j);
		
		return "redirect:/jobs/manage";
	}
	
	@RequestMapping(value = "/update/job", method = RequestMethod.POST)
	public String updateJob(@ModelAttribute("job")Job j, BindingResult result){
		
		js.updateJob(j);
		
		return "redirect:/jobs/manage";
	}
	
	@RequestMapping(value = "/remove/job", method = RequestMethod.POST)
	public String removeJob(@ModelAttribute("job")Job j, BindingResult result){
		

		js.removeJob(j.getId());
		
		return "redirect:/jobs/manage";
	}
	
/*	@RequestMapping(value = "/tags/add", method = RequestMethod.POST)
	public String addTagToJob(@ModelAttribute("tags")
	Tags t, BindingResult result) {
		System.out.println("tag:" + t.getTag().getId() + " / " + t.getTag().getName());
		System.out.println("job:" + t.getJob().getId());
		cs.addTags(t);

		return "redirect:/jobs/manage";
	}*/
	
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manageJobsPage(HttpSession session, Map<String, Object> map){

		Applicant a = (Applicant)session.getAttribute("sessionApplicant");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		List<Tag> filterTagList = (List<Tag>) session.getAttribute("filterTagList");
		RoleHelper rh = new RoleHelper();
		Role r = null;
		if (!auth.getPrincipal().toString().equals("anonymousUser")){
			Users u = uman.getUser(auth.getName());
			r = u.getRoles().getAuthority();
		}
		map.put("news", new NewsEntry());
		map.put("newsItems", ns.listNewsItems(null,rh.getAllAuthorizedRoles(r)));

		map.put("application", new Application(a,new Job(),null));
		
		List<Job> jobsList = new ArrayList<Job>();
		List<Job> closedJobsList = new ArrayList<Job>();
		for(Job j : js.listAllJobs(null,rh.getAllAuthorizedRoles(r))){
			if(new Date().after(j.getVisible_from()) && new Date().before(j.getVisible_until())){
				jobsList.add(j);
			}
			else closedJobsList.add(j);
		}
		map.put("jobsList",jobsList);
		map.put("closedJobsList",closedJobsList);
		map.put("applicantsList", js.listApplicants());
		map.put("applicationsList", js.listApplications());
		map.put("tag", new Tag());
		map.put("tags", new Tags(null, new BlogEntry()));
		map.put("tagList", cs.ListTags());
		map.put("roleList", Role.values());
		
		map.put("job", new Job());
		return "manage_jobs";
		
	}

}
