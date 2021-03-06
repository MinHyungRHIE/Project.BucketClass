package com.pap.bucketclass.model;

/**
 * 제공자 마이페이지 정보 모델
 */
public class ProviderMyPageModel {
	
	private String memberEmail;
	private String memberNickname;
	private String memberImg;
	private String introduce;
	private String career;
	private String certi;
	
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getCerti() {
		return certi;
	}
	public void setCerti(String certi) {
		this.certi = certi;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	
}
