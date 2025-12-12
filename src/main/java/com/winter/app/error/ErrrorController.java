package com.winter.app.error;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

// 예외를 전역 처리하는 controller
@ControllerAdvice
public class ErrrorController {

	// 예외 처리 메서드
		@ExceptionHandler(NullPointerException.class)
		public String exc1(Model model) {
			
			return "error/error_page";
		}
		@ExceptionHandler(Exception.class)
		public String exc2(Model model) {
			
			return "error/error_page";
		}
		@ExceptionHandler(Throwable.class)
		public String exc3(Model model) {
			
			return "error/error_page";
		}
	
}
