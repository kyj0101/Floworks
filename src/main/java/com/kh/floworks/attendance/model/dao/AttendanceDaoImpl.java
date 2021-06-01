package com.kh.floworks.attendance.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.attendance.model.vo.Attendance;

@Repository
public class AttendanceDaoImpl implements AttendanceDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertAttendanceOfficeIn(Attendance attendance) {
		return session.insert("attendance.insertAttendanceOfficeIn", attendance);
	}

	@Override
	public Map<String, Object> selectAttendanceSystem(String workspaceId) {
		return session.selectOne("attendance.selectAttendanceSystem", workspaceId);
	}

	@Override
	public int selectLatenessCount(Map<String, Object> param) {
		return session.selectOne("attendance.selectLatenessCount", param);
	}

	@Override
	public List<Attendance> selectweekOfficeHours(Map<String, Object> param) {
		return session.selectList("attendance.selectweekOfficeHours", param);
	}

	@Override
	public List<Attendance> selectmonthOfficeHours(Map<String, Object> param) {
		return session.selectList("attendance.selectmonthOfficeHours", param);
	}

	@Override
	public int selectTodayAttendance(String id) {
		return session.selectOne("attendance.selectTodayAttendance", id);
	}
	
	@Override
	public Attendance selectOneAttendance(String id) {
		return session.selectOne("attendance.selectOneAttendance", id);
	}

	@Override
	public List<String> selectAttendanceYear(String id) {
		return session.selectList("attendance.selectAttendanceYear", id);
	}

	@Override
	public List<String> selectAttendanceMonth(String id) {
		return session.selectList("attendance.selectAttendanceMonth", id);
	}

	@Override
	public List<Attendance> selectListAttendance(Map<String, Object> param) {
		
		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("attendance.selectListAttendance", param.get("id"), rowBounds);
	}

	@Override
	public int updateAttendanceOfficeOff(Map<String, Object> param) {
		return session.update("attendance.updateAttendanceOfficeOff", param);
	}

	@Override
	public int getTotalAttendance(String id) {
		return session.selectOne("attendance.getTotalAttendance", id);
	}


}
