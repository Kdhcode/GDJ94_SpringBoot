package com.winter.app.users;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.winter.app.board.BoardFileDTO;
import com.winter.app.files.FileManager;

@Service
public class UsersService {

	@Autowired
	private UsersDAO usersDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload.user}")
	private String uploadPath;
	
	public int usersAdd(UsersDTO usersDTO, MultipartFile attach) throws Exception {
	    int result = usersDAO.usersAdd(usersDTO);

	    if (attach == null || attach.isEmpty()) {
	        return result;
	    }

	   
	    File dir = new File(uploadPath);
	    String fileName = fileManager.fileSave(dir, attach);

	  
	    BoardFileDTO boardFileDTO = new BoardFileDTO();
	    boardFileDTO.setFileName(fileName);
	    boardFileDTO.setFileOrigin(attach.getOriginalFilename());
	    boardFileDTO.setBoardNum(usersDTO.getUsername());

	    usersDAO.boardFileAdd(boardFileDTO); 

	    return result;
	}

	
	public UsersDTO mypage(UsersDTO usersDTO) throws Exception {
		return usersDAO.mypage(usersDTO);
	}
}
