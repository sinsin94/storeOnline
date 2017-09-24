package com.store.util;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

public class CustomerNumGenerator implements IdentifierGenerator {

	private static DateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
	
	
	@Override
	public Serializable generate(SessionImplementor arg0, Object arg1) throws HibernateException {

		
		String number=format.format(new Date());
		
		return number;
	}

}
