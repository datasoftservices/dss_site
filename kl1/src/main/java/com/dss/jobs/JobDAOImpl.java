package com.dss.jobs;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dss.common.Tag;
import com.dss.security.Role;

@Repository
public class JobDAOImpl implements JobDAO{
	
	@Autowired
	private SessionFactory sf;
	
	@Override
	public List<Job> listAllJobs() {
		return sf.getCurrentSession().createQuery("from Job").list();
	}
	
	@Override
	public List<Job> listAllJobs(List<Tag> filter, List<Role> roles) {
		if (filter != null && !filter.isEmpty()){
			if (roles != null && !roles.isEmpty()){
				Query query = sf.getCurrentSession().createQuery("select distinct job from Job job inner join job.tags tags where tags.tag in (:filter) AND (job.visible_for in (:paramList) OR job.visible_for IS NULL)");
				query.setParameterList("filter", filter);
				query.setParameterList("paramList", roles);
				return query.list();
			}
			else{
				Query query = sf.getCurrentSession().createQuery("select distinct job from Job job inner join job.tags tags where tags.tag in (:filter) AND job.visible_for IS NULL)");
				query.setParameterList("filter", filter);
				return query.list();
			}
			
		}
		else{
			if (roles != null && !roles.isEmpty()){
				Iterator it = roles.iterator();
				Query query = sf.getCurrentSession().createQuery("select distinct job from Job job where job.visible_for in (:paramList) OR job.visible_for IS NULL");
				query.setParameterList("paramList", roles);
				return query.list();
			}
			else
			return sf.getCurrentSession().createQuery("from Job where visible_for IS NULL").list();
		}
		
	}

	@Override
	public void addApplicant(Applicant a) {
		if(a.getId()!= 0){
			Query query = sf.getCurrentSession().createQuery("from Applicant where id =:param");
			query.setParameter("param",a.getId());
			if(query.list().isEmpty()){
				sf.getCurrentSession().save(a);
			}
		}
		else sf.getCurrentSession().save(a);
		
	}

	@Override
	public Applicant findApplicant(Applicant a) {
		Query query = sf.getCurrentSession().createQuery("from Applicant where firstName =:param1 and lastName =:param2 and dateOfBirth =:param3");
		query.setParameter("param1",a.getFirstName());
		query.setParameter("param2",a.getLastName());
		query.setParameter("param3",a.getDateOfBirth());
		if(query.list().isEmpty()){
			return new Applicant();
		}else
			return (Applicant)query.list().get(0);
		
	}
	
	@Override
	public List<Applicant> listApplicants() {

				Query query = sf.getCurrentSession().createQuery("from Applicant");
				return query.list();
	}
	
	@Override
	public void addApplication(Application a) {
		sf.getCurrentSession().save(a);	
	}

	@Override
	public int findLastRefNumber(String reference) {
		Query query = sf.getCurrentSession().createQuery("from Job where reference like :param order by reference desc");
		query.setParameter("param",reference+"%");
		if(!query.list().isEmpty()){
			Job j = (Job)query.list().get(0);
			int i = Integer.parseInt(j.getReference().substring(7));
			return i + 1;
		}
		else return 1;		
	}
	
	@Override
	public Job findJob(String reference) {
		Query query = sf.getCurrentSession().createQuery("from Job where reference =:param");
		query.setParameter("param",reference);
		return (Job)query.list().get(0);
		
	}

	@Override
	public List<Application> listApplications() {
		return sf.getCurrentSession().createQuery("from Application").list();
			}

	@Override
	public List<Application> listApplications(Job j) {
		Query query = sf.getCurrentSession().createQuery("from Application where Job.reference =:param");
		query.setParameter("param",j.getReference());
		return query.list();
	}

	@Override
	public void addJob(Job j) {
		sf.getCurrentSession().save(j);
		
	}

	@Override
	public void updateJob(Job j) {
		sf.getCurrentSession().update(j);
		
	}

	@Override
	public void removeJob(Integer id) {
		Job j = (Job)sf.getCurrentSession().load(Job.class, id);
		if (null != j){
			sf.getCurrentSession().delete(j);
		}
	}

}
