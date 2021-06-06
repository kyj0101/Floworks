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
import com.kh.floworks.admin.model.vo.Workspace;

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
	
	//--강준혁 근태관리 리스트 쭉 뽑아오기
	@Override
	public List<AttendList> selectAttendList(Map<String, Object> param, String workspaceId) {
		int cPage = (int) param.get("cPage");

		int limit = (int) param.get("numPerPage");
		int offset = (cPage - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("admin.selectAttendanceList", workspaceId, rowBounds);
	}

	@Override
	public List<String> selectAllMemberAttendanceYear(String workspaceId) {
		return session.selectList("admin.selectAllMemberAttendanceYear", workspaceId);
	}

	@Override
	public List<String> selectAllMemberAttendanceMonth(String workspaceId) {
		return session.selectList("admin.selectAllMemberAttendanceMonth", workspaceId);
	}

	@Override
	public List<Map<String, Object>> selectLeaveSystem(String workspaceId) {
		return session.selectList("admin.selectLeaveSystem", workspaceId);
	}

	@Override
	public Map<String, Object> selectOneAttend(Map<String, Object> param) {
		return session.selectOne("admin.selectOneAttend", param);
	}

	@Override
	public List<AttendList> selectSearchAttendList(Map<String, Object> param) {

		int cPage = (int) param.get("cPage");
		int limit = (int) param.get("numPerPage");
		int offset = (cPage - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return session.selectList("admin.selectSearchAttendList", param, rowBounds);
	}

	@Override
	public UserDetail selectOneUserDetail(String userId) {
		return session.selectOne("admin.selectOneUserDetail", userId);
	}
	

	//직원 정보수정
	@Override
	public int userUpdate(UserDetail userDetail) {
		return session.update("admin.userUpdate", userDetail)
				+ session.update("admin.memberUpdate", userDetail);
	}


	@Override
	public int updateWsPw(Workspace workspace) {
		return session.update("admin.updateWsPw", workspace);
	}

	@Override
	public Workspace selectOneWorkspace(Workspace workspace) {
		return session.selectOne("admin.selectOneWorkspace", workspace);
	}

	@Override
	public int memberUpdate(UserDetail userDetail) {
		return session.update("admin.memberUpdate", userDetail);
	}


	public int updateAttendanceSystem(Map<String, Object> param) {
		return session.update("admin.updateAttendanceSystem", param);
	}

	@Override
	public int updateLeaveSystem(Map<String, Object> param) {
		return session.update("admin.updateLeaveSystem", param);
	}
	
	@Override
	public int updateAttend(Map<String, Object> param) {
		return session.update("admin.updateAttend", param);
	}
	
	@Override
	public int getTotalContents(String workspace) {
		return session.selectOne("admin.getTotalContents", workspace);
	}

	@Override
	public int getTotalAttendContents(String workspaceId) {
		return session.selectOne("admin.getTotalAttendContents", workspaceId);
	}

	@Override
	public int getTotalSearchAttendContents(Map<String, Object> param) {
		return session.selectOne("admin.getTotalSearchAttendContents", param);
	}

}
