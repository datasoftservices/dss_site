package com.dss.common;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dss.blogpost.BlogEntry;
import com.dss.newspost.NewsEntry;
import com.dss.security.Role;
import com.dss.security.RoleHelper;
import com.dss.security.UserDetails;
import com.dss.security.UserManagement;

@Service("mailService")
public class MailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private UserManagement uman; 
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void sendMailNewApplication(String from, String to, String tocc, String subject,
			String body,String HTMLbody, File file) {

		MimeMessage message = mailSender.createMimeMessage();
		String file_name = "";
		if(file != null){
			file_name = file.getName();
		}
    	InternetAddress cc = new InternetAddress();
    	cc.setAddress(tocc);
    	try{
    		cc.validate();
    	}
    	catch (Exception e){
    		cc = null;
    	}
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setFrom(from);
			helper.setTo(to);
			if(cc!=null)
				helper.setCc(cc);
			//helper.addBcc("deneve.bruno@gmail.com");
			helper.setSubject(subject);
			if(HTMLbody==null||HTMLbody.equals("")){
				helper.setText(body);
			}
			else helper.setText(body,HTMLbody);
			
			if(file != null)
				helper.addAttachment(file_name, file);

		} catch (MessagingException e) {
			throw new MailParseException(e);
		}
		try{
		mailSender.send(message);
		}
		catch(Exception e){
			System.out.println("mail versturen gefaald...");
		}
	}
	
	@Transactional
	public void sendNewContentAlert(String url, List<UserDetails> li, BlogEntry be, NewsEntry ne){
		String contentType = "";
		String title = "";
		
		if(be==null){
			contentType="nieuws";
			title = ne.getTitle();
		}
		if(ne==null){
			contentType="blog";
			title = be.getTitle();
		}
		Iterator<UserDetails> it = li.iterator();
		while(it.hasNext()){
			boolean authorized = true;
			UserDetails u = it.next();
			
			Role r = u.getUser().getRoles().getAuthority();
			RoleHelper rh = new RoleHelper();
			List<Role> authorities = rh.getAllAuthorizedRoles(r);
			if(contentType.equals("blog")){
				System.out.println("A1A - " + be.getVisibleFor() );
				Iterator<Role> i = authorities.iterator();
				while(i.hasNext()){
					System.out.println("in lus" + i.next().name());
				}
				if(!authorities.contains(be.getVisibleFor())){
					authorized = false;
					System.out.println("not authorized");
				}
			}
			if(contentType.equals("nieuws")){
				if(!authorities.contains(ne.getVisibleFor())){
					authorized = false;
				}
			}
			if(authorized){
				String HTMLbody = "<p>Beste collega,</p><p>Er werd een nieuw "+ contentType +" bericht geplaatst op de site.</p></br><strong>"+ title+ "</strong></br><p>Via onderstaande link kan u dit bericht lezen.</p></br>" + url + "<p>Met vriendelijke groeten</p><p>  </p><p>   </p><div><span lang='NL' style='color:black'><hr size='2' width='100%' align='left'></span></div><table border='0' cellspacing='0' cellpadding='0' style='border-collapse:collapse'><tr><td width='302' valign='top' style='width:8.0cm;border:none;border-right:solid #bfbfbf 1.0pt;padding:0cm 5.4pt 0cm 5.4pt'><p style='line-height:115%'><a href='http://www.datasoftservices.be/' target='_blank'><span style='font-size:10.0pt;line-height:115%;color:black;text-decoration:none'><span><img border='0' width='144' height='61' src='http://datasoftservices.be/resources/images/footer_logo.jpg' alt='Datasoft Services logo'></span></span></a><span style='font-size:9.0pt;line-height:115%;color:#1f497d'></span></p></td><td width='463' style='width:347.3pt;border:none;padding:0cm 5.4pt 0cm 5.4pt'><p align='center' style='text-align:center;line-height:115%;text-autospace:none'><b><span style='color:#244061;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;'>&#8220;Datasoft Services uw partner in IT detachering&#8221; <br></span></b><span style='font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;font-size:10.0pt;line-height:115%;color:#244061'>Onze ICT consultants zijn gecertifieerde experts die helpen bij de realisatie van uw .NET/C# en JAVA/J2EE projecten</span><span style='font-size:10.0pt;line-height:115%;color:#7f7f7f'></span></p></td></tr></table><div><span lang='NL' style='color:black'><hr size='2' width='100%' align='left'></span></div><p><b><u><span style='font-size:7.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:#999999'>DISCLAIMER</span></u></b><span style='font-size:7.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;color:#999999'>: De informatie, verzonden met dit e-mailbericht is uitsluitend bestemd voor de geadresseerde(n). Openbaarmaking, vermenigvuldiging en/of verspreiding van deze informatie aan derden is niet toegestaan. Datasoft Services is niet aansprakelijk voor de onjuiste of onvolledige transmissie, noch voor de laattijdigheid, noch voor de vernietiging van data tengevolge van deze transmissie. Indien u dit e-mailbericht ontvangt terwijl het niet voor u bedoeld is, verzoeken wij u ons hierover per omgaande te berichten en het bericht te vernietigen.</span><span lang='NL' style='color:#1f497d'></span></p><p><span lang='NL'></span></p>";
								
				String body = "Beste " + u.getFirstName() +"\r\n\r\n Er werd een nieuw "+ contentType +" bericht geplaatst op de site.\r\n\r\n" + title + "\r\n\r\nVia onderstaande link kan u dit bericht lezen.\r\n\r\n"+ url;
				sendMailNewApplication("info@datasoftservices.be", u.getEmail(), "", "Een nieuw "+ contentType +" bericht werd toegevoegd op de website",
						body, HTMLbody,null);
			}
		}
	}
}