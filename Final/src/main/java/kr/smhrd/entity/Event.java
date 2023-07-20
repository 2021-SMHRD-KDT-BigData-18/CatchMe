package kr.smhrd.entity;

import java.util.Date;

public class Event {
	
	public int event_seq;
	public Long rec_seq;
	public String event_content;
	public Date event_at;
	public String event_img;
	
	public Event() {}
	
	public Event(int event_seq, Long rec_seq, String event_content, Date event_at, String event_img) {
		super();
		this.event_seq = event_seq;
		this.rec_seq = rec_seq;
		this.event_content = event_content;
		this.event_at = event_at;
		this.event_img = event_img;
	}

	public int getEvent_seq() {
		return event_seq;
	}

	public void setEvent_seq(int event_seq) {
		this.event_seq = event_seq;
	}

	public Long getRec_seq() {
		return rec_seq;
	}

	public void setRec_seq(Long rec_seq2) {
		this.rec_seq = rec_seq2;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public Date getEvent_at() {
		return event_at;
	}

	public void setEvent_at(Date event_at) {
		this.event_at = event_at;
	}

	public String getEvent_img() {
		return event_img;
	}

	public void setEvent_img(String event_img) {
		this.event_img = event_img;
	}
	
}
