package com.kh.floworks.common.utils;

public class PageBarUtils {

	public static String getPageBar(int totalContents, int cPage, int numPerPage, String url) {
		StringBuilder pageBar = new StringBuilder();
		
		int pageBarSize = 5;
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);

		// /spring/board/boardList?cPage=
		// /spring/board/boardList?searchType=memberId&searchKeyward=a&cPage=
		url = url + (url.indexOf("?") > -1 ? "&" : "?") + "cPage=";
		
		// 1 2 3 4 5 : pageStart 1 ~ pageEnd 5 
		// 6 7 8 9 10 : pageStart 6 ~ pageEnd 10 
		int pageStart = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageStart + pageBarSize - 1;
		
		//증감변수
		int pageNo = pageStart;
		
		pageBar.append("<nav><ul class=\"pagination justify-content-center\">\n");
		
		//이전 영역
		if(pageNo == 1) {
			pageBar.append("<li class=\"page-item disabled\">\r\n" + 
					"      <a class=\"page-link\" href=\"#\" tabindex=\"-1\">&laquo;</a>\r\n" + 
					"    </li>\n");
		}
		else {
			pageBar.append("<li class=\"page-item\">\r\n" + 
					"      <a class=\"page-link\" href=\"javascript:paging(" + (pageNo - 1) + ")\" tabindex=\"-1\">&laquo;</a>\r\n" + 
					"    </li>\n");
		}
		
		//페이지 No 영역
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			//현재페이지인 경우, 링크비활성화
			if(pageNo == cPage) {
				pageBar.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#\">" + pageNo + "</a></li>\n");
			}
			else {
				pageBar.append("<li class=\"page-item\"><a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\">" + pageNo + "</a></li>\n");
			}
			pageNo++;
		}
		//다음 영역
		if(pageNo > totalPage) {
			pageBar.append("<li class=\"page-item\">\r\n" + 
					"      <a class=\"page-link\" href=\"#\">&raquo;</a>\r\n" + 
					"    </li>\n");
		}
		else {
			pageBar.append("<li class=\"page-item\">\r\n" + 
					"      <a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\">&raquo;</a>\r\n" + 
					"    </li>\n");
		}
		
		pageBar.append("</ul></nav>\n");
		pageBar.append("<script>function paging(pageNo){ location.href = '" + url + "' + pageNo; }</script>");
		
		return pageBar.toString();
	}
}
