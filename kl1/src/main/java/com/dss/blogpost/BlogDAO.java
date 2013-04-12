package com.dss.blogpost;

import java.util.List;

import com.dss.common.Tag;
import com.dss.security.Role;

public interface BlogDAO {

	public BlogEntry AddBlog(BlogEntry be);
	public List<BlogEntry> listBlogs(List<Tag> filter, List<Role> roles);
	public void removeBlog(Integer id);
	public void updateBlog (BlogEntry be);
	public BlogEntry getBlogById(Integer id, List<Role> roles);
	public void AddComment(Comment c);
	public int getLastCommentNumber(Integer id);
	public List<Comment> getCommentsByBlog(Integer id);
	public Comment getComment(int id);
}
