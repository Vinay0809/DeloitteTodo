<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!---basic page needs-->
      <meta charset="utf-8" />
      <title>TODO</title>
      <!-- mobile specific metas-->
      <meta
         name="viewport"
         content="width=device-width, initial-scale=1, maximum-scale=1"
         />
      <meta http-equiv="X-UA-Compatible" content="ie=edge" />
      <!--CSS-->
      <style><%@include file="/WEB-INF/views/style.css"%></style>
      <link
         rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
         />
      <link
         rel="stylesheet"
         href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
         integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
         crossorigin="anonymous"
         />
   </head>
   <body>
      <div class="container">
         <div class="container">
            <div class="global-container">
               <div class="card login-form">
                  <div class="card-body">
                     <h3 class="card-title text-center">Edit Task</h3>
                     <div class="card-text">
                        <form method="POST" action="/update/${userObj}">
                           <div class="form-group">
                              <label for="taskId" class="editTaskId">Task ID</label>
                              <input
                                 type="text"
                                 class="form-control form-control-sm editTaskId"
                                 id="editTaskId"
                                 name="taskId"
                                 value="${task.id}"
                                 readonly
                                 />
                           </div>
                           <div class="form-group">
                              <label for="taskDesc">Task Description</label>
                              <input
                                 type="text"
                                 class="form-control form-control-sm"
                                 id="taskDesc"
                                 name="taskDesc"
                                 value="${task.taskDescription}"
                                 />
                           </div>
                           <div class="form-group">
                              <label for="taskDesc">Last Updated</label>
                              <input
                                 type="text"
                                 class="form-control form-control-sm"
                                 id="currTimeStamp"
                                 name="currTimeStamp"
                                 value="${task.currTimeStamp}"
                                 readonly
                                 />
                           </div>
                           <div class="form-group">
                              <label for="taskDesc">Status</label>
                              <c:choose>
                                 <c:when test="${task.flag==true}">
                                    <input
                                       class="checkbox"
                                       type="checkbox"
                                       name="checkbox"
                                       checked
                                       />
                                    <br />
                                 </c:when>
                                 <c:otherwise>
                                    <input type="checkbox" name="checkbox" 
                                       />
                                    <br />
                                 </c:otherwise>
                              </c:choose>
                           </div>
                           <button
                              type="submit"
                              name="postAction"
                              value="submit"
                              class="btn btn-info btn-block"
                              >
                           Save
                           </button>
                           <a class="btn btn-primary btn-block delete mr-1 mb-1"
                           role="button "
                           href="
                           <c:url value="/viewtask/${userObj}/"/>
                           " >Back</a>
                          
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
      <script type="text/javascript">
         $(".checkbox").click(function() {
          	
               var checkBoxes = $(this).attr('checked');
               if (checkBoxes == null){
               	$(this).attr('checked',true);
                   } else{
                  	$(this).attr('checked',false);
                  	 }
           });
         $(".checkbox").click(function() {
          	
               var checkBoxes = $(this).attr('checked');
               if (checkBoxes == null){
               	$(this).attr('checked',true);
                   } else{
                  	$(this).attr('checked',false);
                  	 }
           });
      </script>
   </body>
</html>