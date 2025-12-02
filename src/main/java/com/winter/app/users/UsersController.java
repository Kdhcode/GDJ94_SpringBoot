package com.winter.app.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/users/*")
@Controller
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("register")
	public String usersAdd() throws Exception {	
		return "users/register";

	}
	
	@PostMapping("register")
	public String usersAdd(UsersDTO usersDTO, MultipartFile attach) throws Exception {	
		int result = usersService.usersAdd(usersDTO, attach);
		return "redirect:..";
	}
	
	@GetMapping("mypage")
	public String myPage(UsersDTO usersDTO, Model model) throws Exception {
		usersDTO = usersService.mypage(usersDTO);
		model.addAttribute("dto",usersDTO);
		return "users/mypage";
	}
	
}
