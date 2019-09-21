package com.project.rainbow.vo;

import java.util.Date;

public class ProductVO {
/*
	pNum number not null,
    pName varchar2(50) not null,
    pCode varchar2(30) not null,
    pPrice number not null,
    pStock number null,
    pContent varchar2(500) null,
    pImg varchar2(200) null,
    pDate date default sysdate,
 */
	private int pNum;
	private String pName;
	private String cCode;
	private int pPrice;
	private int pStock;
	private String pContent;
	private String pImg;
	private String pImg2;
	private Date pDate;
	
	private String cCodeRef;
	private String cName;
	
	public String getpImg2() {
		return pImg2;
	}
	public void setpImg2(String pImg2) {
		this.pImg2 = pImg2;
	}
	
	
	public String getcCodeRef() {
		return cCodeRef;
	}
	public void setcCodeRef(String cCodeRef) {
		this.cCodeRef = cCodeRef;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getcCode() {
		return cCode;
	}
	public void setcCode(String cCode) {
		this.cCode = cCode;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpStock() {
		return pStock;
	}
	public void setpStock(int pStock) {
		this.pStock = pStock;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	
	
}