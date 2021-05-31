package com.kh.floworks.approval.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.approval.model.vo.Approval;
import com.kh.floworks.approval.model.vo.Approver;
import com.kh.floworks.approval.model.vo.ApvlDoc;
import com.kh.floworks.approval.model.vo.ApvlFile;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Approval> selectApvlList(Map<String, Object> param, String workspaceId) {
		/*
		 *  Map<String, Object> param = new HashMap<>();
		 *	param.put("numPerPage", numPerPage);
		 *  param.put("cPage", cPage);
		 */
		int cPage = (int)param.get("cPage");
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("approval.selectApvlList", workspaceId, rowBounds);
	}

	@Override
	public int getTotalContents(String workspaceId) {
		return session.selectOne("approval.getTotalContents", workspaceId);
	}

	@Override
	public Approver selectApprover(String approverId) {
		return session.selectOne("approval.selectApprover", approverId);
	}

	@Override
	public Approval selectOneApproval(String apvlId) {
		return session.selectOne("approval.selectOneApproval", apvlId);
	}

	@Override
	public List<Approver> selectApproverList(String workspaceId) {
		return session.selectList("approval.selectApproverList", workspaceId);
	}

	@Override
	public String selectCategoryName(int categoryNo) {
		return session.selectOne("approval.selectCategoryName", categoryNo);
	}

	@Override
	public int insertApproval(ApvlDoc apvlDoc) {
		return session.insert("approval.insertApproval", apvlDoc);
	}

	@Override
	public int insertAttachment(ApvlFile attach) {
		return session.insert("approval.insertAttachment", attach);
	}

	@Override
	public Date selectDueDate(int year) {
		return session.selectOne("approval.selectDueDate", year);
	}

}
