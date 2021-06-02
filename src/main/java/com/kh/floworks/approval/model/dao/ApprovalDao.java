package com.kh.floworks.approval.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.floworks.approval.model.vo.Approval;
import com.kh.floworks.approval.model.vo.Approver;
import com.kh.floworks.approval.model.vo.ApvlDoc;
import com.kh.floworks.approval.model.vo.ApvlFile;

public interface ApprovalDao {

	List<Approval> selectApvlList(Map<String, Object> param, String workspaceId);

	int getTotalContents(String workspaceId);

	Approver selectApprover(String approverId);

	Approval selectOneApproval(String apvlId);

	List<Approver> selectApproverList(String workspaceId);

	String selectCategoryName(int categoryNo);

	int insertApproval(ApvlDoc apvlDoc);

	int insertAttachment(ApvlFile attach);

	Date selectDueDate(int year);

	Approval selectOneApprovalCollection(String apvlId);

	ApvlFile selectOneAttachment(int idx);

	int updateApvlStatus1(Approval approval);
	
	int updateApvlStatus2(Approval approval);
	
	int updateApvlStatus3(Approval approval);
	
	int updateApvlStatus4(Approval approval);

	int deleteApproval(String apvlId);

	int updateApproval(Approval approval);

}
