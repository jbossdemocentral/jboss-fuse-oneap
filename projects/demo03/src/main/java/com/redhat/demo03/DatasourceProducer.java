package com.redhat.demo03;

import javax.annotation.Resource;
import javax.enterprise.inject.Produces;
import javax.inject.Named;
import javax.sql.DataSource;

public class DatasourceProducer {

	 @Resource(lookup= "java:jboss/datasources/MyCamelDS")
	 DataSource dataSource;

	 @Produces
	 @Named("MyCamelDS")
	 public DataSource getDataSource() {
		 return dataSource;
	 }
	 
}
