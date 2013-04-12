package com.dss.jobs;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Service
public class ApplicantValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return Applicant.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object object, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.firstName", "required.userName", "Voornaam verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.lastName", "required.address", "Familienaam verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.nationality", "required.password", "Nationaliteit verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.gender", "required.confirmPassword", "Geslacht verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.dateOfBirth", "required.sex", "Geboortedatum verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.email", "required.favNumber", "E-mail adres verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.phoneMobile", "required.javaSkills","Gsm nummer verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.address", "required.javaSkills","adres verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.city", "required.javaSkills","Stad verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.postalCode", "required.javaSkills","postcode verplicht.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "applicant.country", "required.javaSkills","Land verplicht.");

			Applicant app = (Applicant)object;
			 

		
	}

}
