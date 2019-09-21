package com.project.rainbow.vo;

import java.util.Date;

public class ReplyVO {
	
	private int pNum;
	private int rNum;
	private String userId;
	private String userName;
	private int rpNum;
	private String rpContent;
	private Date rpDate;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRpNum() {
		return rpNum;
	}
	public void setRpNum(int rpNum) {
		this.rpNum = rpNum;
	}
	public String getRpContent() {
		return rpContent;
	}
	public void setRpContent(String rpContent) {
		this.rpContent = rpContent;
	}
	public Date getRpDate() {
		return rpDate;
	}
	public void setRpDate(Date rpDate) {
		this.rpDate = rpDate;
	}
	
	
}
