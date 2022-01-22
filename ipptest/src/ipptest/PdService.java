package ipptest;

import java.util.ArrayList;
import java.util.List;

public class PdService {

	List<Product> list = new ArrayList<Product>();
	
	public void initList() {
		Product pd = new Product("A100", "삼성전자");
		list.add(pd);

	}

	
	public String getProduct(String pcode) {
		initList();
		for(Product pd : list) {
			if(pcode.equals(pd.getPcode())) {
				return pd.getPname();
			}
		}
		
		return "등록되지 않은 제품입니다!!";
			
	}
	
	
	
	
}
