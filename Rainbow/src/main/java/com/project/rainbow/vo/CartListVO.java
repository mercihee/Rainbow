package com.project.rainbow.vo;

import java.text.DecimalFormat;
import java.util.Date;

public class CartListVO {
/*
	cartNum number not null,
    userId varchar2(50) not null,
    pNum number not null,
    cartStock number not null,
    cartDate date default sysdate,
 */

	private int cartNum;
	private String userId;
	private int pNum;
	private int cartStock;
	private Date cartDate;
	
	private int num;
	private String pName;
	private int pPrice;
	private String pImg;
	private String pImg2;
	private String one_price;
		
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpImg2() {
		return pImg2;
	}
	public void setpImg2(String pImg2) {
		this.pImg2 = pImg2;
	}
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public Date getCartDate() {
		return cartDate;
	}
	public void setCartDate(Date cartDate) {
		this.cartDate = cartDate;
	}
	public String getOne_price() {
		DecimalFormat comma=new DecimalFormat("#,###");
		this.one_price=(String)comma.format(pPrice);
		return one_price;
	}
	public void setOne_price(String one_price) {
		this.one_price = one_price;
	}
	
	
}
