package com.dss.security;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserManagementService implements UserManagement {
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	@Transactional
	public Users getUser(String userName){
		return userDAO.getUser(userName);
	}
	
	@Transactional
	public void addUser(Users user) {
		userDAO.addUser(user);
	}

	@Override
	@Transactional
	public void addDetail(UserDetails ud) {
		userDAO.addDetail(ud);
	}
	
	@Transactional
	public Map<Users,UserDetails> listUsers() {
		return userDAO.listUsers();
	}
	
	@Override
	@Transactional
	public List<UserDetails> listUserDetails(){
		return userDAO.listUserDetails();
	}
	
	@Override
	@Transactional
	public List<UserDetails> listUserDetails(String visible){
		return userDAO.listUserDetails(visible);
	}
	
	@Transactional
	public void removeUser(Integer id) {
		userDAO.removeUser(id);
	}

	@Transactional
	public void updateUser(Users user, UserDetails details) {
		userDAO.updateUser(user, details);
	}
	
	@Transactional
	@Override
	public void updateUser(Users user) {
		userDAO.updateUser(user);
	}
	
	@Transactional
	public UserRoles getUserRole(Users user){
		return userDAO.getUserRole(user);
	}
	
	@Transactional
	public void addUserRole(UserRoles ur){
		userDAO.addUserRole(ur);
	}
	
	@Transactional
	@Override
	public void updateUserRole(UserRoles ur) {
		userDAO.updateUserRole(ur);
	}
	
	@Transactional
	@Override
	public List<UserForm> listUserForm(){
		List<UserForm> luf = new ArrayList<UserForm>();
		Map<Users,UserDetails> m = listUsers();
		
		Iterator it = m.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry pairs = (Map.Entry)it.next();
			luf.add(new UserForm((Users)pairs.getKey(),(UserDetails)pairs.getValue(),getUserRole((Users)pairs.getKey())));
			
		}
		return luf;
		
	}
	
	@Transactional
	@Override
	public UserForm getUserForm(int id) {
		Users u = userDAO.getUser(id);
		return new UserForm(u,u.getUserdetail(),u.getRoles());
	}

}
