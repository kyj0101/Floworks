package com.kh.floworks.attendance.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.floworks.attendance.model.vo.Attendance;

public interface AttendanceService {
	
	int NUMPER_PAGE = 10;

	int insertAttendanceOfficeIn(Attendance attendance);

	int selectLatenessCount(Map<String, Object> param);

	Map<String, Object> selectAttendanceSystem(String workspaceId);

	List<Attendance> selectweekOfficeHours(Map<String, Object> param);

	List<Attendance> selectmonthOfficeHours(Map<String, Object> param);

	Attendance selectOneAttendance(String id);

	List<String> selectAttendanceYear(String id);

	List<String> selectAttendanceMonth(String id);

	List<Attendance> selectListAttendance(Map<String, Object> param);

	List<Attendance> selectListSearchAttendance(Map<String, Object> param);

	int updateAttendanceOfficeOff(Map<String, Object> param);

	int getTotalAttendance(String id);

	int getTotalSearchAttendance(Map<String, Object> param);





	


}
