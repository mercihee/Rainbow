package com.project.rainbow.vo;

public class CategoryVO {
/*
    cName varchar2(20) not null,
    cCode varchar2(30) not null,
    cCodeRef varchar2(30) null,
 */
	
	private String cName;
	private String cCode;
	private String cCodeRef;
	private int level;
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcCode() {
		return cCode;
	}
	public void setcCode(String cCode) {
		this.cCode = cCode;
	}
	public String getcCodeRef() {
		return cCodeRef;
	}
	public void setcCodeRef(String cCodeRef) {
		this.cCodeRef = cCodeRef;
	}
	
	
}
