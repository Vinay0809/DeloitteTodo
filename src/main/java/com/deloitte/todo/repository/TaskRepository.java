package com.deloitte.todo.repository;

import java.sql.Timestamp;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.deloitte.todo.dao.Tasks;

/**
 * @author Vinay J Yadave
 *
 */
public interface TaskRepository extends JpaRepository<Tasks, Integer>{

	@Query(value ="select * from tasks where userid=:userid", nativeQuery=true)
	List<Tasks> findAllByUserID( @Param("userid")int userid);
	
	 
	@Transactional
	@Modifying
	@Query(value = "INSERT INTO Tasks (task_description, datetime,completed,  userid) VALUES (:taskdesc, :CURRENT_TIMESTAMP ,:flag,:userID)", nativeQuery = true)
    void saveTask(@Param("taskdesc")String taskdesc, @Param("CURRENT_TIMESTAMP") Timestamp CURRENT_TIMESTAMP,@Param("flag")String flag, @Param("userID") int userID);
	
	@Transactional
	  @Modifying	  
	  @Query(value =("update Tasks t set t.task_description =:taskdesc ,t.completed=:status where t.id =:taskid"), nativeQuery = true) 
	  void updateTask(@Param("taskdesc")String  taskdesc, @Param("taskid") int taskid, @Param("status") String status);
}