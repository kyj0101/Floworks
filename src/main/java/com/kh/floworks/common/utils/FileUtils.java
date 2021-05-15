package com.kh.floworks.common.utils;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.lang.model.element.Name;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	
	public static File getRenamedFile(String saveDirectory, String oldName) {
		
		File newFile = null;
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		DecimalFormat decimalFormat = new DecimalFormat("000");
		
		int dot = oldName.lastIndexOf(".");
		String extension = dot > -1 ? oldName.substring(dot) : "";
		String newName = simpleDateFormat.format(new Date()) 
				         + decimalFormat.format(Math.random() * 999) 
				         + extension;
		
		newFile = new File(saveDirectory, newName);
		
		return newFile;
	}
	
	public static Map<String, String> getFileMap(MultipartFile[] uploadFile, String saveDirectory) throws IOException{
		
		File dir = new File(saveDirectory);
		Map<String, String> fileMap = new HashMap<>();
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		try {
			
			for(int i = 0; i < uploadFile.length; i++) {
				
				MultipartFile upFile = uploadFile[i];

				if (upFile.isEmpty()) {
					continue;
				}

				File renameFile = FileUtils.getRenamedFile(saveDirectory, upFile.getOriginalFilename());

				upFile.transferTo(renameFile);

				fileMap.put("originalName" + (i + 1), upFile.getOriginalFilename());
				fileMap.put("reNamed" + (i + 1), renameFile.getName());
			} 
			
			return fileMap;
			
		}catch (IllegalStateException | IOException e) {
			throw e;
		}
	}
}
