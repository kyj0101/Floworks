package com.kh.floworks.leave.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.leave.model.dao.LeaveDao;
import com.kh.floworks.leave.model.vo.Leave;
import com.kh.floworks.leave.model.vo.LeaveFile;
import com.kh.floworks.leave.model.vo.LeaveRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LeaveServiceImpl implements LeaveService {

	@Autowired
	private LeaveDao leaveDao;

	@Override
	public int insertLeaveReq(LeaveRequest lvReq) {
		int result = 0;
		result = leaveDao.insertLeaveReq(lvReq);
		log.info("lvReq.leaveId = {}", lvReq.getLeaveId());
		
		if (lvReq.getAttach() != null) {
			LeaveFile attachFile = lvReq.getAttach();
			attachFile.setLeaveId(lvReq.getLeaveId());
			result = leaveDao.insertAttachment(attachFile);
		}
		
		return result;
	}

	@Override
	public List<LeaveRequest> selectLeaveList(Map<String, Object> param, String workspaceId) {
		return leaveDao.selectLeaveList(param, workspaceId);
	}

	@Override
	public int updateApprove(String leaveId) {
		return leaveDao.updateApprove(leaveId);
	}

	@Override
	public int updateMemberLeave(Leave lv) {
		return leaveDao.updateMemberLeave(lv);
	}

	@Override
	public int updateReject(String leaveId) {
		return leaveDao.updateReject(leaveId);
	}

	@Override
	public int deleteLeave(String leaveId) {
		return leaveDao.deleteLeave(leaveId);
	}

	@Override
	public LeaveFile selectOneAttachment(int no) {
		return leaveDao.selectOneAttachment(no);
	}

}
