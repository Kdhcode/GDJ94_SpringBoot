package com.winter.app.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winter.app.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("list")
	public void list(Pager pager, Model model) throws Exception {
		List<QnaDTO> list = qnaService.list(pager);
		model.addAttribute("list",list);
	}
	
	@PostMapping("add")
	public String add(QnaDTO qnaDTO) throws Exception{
		qnaService.add(qnaDTO);
		return "redirect:./list";
	}
	@GetMapping("add")
	public void add() {}
}
