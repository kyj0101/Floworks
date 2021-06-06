package com.kh.floworks.attendance.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.floworks.attendance.model.vo.Attendance;

public interface AttendanceDao {

	int insertAttendanceOfficeIn(Attendance attendance);

	Map<String, Object> selectAttendanceSystem(String workspaceId);

	int selectLatenessCount(Map<String, Object> param);

	List<Attendance> selectweekOfficeHours(Map<String, Object> param);

	List<Attendance> selectmonthOfficeHours(Map<String, Object> param);

	int selectTodayAttendance(String id);

	Attendance selectOneAttendance(String id);

	List<String> selectAttendanceYear(String id);

	List<String> selectAttendanceMonth(String id);

	List<Attendance> selectListAttendance(Map<String, Object> param);

	List<Attendance> selectListSearchAttendance(Map<String, Object> param);

	int selectMemberLeave(String id);

	int updateAttendanceOfficeOff(Map<String, Object> param);

	int getTotalAttendance(String id);

	int getTotalSearchAttendance(Map<String, Object> param);









}
