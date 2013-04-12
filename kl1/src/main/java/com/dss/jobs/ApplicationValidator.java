package com.dss.jobs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Service
public class ApplicationValidator implements Validator{

	@Autowired
	ApplicantValidator val;
	
	@Override
	public boolean supports(Class<?> arg0) {
		return Application.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {


		System.out.println("Call naar validator");
		Application app = (Application)obj;
		//val.validate(app.applicant, errors);
		
	}

}
