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
      <style><%@include file="/WEB-INF/views/style.css"%></style>
   </head>
   <body>
      <div class="container">
         <nav class="navbar navbar-expand-lg navbar-light bg-info">
            <a class="navbar-brand" href="#" title="explore to know well about us">
               <h1 class="d-inline-block">
                  <span class="header_1stletter">My TODO List</span>
               </h1>
            </a
               >
            <button
               class="navbar-toggler"
               type="button"
               data-toggle="collapse"
               data-target="#navbarSupportedContent"
               aria-controls="navbarSupportedContent"
               aria-expanded="false"
               aria-label="Toggle navigation"
               >
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                     <a class="nav-link text-white" href="#">HOME </a>
                  </li>
               
                  <li class="nav-item">
                     <a class="nav-link text-white font-weight-bold"
                        href="<c:url value="/"/>" >LOGOUT</a>
                  </li>
               </ul>
            </div>
         </nav>
         <section>
            <div class="container">
               <div class="row">
                  <div class="col-md-12 text-center">
                     <h2 class="text-uppercase m-3">Task List</h2>
                     <a
                        class="btn btn-primary btn-lg mb-2"
                        href="/new/${userObj}"
                        role="button "
                        >Create New Task</a
                        >
                     <br />
                  </div>
                  <div class="table-responsive">
                     <table class="table table-bordered table-sm data">
                        <caption>
                           Hurray! End of my Todo list
                        </caption>
                        <thead class="thead-dark">
                           <tr>
                              <th>Task Description</th>
                              <th>Last Updated</th>
                              <th>Task Status</th>
                              <th>Actions</th>
                           </tr>
                        </thead>
                        <tbody class="tbody-light">
                           <c:forEach items="${listtasks}" var="user" varStatus="tagStatus">
                              <tr>
                                 <td class="data taskDesc">${user.taskDescription}</td>
                                 <td class="data date">${user.currTimeStamp}</td>
                                 <td class="data status">
                                    <c:choose>
                                       <c:when test="${user.flag==true}">
                                          <input
                                             type="checkbox"
                                             name="checkbox"
                                             checked="checked"
                                             readonly
                                             />
                                          <br />
                                       </c:when>
                                       <c:otherwise>
                                          <input type="checkbox" name="checkbox" readonly />
                                          <br />
                                       </c:otherwise>
                                    </c:choose>
                                 </td>
                                 <td>
                                    <a class="btn btn-info edit mr-1 mb-1" role="button "
                                    href="
                                    <c:url value="/edit/${user.id}/${userObj}/" />
                                    ">Edit</a
                                       >
                                    <a class="btn btn-danger delete mr-1 mb-1"
                                    role="button "
                                    href="
                                    <c:url value="/delete/${user.id}/"/>
                                    " >Delete</a>
                                 </td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </section>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   </body>
</html>