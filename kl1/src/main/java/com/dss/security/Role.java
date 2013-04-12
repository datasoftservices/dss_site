package com.dss.security;

public enum Role {
    ROLE_ADMIN(1), ROLE_EMPLOYEE(5), ROLE_GUEST(10), ROLE_ALL(99);
    
    public int securityLevel;

    Role(int securityLevel) {
            this.securityLevel = securityLevel;
    }

	public int getSecurityLevel() {
		return securityLevel;
	}

	public void setSecurityLevel(int securityLevel) {
		this.securityLevel = securityLevel;
	}

}
