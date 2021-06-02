package com.kh.floworks.approval.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kh.floworks.approval.model.vo.Approval;
import com.kh.floworks.approval.model.vo.Approver;
import com.kh.floworks.approval.model.vo.ApvlDoc;
import com.kh.floworks.approval.model.vo.ApvlFile;

public interface ApprovalService {

	List<Approval> selectApvlList(Map<String, Object> param, String workspaceId);

	int getTotalContents(String workspaceId);

	Approver selectApprover(String approverId);

	Approval selectOneApproval(String apvlId);

	List<Approver> selectApproverList(String workspaceId);

	String selectCategoryName(int categoryNo);

	int insertApproval(ApvlDoc apvlDoc);

	Date selectDueDate(int year);

	Approval selectOneApprovalCollection(String apvlId);

	ApvlFile selectOneAttachment(int idx);

}
