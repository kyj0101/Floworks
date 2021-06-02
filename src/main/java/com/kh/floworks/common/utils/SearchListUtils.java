package com.kh.floworks.common.utils;

import java.util.List;

import com.kh.floworks.email.model.vo.Email;

public class SearchListUtils {
	
	public static final int NUMPERPAGE = 7;
	
	public static final int EMAIL_FILE_NUMPERPAGE = 3;
	
	public static String shorteningContent(String content) {
		
		if(content == null) {
			return content;
		}
		
		int length = content.length();
		int index = content.indexOf("</p>");
		content = index > -1 ? content.substring(0, index-1) : content;
		
		//원본 content의 길이가 자른 content길이보다 더 길면 말 줄임표 표시를 추가함 
		//10을 추가한 이유는 &nbsp;</p>길이 때문이다.
		content = length > (content.length() + 10) ? content + "..." : content; 
		
		return content;
	}
	
}
