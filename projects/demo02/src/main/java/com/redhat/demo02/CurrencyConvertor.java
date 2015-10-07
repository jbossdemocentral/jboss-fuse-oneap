package com.redhat.demo02;

import java.util.ArrayList;
import java.util.Map;


public class CurrencyConvertor {
	
	public double convertUSD(double amt, ArrayList<Map<String, Object>> data){
		Double rate = (Double)data.get(0).get("rate");
		return amt*rate;
	}

}
