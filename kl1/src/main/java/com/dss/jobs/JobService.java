package com.dss.jobs;

import java.util.List;

import com.dss.common.Tag;
import com.dss.security.Role;

public interface JobService {
	
	public List<Job> listAllJobs();
	public List<Job> listAllJobs(List<Tag> filterTagList, List<Role> allAuthorizedRoles);
	public void addApplicant(Applicant a);
	public void addApplication(Application a);
	public List<Application> listApplications();
	public List<Application> listApplications(Job j);
	public Job findJob(String reference);
	public void addJob(Job j);
	public void updateJob(Job j);
	public void removeJob(Integer id);
	public Applicant findApplicant(Applicant a);
	public int findLastRefNumber(String reference);
	public List<Applicant> listApplicants();

}
