package jspbook.ch07;

import java.util.ArrayList;
import java.util.List;

public class PdManager {

	List<AddPd> addlist = new ArrayList<AddPd>();
	
	//주소록 추가 메서드 
	public void add(AddPd pd) {
		addlist.add(pd);
	}
	
	//주소록 목록 전달 메서드 
	public List<AddPd> getAddrList() {
		return addlist;
	}
	
	
	// 특정 사용자를 주소록 목록에서 검색하는 메서드 
	public AddPd getAddr(String username) {
		for(AddPd pd: addlist) {
			if(pd.getPdname().equals(username)) {
				return pd;
			}
		}
		
		return null;
	}
}
