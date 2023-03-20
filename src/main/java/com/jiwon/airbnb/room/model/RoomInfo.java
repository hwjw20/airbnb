package com.jiwon.airbnb.room.model;

import java.util.List;

import com.jiwon.airbnb.room.imagePath.model.ImagePath;

public class RoomInfo {

	private int roomId;
	private String hostName;
	private String type;
	private String privacy;
	private String address;
	private int headcount;
	private int bed;
	private int bedroom;
	private int bathroom;
	private String roomName;
	private String roomDescription;
	private int selfCheckin;
	private int charge;
	private double rating;
	private int reviewCount;
	private List<String> imagePathList;
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getHeadcount() {
		return headcount;
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount;
	}
	public int getBed() {
		return bed;
	}
	public void setBed(int bed) {
		this.bed = bed;
	}
	public int getBedroom() {
		return bedroom;
	}
	public void setBedroom(int bedroom) {
		this.bedroom = bedroom;
	}
	public int getBathroom() {
		return bathroom;
	}
	public void setBathroom(int bathroom) {
		this.bathroom = bathroom;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomDescription() {
		return roomDescription;
	}
	public void setRoomDescription(String roomDescription) {
		this.roomDescription = roomDescription;
	}
	public int getSelfCheckin() {
		return selfCheckin;
	}
	public void setSelfCheckin(int selfCheckin) {
		this.selfCheckin = selfCheckin;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public List<String> getImagePathList() {
		return imagePathList;
	}
	public void setImagePathList(List<String> imagePathList) {
		this.imagePathList = imagePathList;
	}
	
	
}
