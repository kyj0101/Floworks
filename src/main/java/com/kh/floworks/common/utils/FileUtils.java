package com.kh.floworks.common.utils;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	/**
	 * renameList에 존재하지 않는 파일은 모두 삭제함.
	 * @param renameList : DB에 저장하고 있는 파일 리네임값
	 * @param saveDirectory : 파일 경로
	 */
	public static void cleaningFiles(List<String> renameList, String saveDirectory) {
		
		File dir = new File(saveDirectory);
		File[] fileArry = dir.listFiles();

		for(File file : fileArry) {
			
			String fileName = file.getName();

			if(!renameList.contains(fileName)){
				file.delete();
			}
		}
	}
	

}
