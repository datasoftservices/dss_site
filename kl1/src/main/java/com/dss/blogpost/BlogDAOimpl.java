package com.dss.blogpost;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.stereotype.Repository;

import com.dss.common.Tag;
import com.dss.security.Role;

@Repository
public class BlogDAOimpl implements BlogDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public BlogEntry AddBlog(BlogEntry be) {
		sessionFactory.getCurrentSession().save(be);
		return be;
	}
	
	@Override
	public void AddComment(Comment c) {
		sessionFactory.getCurrentSession().save(c);
		
	}
	
	@Override	
	public Comment getComment(int id) {
		Query query = sessionFactory.getCurrentSession().createQuery("select distinct c from Comment c where c.id =:id");
		query.setParameter("id", id);
		if(query.list().isEmpty())
			return null;
		else
			return (Comment)query.list().get(0);
		
	}

	@Override
	public List<BlogEntry> listBlogs(List<Tag> filter, List<Role> roles) {
		if (filter != null && !filter.isEmpty()){
			if (roles != null && !roles.isEmpty()){
				Query query = sessionFactory.getCurrentSession().createQuery("select distinct blog from BlogEntry blog inner join blog.tags tags where tags.tag in (:filter) AND (blog.visibleFor in (:paramList) OR blog.visibleFor IS NULL) order by blog.created desc");
				query.setParameterList("filter", filter);
				query.setParameterList("paramList", roles);
				return query.list();
			}
			else{
				Query query = sessionFactory.getCurrentSession().createQuery("select distinct blog from BlogEntry blog inner join blog.tags tags where tags.tag in (:filter) AND blog.visibleFor IS NULL) order by blog.created desc");
				query.setParameterList("filter", filter);
				return query.list();
			}
		}
		else{
			if (roles != null && !roles.isEmpty()){
				Query query = sessionFactory.getCurrentSession().createQuery("select distinct blog from BlogEntry blog where blog.visibleFor in (:paramList) OR blog.visibleFor IS NULL order by blog.created desc");
				query.setParameterList("paramList", roles);
				return query.list();
			}
			else
			return sessionFactory.getCurrentSession().createQuery("from BlogEntry where visibleFor IS NULL order by blog.created desc").list();
		}
			
		
	}

	public void removeBlog(Integer id) {
		BlogEntry be = (BlogEntry)sessionFactory.getCurrentSession().load(BlogEntry.class, id);
		if (null != be) {
			sessionFactory.getCurrentSession().delete(be);
		}
	}


	public void updateBlog(BlogEntry be) {
		if (null != be) {
			sessionFactory.getCurrentSession().update(be);
		}
	}

	public BlogEntry getBlogById(Integer id, List<Role> roles) throws InsufficientAuthenticationException{
		Query query = sessionFactory.getCurrentSession().createQuery("select distinct blog from BlogEntry blog where blog.id =:param_id");
		//blog.visibleFor in (:paramList) AND 
		query.setParameter("param_id", id);
		//query.setParameterList("paramList", roles);
		if(!query.list().isEmpty()){
			BlogEntry be = (BlogEntry)query.list().get(0);
			if(roles.contains(be.getVisibleFor())){
				return be;
			}
			else throw new InsufficientAuthenticationException(null);
		}
		else return null;
	}
	
	@Override
	public int getLastCommentNumber(Integer id){
		Query query = sessionFactory.getCurrentSession().createQuery("select c from Comment c where c.blog.id =:param_id order by c.number desc ");
		query.setParameter("param_id", id);
		if(!query.list().isEmpty()){
			Comment c = (Comment)query.list().get(0);
			return c.getNumber()+1;
		}
		else return 1;
	}
	@Override
	public List<Comment> getCommentsByBlog(Integer id){
		Query query = sessionFactory.getCurrentSession().createQuery("from Comment c where c.blog.id =:param_id order by c.number asc ");
		query.setParameter("param_id", id);
		if(!query.list().isEmpty()){
			return query.list();
		}
		else return null;
	}
}


