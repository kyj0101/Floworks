package com.kh.floworks.attendance.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.floworks.attendance.model.vo.Attendance;

public interface AttendanceService {

	int insertAttendanceOfficeIn(Attendance attendance);

	int selectLatenessCount(Map<String, Object> param);

	Map<String, Object> selectAttendanceSystem(String workspaceId);

	List<Attendance> selectweekOfficeHours(Map<String, Object> param);

	List<Attendance> selectmonthOfficeHours(Map<String, Object> param);

	Attendance selectOneAttendance(String id);

	List<String> selectAttendanceYear(String id);

	List<String> selectAttendanceMonth(String id);

	int updateAttendanceOfficeOff(Map<String, Object> param);



	


}
