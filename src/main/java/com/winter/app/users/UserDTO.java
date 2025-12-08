package com.winter.app.users;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Setter
@Getter
@ToString
public class UserDTO implements UserDetails{

	@NotBlank(message = "아이디는 필수입니다.", groups = {RegisterGroup.class})
	private String username;

	@NotBlank(message = "비밀번호는 필수입니다.", groups = {RegisterGroup.class,PasswordGroup.class})
	@Pattern(
	  regexp = "^(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?`~]).{8,20}$",
	  message = "비밀번호는 8~20자이며 소문자/숫자/특수문자를 모두 포함해야 합니다."
	  ,groups = {RegisterGroup.class,PasswordGroup.class}
	)
	private String password;
	
	private String passwordCheck;

	@NotBlank(message = "이름은 필수입니다.",groups = {RegisterGroup.class,UpdateGroup.class})
	private String name;

	@NotBlank(message = "이메일은 필수입니다.",groups = {RegisterGroup.class,UpdateGroup.class})
	@Email(message = "이메일 형식이 올바르지 않습니다.",groups = {RegisterGroup.class,UpdateGroup.class})
	private String email;

	@NotBlank(message = "휴대폰 번호는 필수입니다.",groups = {RegisterGroup.class,UpdateGroup.class})
	@Pattern(
	  regexp = "^01[016789]-?\\d{3,4}-?\\d{4}$",
	  message = "휴대폰 번호 형식이 올바르지 않습니다. 예: 010-1234-5678"
	  ,groups = {RegisterGroup.class,UpdateGroup.class}
	)
	private String phone;

	@NotNull(message = "생년월일은 필수입니다.",groups = {RegisterGroup.class,UpdateGroup.class})
	@Past(message = "생년월일은 과거 날짜여야 합니다.",groups = {RegisterGroup.class,UpdateGroup.class})
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth;

	private UserFileDTO userFileDTO;
	
	private List<RoleDTO> roleDTOs;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		List<GrantedAuthority> list = new ArrayList<>();
		
		for(int i = 0; i < roleDTOs.size(); i++) {
			GrantedAuthority g = new SimpleGrantedAuthority(roleDTOs.get(i).getRoleName());
			list.add(g);
		}
		
		return list;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
