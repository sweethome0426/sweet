package com.sweethome.sweet.goodscontract.vo;

import java.io.UnsupportedEncodingException;
import org.springframework.stereotype.Component;
import java.sql.Date;

@Component("goodsContractVO")
public class GoodsContractVO {
	private int goodscon_id; //매물내역 아이디
	private int goods_id; //매물 아이디
	private String member_id; //사용자 아이디
	private String bp_id; //사업자 아이디
	private int price; //가격
	private Date sale_date; //계약날짜
	private String region; //매물지역
	private String state; //계약상태

	public GoodsContractVO() {
		
	}
	
	public int getGoodscon_id() {
		return goodscon_id;
	}

	public void setGoodscon_id(int goodscon_id) {
		this.goodscon_id = goodscon_id;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBp_id() {
		return bp_id;
	}

	public void setBp_id(String bp_id) {
		this.bp_id = bp_id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getSale_date() {
		return sale_date;
	}

	public void setSale_date(Date sale_date) {
		this.sale_date = sale_date;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}