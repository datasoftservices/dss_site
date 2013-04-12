package com.dss.common;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	private SessionFactory sf;
	
	
}
