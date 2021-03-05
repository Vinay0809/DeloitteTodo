package com.deloitte.todo.utils;

/**
 * @author Vinay J Yadave
 *
 */
public class Utils {
	public static java.sql.Timestamp getCurrentTimeStamp() {

		java.util.Date today = new java.util.Date();
		return new java.sql.Timestamp(today.getTime());

	}

}
