package com.sweethome.sweet.message.vo;

import java.io.UnsupportedEncodingException;
import org.springframework.stereotype.Component;
import java.sql.Date;

@Component("messageVO")
public class MessageVO {
	private int no; //��ȣ
	private String title; //����
	private String content; //����
	private Date writeDate; //�ۼ���¥
	private String send_id; //������ ���̵�
	private String recv_id; //�޴� ���̵� 
	
	public MessageVO() {
		
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getRecv_id() {
		return recv_id;
	}

	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	
}
