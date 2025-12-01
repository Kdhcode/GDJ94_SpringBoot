package com.winter.app.board.qna;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.winter.app.board.BoardDTO;
import com.winter.app.board.BoardFileDTO;
import com.winter.app.board.BoardService; // 인터페이스 임포트
import com.winter.app.util.Pager;

@Service
public class QnaService implements BoardService { // BoardService 구현
	
	@Autowired
	private QnaDAO qnaDAO;
	
	@Value("${app.upload.qna}")
	private String uploadPath;
	
	@Override
	public List<BoardDTO> list (Pager pager)throws Exception{
		Long totalCount= qnaDAO.count(pager);
		pager.pageing(totalCount);
		return qnaDAO.list(pager);
	}
	
	@Override
	public BoardDTO detail(BoardDTO boardDTO)throws Exception{
		return qnaDAO.detail(boardDTO);
	}
	
	@Override
	public int add(BoardDTO boardDTO, MultipartFile [] attach)throws Exception{
		int result = qnaDAO.add(boardDTO);
	
		for(MultipartFile f : attach) {
			File file = new File(uploadPath);
			if(!file.exists()) {
				file.mkdirs();
			}
			String fileName = UUID.randomUUID().toString();
			fileName = fileName + "_" + f.getOriginalFilename();
			
			file = new File(file, fileName);
			
			FileCopyUtils.copy(f.getBytes(), file);
			
			BoardFileDTO boardFileDTO = new QnaFileDTO();
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setFileOrigin(f.getOriginalFilename());
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			
			qnaDAO.fileAdd(boardFileDTO);
			
		}  
		
		return result;
	}
    
	@Override
	public int update(BoardDTO boardDTO)throws Exception{
		QnaDTO qnaDTO = (QnaDTO)boardDTO;
		return qnaDAO.update(qnaDTO);
	}
	@Override
	public int delete(BoardDTO boardDTO)throws Exception{
		QnaDTO qnaDTO = (QnaDTO)boardDTO;
		return qnaDAO.delete(qnaDTO);
	}
	public int reply(QnaDTO qnaDTO) throws Exception{
		//1. 부모의 정보를 조회
		QnaDTO parent = (QnaDTO)qnaDAO.detail(qnaDTO);
		//2. 부모의 정보를 이용해서 step을 업데이트
		int result = qnaDAO.stepUpdate(parent);
		//3. 부모의 정보를 이용해서 ref, step, depth를 세팅
		qnaDTO.setBoardRef(parent.getBoardRef());
	    qnaDTO.setBoardStep(parent.getBoardStep() + 1);
	    qnaDTO.setBoardDepth(parent.getBoardDepth() + 1);
		//4. insert
	    result = qnaDAO.reply(qnaDTO);
	    
	    return result;
	}

}