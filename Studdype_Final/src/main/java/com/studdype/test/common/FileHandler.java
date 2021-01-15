package com.studdype.test.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.studdype.test.model.dto.board.FileDto;

public class FileHandler {
	
	private FileOutputStream fos;
	
	//파일 저장 함수
	public void writeFile(MultipartFile file, String path, String f_url) {
		
		try {
			byte fileData[] = file.getBytes();
			
			
			//폴더없으면 생성
			path += "resources";
			File resources = new File(path);
			
			if(!resources.exists()) {
				resources.mkdir();
			}
			
			path +="\\file";
			File fileFolder = new File(path);
			
			if(!fileFolder.exists()) {
				fileFolder.mkdir();
			}
			
			
			
			fos = new FileOutputStream(f_url);
			fos.write(fileData);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			 if(fos != null) {
				 try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			 }
		}
		
		
	}
	
	public int deleteFile(FileDto dto) {
		
		String path = dto.getF_url();
		File file = new File(path);
		int res = 0;
		
		if ( file.exists() ) {
			if(file.delete()) {
				System.out.println("[Success]:deleteFile"+path+" 파일 삭제 성공");
				res = 1;
			}else {
				System.out.println("[Fail]:deleteFile"+path+" 파일 삭제 실패");
			}
		}else {
			System.out.println("[ERROR]: deleteFile 존재하지 않는 파일!!");
		}
		
		
		return res;
	}
		
	
	@Transactional
	public int deleteFile(List<FileDto> fileList) {
		int listSize = fileList.size();
		int cnt = 0;
		int res = 0;
		for(int i = 0 ; i  < fileList.size() ; i++) {
			String path = fileList.get(i).getF_url();
			File file = new File(path);
			
			if( file.exists() ) {
				if(file.delete()) {
					System.out.println("[Success]:deleteFile"+path+" 파일 삭제 성공");
					cnt++;
					
				}else {
					System.out.println("[Fail]:deleteFile"+path+" 파일 삭제 실패");
				}
			}else {
				System.out.println("[ERROR]: deleteFile : 존재하지 않는 파일 입니다.");
			}
		}
		
		if(cnt == listSize) {
			res = 1;
		}
		
		return res;
	}
	
	public void downloadFile(FileDto dto, HttpServletResponse response)  {
		
		try {
			File file = new File(dto.getF_url());
			byte fileByte[] =  FileCopyUtils.copyToByteArray(file);
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\""+ URLEncoder.encode(dto.getF_name(),"UTF-8") +"\"");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (UnsupportedEncodingException e) {
			System.out.println("[ERROR] : [FileHandler] downloadFile method");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("[ERROR] : [FileHandler] downloadFile method");
			e.printStackTrace();
		}
	}
	
}
