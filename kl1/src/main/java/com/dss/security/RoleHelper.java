package com.dss.security;

import java.util.ArrayList;
import java.util.List;

public class RoleHelper {
	
	public RoleHelper(){
		super();
	}
	
	public List<Role> getAllAuthorizedRoles(Role role){
		List<Role> roleList = new ArrayList<Role>();
		
		if(role == null)
			 roleList.add(Role.ROLE_ALL);
		else{
		
		for (Role r : Role.values()) {
			  if(r.securityLevel >= role.securityLevel)
				  roleList.add(r);
			}
		
		}
		return roleList;
	}
}
