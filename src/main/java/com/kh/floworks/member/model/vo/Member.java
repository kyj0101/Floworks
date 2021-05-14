package com.kh.floworks.member.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



import lombok.Data;

@Data
public class Member extends User implements UserDetails{
	
	private String departmentCode;
	private String position;
	private Date hireDate;
	private String resign;
	private String department;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		List<SimpleGrantedAuthority> authList = new ArrayList<>();
		
		authList.add(new SimpleGrantedAuthority(super.getRole()));
		
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
		// TODO Auto-generated method stub
		return super.getAddress();
	}


	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return super.getEmail();
	}


	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return super.getId();
	}


	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return super.getPassword();
	}


	@Override
	public String getPhone() {
		// TODO Auto-generated method stub
		return super.getPhone();
	}


	@Override
	public String getQuitYn() {
		// TODO Auto-generated method stub
		return super.getQuitYn();
	}


	@Override
	public String getRole() {
		// TODO Auto-generated method stub
		return super.getRole();
	}


	@Override
	public String getWorkspaceId() {
		// TODO Auto-generated method stub
		return super.getWorkspaceId();
	}

}
