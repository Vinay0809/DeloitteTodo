package com.deloitte.todo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.sql.Timestamp;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.deloitte.todo.dao.Tasks;
import com.deloitte.todo.dao.Users;
import com.deloitte.todo.repository.TaskRepository;

/**
 * @author Vinay J Yadave
 *
 */
@RunWith(SpringRunner.class)
@DataJpaTest
public class TaskRepositoryTest {

	private Users users;
	private Tasks tasks;

	@Autowired
	private TaskRepository taskRepository;

	@Before
	public void setUp() {

		users = new Users();

		users.setId(1);
		users.setUsername("test");
		users.setPassword("pwd123");

		tasks = new Tasks();
	
		tasks.setTaskDescription("Task3");
		tasks.setCurrTimeStamp(new Timestamp(1234567));
		tasks.setFlag("yes");

	}

	@After
	public void tearDown() {
	}

	@Test
	public void whenFindAllByUserId_thenReturnTasks() {
		List<Tasks> ts = taskRepository.findAllByUserID(users.getId());
		assertEquals(ts.get(0).getTaskDescription(), "Task3");
	}

	@Test
	public void whenFindAllByNonExistUserId_thenReturnEmptyList() {
		List<Tasks> ts = taskRepository.findAllByUserID(10);
		assertTrue(ts.isEmpty());
	}

	@Test
	public void whenFindByInvalidUsername_thenReturnNoUser() {
		List<Tasks> ts = taskRepository.findAllByUserID(users.getId());
		assertNotEquals(ts.get(0).getTaskDescription(), "task1");

	}

}
