package com.deloitte.todo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.deloitte.todo.dao.Users;
import com.deloitte.todo.repository.UsersRepository;

/**
 * @author Vinay J Yadave
 *
 */
@RunWith(SpringRunner.class)
@DataJpaTest
public class UsersRepositoryTest {

	private Users users;

	@Autowired
	private UsersRepository usersRepository;

	@Before
	public void setUp() {

		users = new Users();

		users.setId(1);
		users.setUsername("test");
		users.setPassword("pwd123");

	}

	@After
	public void tearDown() {
	}

	@Test
	public void whenFindByUsername_thenReturnuser() {
		List<Users> us = usersRepository.findByUserName(users.getUsername(), users.getPassword());
		assertEquals(us.get(0).getUsername(), "test");
	}

	@Test
	public void whenFindByInvalidUsername_thenReturnNoUser() {
		List<Users> us = usersRepository.findByUserName(users.getUsername(), users.getPassword());
		assertNotEquals(us.get(0).getUsername(), "test1");

	}
}