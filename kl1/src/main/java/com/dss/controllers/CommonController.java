package com.dss.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dss.common.CommonService;
import com.dss.common.Tag;
import com.dss.common.Tags;

@Controller
public class CommonController {
	
	@Autowired
	private CommonService cs;
	
	@RequestMapping(value = "/tag/add",method = RequestMethod.POST)
	public String addTag(@ModelAttribute("tag")
	Tag t,HttpSession session, BindingResult result) {
		
		String path = (String) session.getAttribute("trail");
		cs.addTag(t);
		
		return "redirect:/" + path;
	}
	
	@RequestMapping(value = "/tags/delete",method = RequestMethod.POST)
	public String deleteTags(@ModelAttribute("tags")
	Tags t,HttpSession session, BindingResult result) {
		
		String path = (String) session.getAttribute("trail");
		//t.setTag(t.getTag());
		cs.deleteTags(t);
		
		return "redirect:/" + path;
	}
	
	@RequestMapping(value = "/tags/add", method = RequestMethod.POST)
	public String addTags(@ModelAttribute("tags")
	Tags t, HttpSession session, BindingResult result) {
		
		String path = (String) session.getAttribute("trail");
		cs.addTags(t);

		return "redirect:/" + path;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String Search(@ModelAttribute("string")
	String s, HttpSession session, BindingResult result) {
		

		return "search";
	}

}
