package com.kh.floworks.approval.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.floworks.approval.model.dao.ApprovalDao;
import com.kh.floworks.approval.model.vo.Approval;
import com.kh.floworks.approval.model.vo.Approver;
import com.kh.floworks.approval.model.vo.ApvlDoc;
import com.kh.floworks.approval.model.vo.ApvlFile;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDao apvlDao;
	
	@Override
	public List<Approval> selectApvlList(Map<String, Object> param, String workspaceId) {
		return apvlDao.selectApvlList(param, workspaceId);
	}

	@Override
	public int getTotalContents(String workspaceId) {
		return apvlDao.getTotalContents(workspaceId);
	}

	@Override
	public Approver selectApprover(String approverId) {
		return apvlDao.selectApprover(approverId);
	}

	@Override
	public Approval selectOneApproval(String apvlId) {
		return apvlDao.selectOneApproval(apvlId);
	}

	@Override
	public List<Approver> selectApproverList(String workspaceId) {
		return apvlDao.selectApproverList(workspaceId);
	}

	@Override
	public String selectCategoryName(int categoryNo) {
		return apvlDao.selectCategoryName(categoryNo);
	}

	@Override
	public int insertApproval(ApvlDoc apvlDoc) {
		int result = 0;
		result = apvlDao.insertApproval(apvlDoc);
		
		if (!apvlDoc.getAfList().isEmpty()) {
			for (ApvlFile attach : apvlDoc.getAfList()) {
				attach.setApprovalID(apvlDoc.getApvlId());
				result = apvlDao.insertAttachment(attach);
			}
		}
		
		return result;
	}

	@Override
	public Date selectDueDate(int year) {
		return apvlDao.selectDueDate(year);
	}

	@Override
	public Approval selectOneApprovalCollection(String apvlId) {
		return apvlDao.selectOneApprovalCollection(apvlId);
	}

	@Override
	public ApvlFile selectOneAttachment(int idx) {
		return apvlDao.selectOneAttachment(idx);
	}

	@Override
	public int updateApvlStatus1(Approval approval) {
		return apvlDao.updateApvlStatus1(approval);
	}
	
	@Override
	public int updateApvlStatus2(Approval approval) {
		return apvlDao.updateApvlStatus2(approval);
	}
	
	@Override
	public int updateApvlStatus3(Approval approval) {
		return apvlDao.updateApvlStatus3(approval);
	}
	
	@Override
	public int updateApvlStatus4(Approval approval) {
		return apvlDao.updateApvlStatus4(approval);
	}

	@Override
	public int deleteApproval(String apvlId) {
		return apvlDao.deleteApproval(apvlId);
	}

	@Override
	public int updateApproval(Approval approval) {
		return apvlDao.updateApproval(approval);
	}

}
