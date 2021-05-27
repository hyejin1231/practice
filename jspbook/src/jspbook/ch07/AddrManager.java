package jspbook.ch07;

import java.util.ArrayList;
import java.util.List;

public class AddrManager {

	List<AddBean> addrlist = new ArrayList<AddBean>();
	
	//주소록 추가 메서드 
	public void add(AddBean ab) {
		addrlist.add(ab);
	}
	
	//주소록 목록 전달 메서드 
	public List<AddBean> getAddrList() {
		return addrlist;
	}
	
	
	// 특정 사용자를 주소록 목록에서 검색하는 메서드 
	public AddBean getAddr(String username) {
		for(AddBean ab: addrlist) {
			if(ab.getUsername().equals(username)) {
				return ab;
			}
		}
		
		return null;
	}
	
}
