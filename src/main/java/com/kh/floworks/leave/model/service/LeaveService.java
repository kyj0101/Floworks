package com.kh.floworks.leave.model.service;

import java.util.List;
import java.util.Map;

import com.kh.floworks.leave.model.vo.Leave;
import com.kh.floworks.leave.model.vo.LeaveFile;
import com.kh.floworks.leave.model.vo.LeaveRequest;

public interface LeaveService {

	int insertLeaveReq(LeaveRequest lvReq);

	List<LeaveRequest> selectLeaveList(Map<String, Object> param, String workspaceId);

	int updateApprove(String leaveId);

	int updateMemberLeave(Leave lv);

	int updateReject(String leaveId);

	int deleteLeave(String leaveId);

	LeaveFile selectOneAttachment(int no);

}
