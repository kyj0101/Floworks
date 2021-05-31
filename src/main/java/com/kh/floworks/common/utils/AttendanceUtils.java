package com.kh.floworks.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.kh.floworks.attendance.model.vo.Attendance;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AttendanceUtils {
	
	public static String getOfficeHoursToString(List<Attendance> weekAttendanceList, double lunchTime) {
		
		double officeHoursDouble = 0;
		
		for(Attendance attendance : weekAttendanceList) {
			
			if(attendance.getOfficeOff() == null) {
				continue;
			}
			
			officeHoursDouble += AttendanceUtils.getOfficeMinute(attendance);
		}
		
		officeHoursDouble -= lunchTime;

		int hours = ((int) (officeHoursDouble /1000/60/60));
		int minute = (int) ((officeHoursDouble /1000/60) % 60);
		
		return hours + "시간" + minute + "분";
	}
	
	public static double getOfficeMinute(Attendance attendance) {

		long out = attendance.getOfficeOff().getTime();
		long in  = attendance.getOfficeIn().getTime();
		
		double diff = out - in;
			
		return diff;

	}
	
	/**
	 * endStr - starStr
	 * @param startStr : 과거 
	 * @param endStr : 미래
	 * @return
	 */
	public static double getTimeDifference(String startStr, String endStr) {		
		
		try {
			
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
			Date startDate = timeFormat.parse(startStr);
			Date endDate = timeFormat.parse(endStr);
			
			long start = startDate.getTime();
			long end  = endDate.getTime();
			
			return end - start;
			
		} catch (ParseException e) {
			
			e.printStackTrace();
			
			return 0;
		}
		
	}
	

}
