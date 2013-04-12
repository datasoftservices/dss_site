package com.dss.jobs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dss.common.Tag;
import com.dss.security.Role;

@Service
public class JobServiceImpl implements JobService{

	@Autowired
	private JobDAO dao;
	
	@Override
	@Transactional
	public List<Job> listAllJobs() {
		return dao.listAllJobs();
	}

	@Override
	@Transactional
	public List<Job> listAllJobs(List<Tag> filterTagList,
			List<Role> allAuthorizedRoles) {
		return dao.listAllJobs(filterTagList,allAuthorizedRoles);
	}
	
	@Override
	@Transactional
	public void addApplicant(Applicant a) {
		dao.addApplicant(a);
		
	}
	
	@Override
	@Transactional
	public Applicant findApplicant(Applicant a) {
		return dao.findApplicant(a);
		
	}

	@Override
	@Transactional
	public void addApplication(Application a) {
		dao.addApplication(a);
	}

	@Override
	@Transactional
	public Job findJob(String reference) {
		return dao.findJob(reference);
	}

	@Override
	@Transactional
	public List<Application> listApplications() {
		return dao.listApplications();
	}

	@Override
	@Transactional
	public List<Application> listApplications(Job j) {
		return dao.listApplications(j);
	}

	@Override
	@Transactional
	public void addJob(Job j) {
		dao.addJob(j);
		
	}

	@Override
	@Transactional
	public void updateJob(Job j) {
		dao.updateJob(j);
		
	}

	@Override
	@Transactional
	public void removeJob(Integer id) {
		dao.removeJob(id);
		
	}

	@Override
	@Transactional
	public int findLastRefNumber(String reference) {
		return dao.findLastRefNumber(reference);
	}
	
	@Override
	@Transactional
	public List<Applicant> listApplicants() {
		return dao.listApplicants();
	}
}
