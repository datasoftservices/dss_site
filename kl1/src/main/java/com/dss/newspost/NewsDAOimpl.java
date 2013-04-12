package com.dss.newspost;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.stereotype.Repository;

import com.dss.blogpost.BlogEntry;
import com.dss.blogpost.Comment;
import com.dss.common.Tag;
import com.dss.newspost.NewsDAO;
import com.dss.security.Role;

@Repository
public class NewsDAOimpl implements NewsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<NewsEntry> listNewsItems(List<Tag> filter, List<Role> roles) {
		
		if (filter != null && !filter.isEmpty()){


			if (roles != null && !roles.isEmpty()){
				Query query = sessionFactory.getCurrentSession().createQuery("select distinct news from NewsEntry news inner join news.tags tags where tags.tag in (:filter) AND (news.visibleFor in (:paramList) OR news.visibleFor IS NULL) order by news.created desc");
				query.setParameterList("filter", filter);
				query.setParameterList("paramList", roles);
				return query.list();
			}
			else{
				Query query = sessionFactory.getCurrentSession().createQuery("select distinct news from NewsEntry news inner join news.tags tags where tags.tag in (:filter) AND news.visibleFor IS NULL order by news.created desc)");
				query.setParameterList("filter", filter);
				return query.list();
			}
		}
		else{
			if (roles != null && !roles.isEmpty()){
				Query query = sessionFactory.getCurrentSession().createQuery("select distinct news from NewsEntry news where news.visibleFor in (:paramList) OR news.visibleFor IS NULL order by news.created desc");
				query.setParameterList("paramList", roles);
				return query.list();
			}
			else
			return sessionFactory.getCurrentSession().createQuery("from NewsEntry where visibleFor IS NULL order by news.created desc").list();
		}
			
		
	}
	@Override
	public void updateNewsItem(NewsEntry n) {
		sessionFactory.getCurrentSession().update(n);
		
	}

	@Override
	public void deleteNewsItem(NewsEntry n) {
		NewsEntry ne = (NewsEntry)sessionFactory.getCurrentSession().load(NewsEntry.class, n.getId());
		if (null != ne) {
			sessionFactory.getCurrentSession().delete(ne);
		}		
	}

	@Override
	public NewsEntry addNewsItem(NewsEntry n) {
		sessionFactory.getCurrentSession().save(n);
		return n;
		
	}

	@Override
	public NewsEntry getNewsById(Integer id, List<Role> roles) throws InsufficientAuthenticationException{
		Query query = sessionFactory.getCurrentSession().createQuery("select distinct news from NewsEntry news where news.id =:param_id");
		query.setParameter("param_id", id);
		if(!query.list().isEmpty()){
			NewsEntry ne = (NewsEntry)query.list().get(0);
			if(roles.contains(ne.getVisibleFor())){
				return ne;
			}
			else throw new InsufficientAuthenticationException(null);
		}
		else return null;
	}
	
	@Override
	public int getLastCommentNumber(Integer id){
		Query query = sessionFactory.getCurrentSession().createQuery("select c from Comment c where c.news.id =:param_id order by c.number desc ");
		query.setParameter("param_id", id);
		if(!query.list().isEmpty()){
			Comment c = (Comment)query.list().get(0);
			return c.getNumber()+1;
		}
		else return 1;
	}
	@Override
	public List<Comment> getCommentsByNews(Integer id){
		Query query = sessionFactory.getCurrentSession().createQuery("from Comment c where c.news.id =:param_id order by c.number asc ");
		query.setParameter("param_id", id);
		if(!query.list().isEmpty()){
			return query.list();
		}
		else return null;
	}
}
