package com.kh.floworks.member.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.kh.floworks.alarm.model.vo.Alarm;

import lombok.Data;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@ToString
public class MemberWithAlarm extends User implements Serializable, UserDetails{

	private static final long serialVersionUID = 1L;
	
	private String departmentCode;
	private String position;
	private Date hireDate;	
	private String resign;
	private String department;
	private String profileFileOrinalname;
	private String profileFileRename;
	private List<Alarm> memberAlarm;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		List<SimpleGrantedAuthority> authList = new ArrayList<>();
		String userRole = super.getRole().trim();
	
		if(userRole.equals("ADMIN")) {
			authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));			
		}
		
		authList.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		return authList;
	}
	
	
	@Override
	public String getUsername() {
		return super.getId();
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	@Override
	public String getName() {
		return super.getName();
	}


	@Override
	public String getAddress() {
		return super.getAddress();
	}


	@Override
	public String getEmail() {
		return super.getEmail();
	}


	@Override
	public String getId() {
		return super.getId();
	}


	@Override
	public String getPassword() {
		return super.getPassword();
	}


	@Override
	public String getPhone() {
		return super.getPhone();
	}


	@Override
	public String getQuitYn() {
		return super.getQuitYn();
	}


	@Override
	public String getRole() {
		return super.getRole();
	}


	@Override
	public String getWorkspaceId() {
		return super.getWorkspaceId();
	}
	
	public void setMemberAlarm(List<Alarm> memberAlarm) {
		this.memberAlarm = memberAlarm; 
	}

	public List<Alarm> getMemberAlarm(){
		return this.memberAlarm;
	}
}
