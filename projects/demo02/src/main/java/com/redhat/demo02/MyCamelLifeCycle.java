package com.redhat.demo02;

import org.apache.camel.component.servletlistener.CamelContextLifecycle;
import org.apache.camel.component.servletlistener.ServletCamelContext;
import org.apache.camel.impl.JndiRegistry;

public class MyCamelLifeCycle implements CamelContextLifecycle<JndiRegistry>{

	@Override
	public void afterAddRoutes(ServletCamelContext camelContext, JndiRegistry registry)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterStart(ServletCamelContext camelContext, JndiRegistry registry)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterStop(ServletCamelContext camelContext, JndiRegistry registry)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void beforeAddRoutes(ServletCamelContext camelContext, JndiRegistry registry)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void beforeStart(ServletCamelContext camelContext, JndiRegistry registry)
			throws Exception {
		CurrencyConvertor currencyConvertor = new CurrencyConvertor();
		registry.bind("currencyconvertor",currencyConvertor);
		
		
	}

	@Override
	public void beforeStop(ServletCamelContext camelContext, JndiRegistry registry)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
