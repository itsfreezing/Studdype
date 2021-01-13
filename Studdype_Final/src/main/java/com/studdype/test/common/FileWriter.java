package com.studdype.test.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileWriter {
	
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
}
