package com.deloitte.todo.services;

import java.sql.Timestamp;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.deloitte.todo.dao.Tasks;
import com.deloitte.todo.dao.Users;
import com.deloitte.todo.repository.TaskRepository;
import com.deloitte.todo.repository.UsersRepository;
import com.deloitte.todo.utils.Utils;

/**
 * @author Vinay J Yadave
 *
 */
@Service
public class ResourceService {
	private static final Logger logger = LoggerFactory.getLogger(ResourceService.class);

	@Autowired
	UsersRepository usersRepository;

	@Autowired
	TaskRepository taskRepository;

	public int validateUsers(String username, String pwd) {
		int userID = 0;
		List<Users> users = usersRepository.findByUserName(username, pwd);
		if (users != null && !users.isEmpty()) {
			userID = users.get(0).getId();
		}
		return userID;
	}

	public List<Tasks> getTask(int userId) {
		List<Tasks> tasks = taskRepository.findAllByUserID(userId);
		for (int i = 0; i < tasks.size(); i++) {
			logger.debug("Tasks:" + tasks.get(i));
		}
		logger.debug("GetTask.........");
		return tasks;
	}

	public void addTask(Tasks task) {
		task.setTaskDescription(task.getTaskDescription());
		task.setFlag(task.getFlag());

		logger.debug("Inside addTasks:::::" + task.getFlag());
		task.setUserId(task.getUserId());
		Timestamp currdate = Utils.getCurrentTimeStamp();
		taskRepository.saveTask(task.getTaskDescription(), currdate, task.getFlag(), task.getUserId());
		logger.debug("Inserted into Task table...");
	}

	public void removeTask(Tasks tasks) {
		taskRepository.delete(tasks);
	}

	public void delete(int id) {
		taskRepository.deleteById(id);
	}

	public Tasks gettask(int id) {
		return taskRepository.findById(id).get();
	}

	public void updateTask(String taskDesc, int taskId, String status) {
		taskRepository.updateTask(taskDesc, taskId, status);
	}
}
