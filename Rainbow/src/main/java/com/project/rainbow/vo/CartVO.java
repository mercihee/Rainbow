package com.project.rainbow.vo;

import java.text.DecimalFormat;
import java.util.Date;

public class CartVO {
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
	private String pPrice;

	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
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

	
	
	
}
