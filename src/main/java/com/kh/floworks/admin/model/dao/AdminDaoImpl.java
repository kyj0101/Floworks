package com.kh.floworks.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.floworks.admin.model.vo.AttendList;
import com.kh.floworks.admin.model.vo.UserDetail;
import com.kh.floworks.admin.model.vo.UserList;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<UserList> selectUserList(Map<String, Object> param, String workspace) {
		int cPage = (int)param.get("cPage");
		
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		log.info("workspace = {}", workspace);
		return session.selectList("admin.selecUserList", workspace, rowBounds);
	
	}

	@Override
	public int getTotalContents(String workspace) {
		return session.selectOne("admin.getTotalContents", workspace);
	}

	
	@Override
	public UserDetail selectOneUserDetail(String userId) {
		return session.selectOne("admin.selectOneUserDetail", userId);
	}
	
	
	//--강준혁 근태관리 리스트 쭉 뽑아오기
	@Override
	public List<AttendList> selectAttendList(Map<String, Object> param,String workspaceId) {
		int cPage = (int)param.get("cPage");
		
		int limit = (int)param.get("numPerPage");
		int offset = (cPage - 1) * limit; 
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		
		return session.selectList("admin.selectAttendanceList",workspaceId,rowBounds);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	

	

	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	

	//===================== 강유정 근태 설정 ========================
	
	@Override
	public int updateAttendanceSystem(Map<String, Object> param) {
		return session.update("admin.updateAttendanceSystem", param);
	}






	@Override
	public int updateLeaveSystem(Map<String, Object> param) {
		return session.update("admin.updateLeaveSystem", param);
	}

	@Override
	public int getTotalAttendContents(String workspaceId) {
		return session.selectOne("admin.getTotalAttendContents", workspaceId);
	}


}
