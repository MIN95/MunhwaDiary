package egovframework.com.custom.mycalendar.service;

import java.util.Date;

public class PlayVo {
	
	private int count;
	private int seq;
	private String p_userId;
	private Date regDate;
	private String realmCode;
	private String realmName;
	private String title;
	private String startDate;
	private String endDate;
	private String place;
	private String price;
	private String contents1;
	private String contents2;
	private String imgUrl;
	
	//rownumber
	private int rowNo;
	
	//search
	private String selText;
	private String searchText;
	
	//search more
	private String cPage;
	
	//paging
	private int startPoint;
	
	public PlayVo() {}

	public PlayVo(int count,String p_userId, int seq, Date regDate, String realmCode, String realmName, String title,
			String startDate, String endDate, String place, String price, String contents1,
			String contents2, String imgUrl, int rowNo, String selText,
			String searchText,String cPage,int startPoint) {
		super();
		this.count = count;
		this.p_userId = p_userId;
		this.seq = seq;
		this.regDate = regDate;
		this.realmCode = realmCode;
		this.realmName = realmName;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.place = place;
		this.price = price;
		this.contents1 = contents1;
		this.contents2 = contents2;
		this.imgUrl = imgUrl;
		this.rowNo = rowNo;
		this.selText = selText;
		this.searchText = searchText;
		this.cPage = cPage;
		this.startPoint = startPoint;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getP_userId() {
		return p_userId;
	}

	public void setP_userId(String p_userId) {
		if((p_userId).equals("undefined")) {
			this.p_userId="";
		}else {
			this.p_userId = p_userId;
		}
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getRealmCode() {
		return realmCode;
	}

	public void setRealmCode(String realmCode) {
		this.realmCode = realmCode;
	}

	public String getRealmName() {
		return realmName;
	}

	public void setRealmName(String realmName) {
		this.realmName = realmName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		if((place).equals("undefined")) {
			this.place="";
		}else {
			this.place = place;
		}
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		if((price).equals("undefined")) {
			this.price="";
		}else {
			this.price = price;
		}
	}

	public String getContents1() {
		return contents1;
	}

	public void setContents1(String contents1) {
		if((contents1).equals("undefined")) {
			this.contents1="";
		}else {
			this.contents1 = contents1;
		}
	}

	public String getContents2() {
		return contents2;
	}

	public void setContents2(String contents2) {
		if((contents2).equals("undefined")) {
			this.contents2="";
		}else {
			this.contents2 = contents2;
		}
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getRowNo() {
		return rowNo;
	}

	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}

	public String getSelText() {
		return selText;
	}

	public void setSelText(String selText) {
		this.selText = selText;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	
	public String getcPage() {
		return cPage;
	}

	public void setcPage(String cPage) {
		this.cPage = cPage;
	}

	
	public int getStartPoint() {
		return startPoint;
	}

	public void setStartPoint(int startPoint) {
		this.startPoint = startPoint;
	}

	@Override
	public String toString() {
		return "PlayVo [count=" + count + ", seq=" + seq + ", p_userId=" + p_userId + ", regDate=" + regDate
				+ ", realmCode=" + realmCode + ", realmName=" + realmName + ", title=" + title + ", startDate="
				+ startDate + ", endDate=" + endDate + ", place=" + place + ", price=" + price + ", contents1="
				+ contents1 + ", contents2=" + contents2 + ", imgUrl=" + imgUrl + ", rowNo=" + rowNo + ", selText=" 
				+ selText + ", searchText=" + searchText + ", cPage=" + cPage+ ", startPoint=" + startPoint + "]";
	}
	
}
