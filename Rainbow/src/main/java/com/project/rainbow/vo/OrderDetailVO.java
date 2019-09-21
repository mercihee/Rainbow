package com.project.rainbow.vo;

public class OrderDetailVO {

	private int orderDnum;
	private String orderId;
	private int pNum;
	private int cartStock;
	private int cartNum;
	
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public int getOrderDnum() {
		return orderDnum;
	}
	public void setOrderDnum(int orderDnum) {
		this.orderDnum = orderDnum;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	
	
}
