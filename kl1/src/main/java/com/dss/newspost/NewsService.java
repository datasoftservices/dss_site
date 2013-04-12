package com.dss.newspost;

import java.util.List;

import org.springframework.security.authentication.InsufficientAuthenticationException;

import com.dss.blogpost.Comment;
import com.dss.common.Tag;
import com.dss.security.Role;

public interface NewsService {
		
	public List<NewsEntry> listNewsItems(List<Tag> filter, List<Role> roles);
	public void updateNewsItem(NewsEntry n);
	public void deleteNewsItem(NewsEntry n);
	public NewsEntry addNewsItem(NewsEntry n);
	public NewsEntry getNewsById(Integer id, List<Role> roles) throws InsufficientAuthenticationException;
	public int getLastCommentNumber(Integer id);
	public List<Comment> getCommentsByNews(Integer id);

}
