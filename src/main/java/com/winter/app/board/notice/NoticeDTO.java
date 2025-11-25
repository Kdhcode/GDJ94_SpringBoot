package com.winter.app.board.notice;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class NoticeDTO {
	private Long boardNum;
	private String boardWriter;
	private String boardTitle;
	private String boardContents;
	private LocalDate boardDate;
	private Long boradHit;
}
