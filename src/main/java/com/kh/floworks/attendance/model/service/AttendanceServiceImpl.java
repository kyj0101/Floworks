package com.kh.floworks.attendance.model.service;

import java.util.Date;
import java.util.List;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.attendance.model.dao.AttendanceDao;
import com.kh.floworks.attendance.model.vo.Attendance;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Override
	public int insertAttendanceOfficeIn(Attendance attendance) {
		return attendanceDao.insertAttendanceOfficeIn(attendance);
	}

	@Override
	public Map<String, Object> selectAttendanceSystem(String workspaceId) {
		return attendanceDao.selectAttendanceSystem(workspaceId);
	}

	@Override
	public int selectLatenessCount(Map<String, Object> param) {
		return attendanceDao.selectLatenessCount(param);
	}

	@Override
	public List<Attendance> selectweekOfficeHours(Map<String, Object> param) {
		return attendanceDao.selectweekOfficeHours(param);
	}

	@Override
	public List<Attendance> selectmonthOfficeHours(Map<String, Object> param) {
		return attendanceDao.selectmonthOfficeHours(param);
	}

	@Override
	public Attendance selectOneAttendance(String id) {
		return attendanceDao.selectOneAttendance(id);
	}

	@Override
	public List<String> selectAttendanceYear(String id) {
		return attendanceDao.selectAttendanceYear(id);
	}

	@Override
	public List<String> selectAttendanceMonth(String id) {
		return attendanceDao.selectAttendanceMonth(id);
	}
	
	@Override
	public List<Attendance> selectListAttendance(Map<String, Object> param) {
		return attendanceDao.selectListAttendance(param);
	}

	@Override
	public List<Attendance> selectListSearchAttendance(Map<String, Object> param) {
		return attendanceDao.selectListSearchAttendance(param);
	}
	
	@Override
	public int selectMemberLeave(String id) {
		return attendanceDao.selectMemberLeave(id);
	}
	
	@Override
	public int updateAttendanceOfficeOff(Map<String, Object> param) {
		return attendanceDao.updateAttendanceOfficeOff(param);
	}

	@Override
	public int getTotalAttendance(String id) {
		return attendanceDao.getTotalAttendance(id);
	}

	@Override
	public int getTotalSearchAttendance(Map<String, Object> param) {
		return attendanceDao.getTotalSearchAttendance(param);
	}

	
}
