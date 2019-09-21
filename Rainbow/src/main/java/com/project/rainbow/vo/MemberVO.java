package com.project.rainbow.vo;

import java.util.Date;

public class MemberVO {
/*
	userId varchar2(50) primary key,
    userPass varchar2(100) not null,
    userName VARCHAR2(50) not null,
    userPhone varchar2(20) not null,
    joinDate date default sysdate,
    verify number default 0
 */
	
	
	private String userId;
	private String userPass;
	private String userName;
	private String userPhone;
	private Date joinDate;
	private int rainAdmin;
	
	public int getRainAdmin() {
		return rainAdmin;
	}
	public void setRainAdmin(int rainAdmin) {
		this.rainAdmin = rainAdmin;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	
}
