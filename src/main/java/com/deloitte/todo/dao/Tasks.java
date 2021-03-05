package com.deloitte.todo.dao;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Vinay J Yadave
 *
 */
@Entity
@Table(name="Tasks")
public class Tasks {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "userid")
	private int userid;
	private String taskDescription;
	
	@Column(name = "datetime")
	private Timestamp currTimeStamp;
	
	@Column(name = "completed")	
	private String flag;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userid;
	}
	public void setUserId(int userId) {
		this.userid = userId;
	}
	public String getTaskDescription() {
		return taskDescription;
	}
	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	public Timestamp getCurrTimeStamp() {
		return currTimeStamp;
	}
	public void setCurrTimeStamp(Timestamp currTimeStamp) {
		this.currTimeStamp = currTimeStamp;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	@Override
	public String toString() {
		return "Tasks [id=" + id + ", userid=" + userid + ", taskDescription=" + taskDescription + ", currTimeStamp="
				+ currTimeStamp + ", flag=" + flag + "]";
	}
}
