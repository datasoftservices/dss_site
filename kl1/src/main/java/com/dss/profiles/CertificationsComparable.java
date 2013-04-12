package com.dss.profiles;

import java.util.Comparator;

public class CertificationsComparable implements Comparator<Certifications>{
	 
    @Override
    public int compare(Certifications o1, Certifications o2) {
    	if(o1.getCertificationDate().after(o2.getCertificationDate()))
    			return -1;
    	if(o1.getCertificationDate().before(o2.getCertificationDate()))
    		return 1;
    	return 0;
    }
}