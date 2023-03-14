package com.jiwon.airbnb.room.model;

import java.util.List;

import com.jiwon.airbnb.room.imagePath.model.ImagePath;

public class RoomInfo {

	private int roomId;
	private String type;
	private String address;
	private int charge;
	private List<String> imagePathList;
	private double rating;
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public List<String> getImagePathList() {
		return imagePathList;
	}
	public void setImagePathList(List<String> imagePathList) {
		this.imagePathList = imagePathList;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
		
	
}
