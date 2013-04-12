package com.dss.security;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserDAOimpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Users getUser(String userName){
		Query query = sessionFactory.getCurrentSession().createQuery("from Users where userName =:param");
		query.setParameter("param", userName);
		List<Users> users = query.list();
		if(!users.isEmpty()){
			return users.get(0); 
			}
			else return null;
	}
	
	@Override
	public Users getUser(int id){
		Query query = sessionFactory.getCurrentSession().createQuery("from Users where userId =:param");
		query.setParameter("param", id);
		List<Users> users = query.list();
		if(!users.isEmpty()){
		return users.get(0); 
		}
		else return null;
	}
	
	@Override
	public void addUser(Users user) {
		sessionFactory.getCurrentSession().save(user);
		
	}

	@Override
	public Map<Users,UserDetails> listUsers() {
		Map<Users,UserDetails> result = new TreeMap<Users,UserDetails>();
		
		List<Users> users = sessionFactory.getCurrentSession().createQuery("from Users u order by userId ").list();
		List<UserDetails> details = sessionFactory.getCurrentSession().createQuery("from UserDetails order by userId").list();
		
		for(Users u : users){
			for(UserDetails d : details){
				if (u.getUserId()==d.getUserId()){
					result.put(u, d);
				}
			}
		}
		
		return result;
	}
	
	@Override
	public List<UserDetails> listUserDetails() {
		return sessionFactory.getCurrentSession().createQuery("from UserDetails order by userId").list();
	}
	
	@Override
	public List<UserDetails> listUserDetails(String visible) {
		Query query = sessionFactory.getCurrentSession().createQuery("from UserDetails where visible =:param order by userId");
		query.setParameter("param", visible);
		List<UserDetails> users = query.list();
		if(!users.isEmpty()){
			return users; 
			}
			else return null;
	}

	@Override
	public void removeUser(Integer id) {
		Users user = (Users)sessionFactory.getCurrentSession().load(Users.class, id);
		if (null != user) {
			sessionFactory.getCurrentSession().delete(user);
		}
		
	}

	@Override
	public void updateUser(Users user, UserDetails details) {
		if (null != user) {
			/*sessionFactory.getCurrentSession().update(user);*/
			sessionFactory.getCurrentSession().update(details);
		}
		
	}
	
	@Override
	public void updateUser(Users user) {
		if (null != user) {
			sessionFactory.getCurrentSession().update(user);
		}
		
	}
	
	public UserRoles getUserRole(Users user){
		Query query = sessionFactory.getCurrentSession().createQuery("from UserRoles where userRoleId = :userid ");
		query.setParameter("userid", user.getUserId());
		List<UserRoles> roles = query.list();
		return roles.get(0);			
	}
	
	@Override
	public UserDetails getUserDetails(Users user){
		Query query = sessionFactory.getCurrentSession().createQuery("from UserDetails where userRoleId = :userid ");
		query.setParameter("userid", user.getUserId());
		List<UserDetails> details = query.list();
		return details.get(0);			
	}

	public void addUserRole(UserRoles ur){
		sessionFactory.getCurrentSession().save(ur);
	}
	
	@Override
	public void updateUserRole(UserRoles ur) {
		if (null != ur) {
			sessionFactory.getCurrentSession().update(ur);
		}
		
	}

	@Override
	public void addDetail(UserDetails ud) {
		sessionFactory.getCurrentSession().save(ud);
		
	}
}
