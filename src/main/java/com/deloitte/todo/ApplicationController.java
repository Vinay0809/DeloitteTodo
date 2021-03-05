package com.deloitte.todo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.deloitte.todo.dao.Tasks;
import com.deloitte.todo.dao.Users;
import com.deloitte.todo.services.ResourceService;

/**
 * @author Vinay J Yadave
 *
 */
@Controller
@SessionAttributes("userObj")
public class ApplicationController {

	private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);

	@Autowired
	private ResourceService resourceService;

	@ModelAttribute("Users")
	public Users user() {
		return new Users();
	}

	@RequestMapping("/")
	public String homePage() {

		return "login";
	}

	@RequestMapping("/new/{id}")
	public String addNewTask(Model model, @PathVariable(name = "id") String id) {
		logger.debug("------------Inside addNewTask()---------------");
		try {
			Tasks tasks = new Tasks();
			logger.debug("Inside :::" + id);
			model.addAttribute("task", tasks);
		} catch (Exception e) {
			throw new RuntimeException();
		}
		logger.debug("------------Exiting addNewTask()---------------");

		return "addtask";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(ModelMap model, @RequestParam String username, @RequestParam String password) {
		logger.debug("------------Inside login()---------------");
		try {
			int userID = resourceService.validateUsers(username, password);
			logger.debug("UserID is::" + userID);
			if (userID == 0) {
				model.put("errorMessage", "Invalid Credentials");
				return "login";
			} else {
				model.addAttribute("userObj", userID);
			}
		} catch (Exception ex) {
			throw new RuntimeException();
		}
		logger.debug("------------Exiting login()---------------");

		return "home";
	}

	@RequestMapping("/viewtask/{id}")
	public String viewTasks(ModelMap model, @PathVariable(name = "id") String id) {
		logger.debug("------------Inside viewTasks()---------------");
		logger.debug("user loggedin id:::" + id);

		try {
			List<Tasks> listtasks = resourceService.getTask(Integer.parseInt(id));
			logger.debug("Task size::" + listtasks.size());
			int userID = Integer.parseInt(id);
			model.put("userObj", userID);
			model.put("listtasks", listtasks);
			model.get("userObj");
		} catch (Exception e) {
			throw new RuntimeException();
		}
		logger.debug("------------Exiting viewTasks()---------------");

		return "viewtask";
	}

	@RequestMapping(value = "/save/{id}", method = RequestMethod.POST)
	public String addTask(ModelMap model, @ModelAttribute("task") Tasks task, @PathVariable(name = "id") String id) {
		logger.debug("------------Inside addTask()---------------");
		try {
			logger.debug("task description" + task.getTaskDescription());
			logger.debug("UsderID::" + Integer.parseInt(id));
			task.setUserId(Integer.parseInt(id));
			resourceService.addTask(task);
			model.put("userObj", Integer.parseInt(id));
		} catch (Exception e) {
			throw new RuntimeException();
		}
		logger.debug("------------Exiting addTask()---------------");

		return "home";
	}

	@RequestMapping("/edit/{taskid}/{userid}")
	public ModelAndView showEdittask(@PathVariable(name = "taskid") String taskid,
			@PathVariable(name = "userid") String userid) {
		logger.debug("------------Inside showEdittask()---------------");

		ModelAndView mav = new ModelAndView("edit");
		try {
			logger.debug("Tasks id::" + taskid);
			logger.debug("User id::" + userid);
			Tasks task = resourceService.gettask(Integer.parseInt(taskid));
			mav.addObject("userObj", Integer.parseInt(userid));
			mav.addObject("task", task);
		} catch (Exception e) {
			throw new RuntimeException();
		}
		logger.debug("------------Existing showEdittask()---------------");

		return mav;

	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public String updateTask(ModelMap model, @RequestParam String taskId, @RequestParam String taskDesc,
			@RequestParam(required = false) String checkbox, @PathVariable(name = "id") String id) {
		logger.debug("------------Inside updateTask()---------------");

		try {
			logger.debug("Inside update tasks:::::::::");
			logger.debug("Description id::" + taskDesc);
			logger.debug("Tasks id::" + taskId);
			logger.debug("Status id::" + checkbox);
			logger.debug("Users id::" + id);
			if (checkbox == null) {
				checkbox = "FALSE";
			} else {
				checkbox = "TRUE";
			}
			logger.debug("CheckBOX::" + checkbox);
			resourceService.updateTask(taskDesc, Integer.parseInt(taskId), checkbox);
			logger.debug("updated Task successfully::");
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("------------Exiting updateTask()---------------");

		return "home";
	}

	@RequestMapping("/delete/{id}")
	public String deleteProduct(@PathVariable(name = "id") String id) {
		logger.debug("------------inside deleteProduct()---------------");
		try {
			logger.debug("Delete id:::" + id);
			resourceService.delete(Integer.parseInt(id));
			logger.debug("Successfully deleted record for task Id:::" + id);
		} catch (Exception e) {
			throw new RuntimeException();
		}
		logger.debug("------------exiting deleteProduct()---------------");
		return "home";
	}

	@ExceptionHandler(value = RuntimeException.class)
	public String exceptionHandler() {
		return "Exception";
	}

}
