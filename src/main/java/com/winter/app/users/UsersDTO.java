package com.winter.app.users;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UsersDTO {
	private String username;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String birth;
}
