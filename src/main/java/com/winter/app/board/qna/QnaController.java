package com.winter.app.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winter.app.board.BoardDTO;
import com.winter.app.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("list")
	public String list(Pager pager, Model model) throws Exception {
		List<BoardDTO> list = qnaService.list(pager);
		model.addAttribute("list",list);
		
		return "board/list";
	}
	
	@PostMapping("add")
	public String add(QnaDTO qnaDTO) throws Exception{
		qnaService.add(qnaDTO);
		return "redirect:./list";
	}
	
	@GetMapping("add")
	public String add() {
		return "board/add";
	}
	
	@GetMapping("detail")
	public String detail(QnaDTO qnaDTO, Model model) throws Exception {
		qnaDTO = (QnaDTO)qnaService.detail(qnaDTO);
		model.addAttribute("dto",qnaDTO);
		
		return "board/detail";
	}
	
	@GetMapping("reply")
	public String reply(QnaDTO qnaDTO, Model model) throws Exception{
		model.addAttribute("dto", qnaDTO);
		return "board/add";
	}
	@PostMapping("reply")
	public String reply(QnaDTO qnaDTO) throws Exception {
		qnaService.reply(qnaDTO);
		return "redirect:./list";
	}
	
}
