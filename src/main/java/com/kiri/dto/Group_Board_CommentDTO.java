package com.kiri.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Group_Board_CommentDTO {
	private int seq_group_comment;
	private int seq_group_board;
	private int seq_group;
	private String user_email;
	private String user_nickname;
	private String comment_content;
	private String comment_date;
	private String user_image;
	
	
//	// date -> String 생성자
//	public Group_Board_CommentDTO(int seq_group_comment, int seq_group_board, int seq_group, String user_email,
//			String user_nickname, String comment_content, Date comment_date) {
//		super();
//		this.seq_group_comment = seq_group_comment;
//		this.seq_group_board = seq_group_board;
//		this.seq_group = seq_group;
//		this.user_email = user_email;
//		this.user_nickname = user_nickname;
//		this.comment_content = comment_content;
//		this.comment_date = getStringDate(comment_date);
//	}
			
	public Group_Board_CommentDTO() {}
	public Group_Board_CommentDTO(int seq_group_comment, int seq_group_board, int seq_group, String user_email,
			String user_nickname, String comment_content, String comment_date, String user_image) {
		super();
		this.seq_group_comment = seq_group_comment;
		this.seq_group_board = seq_group_board;
		this.seq_group = seq_group;
		this.user_email = user_email;
		this.user_nickname = user_nickname;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
		this.user_image = user_image;
	}
	
	public Group_Board_CommentDTO(int seq_group_comment, int seq_group_board, int seq_group, String user_email,
			String user_nickname, String comment_content, Date comment_date, String user_image) {
		super();
		this.seq_group_comment = seq_group_comment;
		this.seq_group_board = seq_group_board;
		this.seq_group = seq_group;
		this.user_email = user_email;
		this.user_nickname = user_nickname;
		this.comment_content = comment_content;
		this.comment_date = getStringDate(comment_date);
		this.user_image = user_image;
	}

	// date -> String
	public String getStringDate(Date date) {
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
			rs = sdf.format(date);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public int getSeq_group_comment() {
		return seq_group_comment;
	}

	public void setSeq_group_comment(int seq_group_comment) {
		this.seq_group_comment = seq_group_comment;
	}

	public int getSeq_group_board() {
		return seq_group_board;
	}

	public void setSeq_group_board(int seq_group_board) {
		this.seq_group_board = seq_group_board;
	}

	public int getSeq_group() {
		return seq_group;
	}

	public void setSeq_group(int seq_group) {
		this.seq_group = seq_group;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	@Override
	public String toString() {
		return "Group_Board_CommentDTO [seq_group_comment=" + seq_group_comment + ", seq_group_board=" + seq_group_board
				+ ", seq_group=" + seq_group + ", user_email=" + user_email + ", user_nickname=" + user_nickname
				+ ", comment_content=" + comment_content + ", comment_date=" + comment_date + ", user_image="
				+ user_image + "]";
	}

}
