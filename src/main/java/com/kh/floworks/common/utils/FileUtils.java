package com.kh.floworks.common.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.lang.model.element.Name;

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
}
