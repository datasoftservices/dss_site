package com.dss.blogpost;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dss.common.Tag;
import com.dss.security.Role;

@Service
public class BlogServiceImpl implements BlogService{
	
	@Autowired
	private BlogDAO blogDAO;
	
	@Transactional
	public BlogEntry AddBlog(BlogEntry be) {
		blogDAO.AddBlog(be);
		return be;
	}

	@Transactional
	public void removeBlog(Integer id) {
		blogDAO.removeBlog(id);
		
	}
	@Transactional
	public void updateBlog(BlogEntry be) {
		blogDAO.updateBlog(be);
		
	}
	@Override
	@Transactional
	public List<BlogEntry> listBlogs(List<Tag> filter, List<Role> roles) {
		return blogDAO.listBlogs(filter, roles);
	}
	@Override
	@Transactional
	public BlogEntry getBlogById(Integer id, List<Role> roles){
		return blogDAO.getBlogById(id,roles);
	}

	@Override
	@Transactional
	public void addComment(Comment c) {
		blogDAO.AddComment(c);
	}
	
	@Override
	@Transactional
	public Comment getComment(int id){
		return blogDAO.getComment(id);
	}
	
	@Override
	@Transactional
	public int getLastCommentNumber(Integer id) {
		return blogDAO.getLastCommentNumber(id);
	}
	
	@Override
	@Transactional
	public List<Comment> getCommentsByBlog(Integer id){
		return blogDAO.getCommentsByBlog(id);
	}
}
