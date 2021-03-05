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
                     <section id="header" class="jumbotron text-left text-white">
                        <div class="container">
                           <h2 class="text-uppercase m-3">
                              Organise work and life
                              <a
                                 class="btn btn-primary btn-lg"
                                 href="/viewtask/${userObj}"
                                 role="button "
                                 >View tasks</a
                                 >
                           </h2>
                           <img
                              src="https://images.unsplash.com/photo-1518607692857-bff9babd9d40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1334&q=80"
                              class="img-fluid"
                              alt="Responsive image"
                              />
                        </div>
                     </section>
                  </div>
               </div>
            </div>
         </section>
      </div>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   </body>
</html>
