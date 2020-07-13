package egovframework.com.custom.mycalendar.service;

import java.util.Date;

public class MyDiaryVo {
	
	private int myDiarySeq;
	private String md_userId;
	private Date diaryDate;
	private String diaryTitle;
	private String diaryContents;
	private String startDate;
	private String endDate;
	private String mdSeq;
	
	//공연
	private String imgUrl;
	private String title;
	private String place;
	
	//페이징
	private int startPoint;
	public MyDiaryVo() {
	}
	public int getMyDiarySeq() {
		return myDiarySeq;
	}

	public void setMyDiarySeq(int myDiarySeq) {
		this.myDiarySeq = myDiarySeq;
	}

	public String getMd_userId() {
		return md_userId;
	}

	public void setMd_userId(String md_userId) {
		this.md_userId = md_userId;
	}

	public Date getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}

	public String getDiaryTitle() {
		return diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}

	public String getDiaryContents() {
		return diaryContents;
	}

	public void setDiaryContents(String diaryContents) {
		this.diaryContents = diaryContents;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getMdSeq() {
		return mdSeq;
	}
	public void setMdSeq(String mdSeq) {
		this.mdSeq = mdSeq;
	}
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public int getStartPoint() {
		return startPoint;
	}

	public void setStartPoint(int startPoint) {
		this.startPoint = startPoint;
	}
	@Override
	public String toString() {
		return "MyDiaryVo [myDiarySeq=" + myDiarySeq + ", md_userId=" + md_userId + ", diaryDate=" + diaryDate
				+ ", diaryTitle=" + diaryTitle + ", diaryContents=" + diaryContents + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", mdSeq=" + mdSeq + ", imgUrl=" + imgUrl + ", title=" + title + ", place="
				+ place + ", startPoint=" + startPoint + "]";
	}
	
}
