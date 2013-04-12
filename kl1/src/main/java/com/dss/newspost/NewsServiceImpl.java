package com.dss.newspost;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dss.blogpost.Comment;
import com.dss.common.Tag;
import com.dss.security.Role;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsDAO dao;
	
	@Override
	@Transactional
	public void updateNewsItem(NewsEntry n) {
		dao.updateNewsItem(n);
	}

	@Override
	@Transactional
	public void deleteNewsItem(NewsEntry n) {
		dao.deleteNewsItem(n);
	}

	@Override
	@Transactional
	public NewsEntry addNewsItem(NewsEntry n) {
		return dao.addNewsItem(n);
		
	}

	@Override
	@Transactional
	public List<NewsEntry> listNewsItems(List<Tag> filter, List<Role> roles) {
		return dao.listNewsItems(filter,roles);
	}

	@Override
	@Transactional
	public NewsEntry getNewsById(Integer id, List<Role> roles) throws InsufficientAuthenticationException{
		return dao.getNewsById(id, roles);
	}

	@Override
	@Transactional
	public int getLastCommentNumber(Integer id){
		return dao.getLastCommentNumber(id);
	}
	
	@Override
	@Transactional
	public List<Comment> getCommentsByNews(Integer id){
		return dao.getCommentsByNews(id);
	}
}
