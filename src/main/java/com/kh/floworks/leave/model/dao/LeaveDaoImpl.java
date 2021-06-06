package com.kh.floworks.leave.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.leave.model.vo.Leave;
import com.kh.floworks.leave.model.vo.LeaveFile;
import com.kh.floworks.leave.model.vo.LeaveRequest;

@Repository
public class LeaveDaoImpl implements LeaveDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertLeaveReq(LeaveRequest lvReq) {
		return session.insert("leave.insertLeaveReq", lvReq);
	}

	@Override
	public int insertAttachment(LeaveFile attachFile) {
		return session.insert("leave.insertAttachment", attachFile);
	}

	@Override
	public List<LeaveRequest> selectLeaveList(Map<String, Object> param, String workspaceId) {
		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("leave.selectLeaveList", workspaceId, rowBounds);
	}

	@Override
	public int updateApprove(String leaveId) {
		return session.update("leave.updateApprove", leaveId);
	}

	@Override
	public int updateMemberLeave(Leave lv) {
		return session.update("leave.updateMemberLeave", lv);
	}

	@Override
	public int updateReject(String leaveId) {
		return session.update("leave.updateReject", leaveId);
	}

	@Override
	public int deleteLeave(String leaveId) {
		return session.update("leave.deleteLeave", leaveId);
	}

	@Override
	public LeaveFile selectOneAttachment(int no) {
		return session.selectOne("leave.selectOneAttachment", no);
	}

}
