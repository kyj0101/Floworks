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
	
	private String position;
	private Date hireDate;
	private String reign;
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

}
