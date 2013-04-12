package com.dss.security;

import java.util.List;
import java.util.Map;


public interface UserDAO {

	public void addUser(Users user);
	public Map<Users,UserDetails> listUsers();
	public List<UserDetails> listUserDetails();
	public List<UserDetails> listUserDetails(String visible);
	public void removeUser(Integer id);
	public void updateUser (Users user, UserDetails details);
	public UserRoles getUserRole(Users user);
	public void addUserRole(UserRoles ur);
	public void updateUserRole(UserRoles ur);
	public void updateUser(Users user);
	public void addDetail(UserDetails ud);
	public Users getUser(String userName);
	public Users getUser(int id);
	public UserDetails getUserDetails(Users user);

}
