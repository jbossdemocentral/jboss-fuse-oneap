package com.redhat.demo03;

import javax.ejb.Startup;
import javax.enterprise.context.ApplicationScoped;
import javax.ws.rs.core.MediaType;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.cdi.ContextName;
import org.apache.camel.model.dataformat.JsonLibrary;
import org.apache.camel.model.rest.RestBindingMode;

@Startup
@ApplicationScoped
@ContextName("cdi-context")
public class MyFirstRouteBuilder extends RouteBuilder {

	@Override
	public void configure() throws Exception {
		
		restConfiguration().component("servlet")
	      .contextPath("/camel").port(8080).bindingMode(RestBindingMode.json);
		 
		rest("/currenciesrest")
	      .get()
	      .produces(MediaType.APPLICATION_JSON)
	      .to("direct:getCurrencies"); 
		
		from("direct:getCurrencies").routeId("allcurrencies").to("sql:select * from currencyexchange?dataSource=MyCamelDS")
		.marshal()
		.json(JsonLibrary.Jackson);
	       
		from("direct:getCurrency").routeId("covertcurrency")
			.log("Got currency: ${headers.amt} and amt${headers.currency} ")
			.choice()
				.when()
					.header("currency")
					.to("sql:select * from currencyexchange where currencycode = :#currency?dataSource=MyCamelDS")
					.log("exchange rate ====> ${body[0][rate]}")
					.to("bean:currencyconvertor?method=convertUSD(${headers.amt},${body})")
				.otherwise()
					.log("nothing to lookup")
					.transform().constant("nothing to lookup");
					
		
		from("servlet:///currencies?servletName=camel&matchOnUriPrefix=true").routeId("servletCurrencies").to("direct:getCurrencies");
		from("servlet:///currency?servletName=camel&matchOnUriPrefix=true").routeId("servletCurrency").to("direct:getCurrency");
		
	}

}
