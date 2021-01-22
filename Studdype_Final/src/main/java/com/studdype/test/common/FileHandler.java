package com.studdype.test.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

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
	//파일 한개 삭제
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
		
	//파일 여러개삭제
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
	//파일 다운로드
	public void downloadFile(FileDto dto, HttpServletResponse response)  {
		
		try {
			File file = new File(dto.getF_url());
			byte fileByte[] =  FileCopyUtils.copyToByteArray(file);
			String fileName = dto.getF_name().replace(" ", ""); //공백제거
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\""+ URLEncoder.encode(fileName,"UTF-8") +"\"");
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
	
	//기본 path 반환
	public String getPath(HttpServletRequest request) {
		String path = null;
		
		try {
			path = WebUtils.getRealPath(request.getSession().getServletContext() , "");
		} catch (FileNotFoundException e) {
			System.out.println("[ERROR][FileHandler] getPath method");
			e.printStackTrace();
		}
		
		return path;
	}
	
	//파일 dto반환 파일요소들 뽑아서 fileList에 저장
	public List<FileDto> getFileList(MultipartFile[] mfileList, HttpServletRequest request) {
		List<FileDto> fileList = new ArrayList<FileDto>();//파일리스트 생성
		
		for(int i = 0 ;  i < mfileList.length  ; i++) {
			String f_name = mfileList[i].getOriginalFilename(); // 파일 실제이름
			double f_size = mfileList[i].getSize(); // 파일 실제크기
			f_size =  Math.round( (f_size /1024)*100 ) / 100.0; //KB로 변환 
			
			String fakeName = System.currentTimeMillis() + f_name; //가짜이름 생성
			String f_url = null;
			try {
				f_url = WebUtils.getRealPath(request.getSession().getServletContext(), "resources\\file\\"+fakeName);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
			FileDto fileDto = new FileDto(f_name, f_size, f_url);
			fileList.add(fileDto);
		}		
		
		
		return fileList;
	}
	
	// 파일명만 String으로 뽑아내기
	// ex) C:\workspace\~\wtpwebapps\Studdype_Final\resources\file\example.jpg => return fileName == example.jpg
	// DB에 String으로 저장된 파일의 실제경로를 매개변수로 가지고 메소드를 실행하면 파일의 이름만 추출해주는 메소드
	public String getFileName(String f_url) {
		
		File file = new File(f_url);
		String fileName = null;
		
		fileName = file.getName();
		
		return fileName;
	}
}
