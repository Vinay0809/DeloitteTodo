    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

 <head>
   <!---basic page needs-->
   <meta charset="utf-8" />
   <title>TODO</title>
   <!-- mobile specific metas-->
   <meta
     name="viewport"
     content="width=device-width, initial-scale=1, maximum-scale=1"
   />
 
 
 <style><%@include file="/WEB-INF/views/style.css"%></style>
 
   <!-- Latest compiled and minified CSS -->
   <link
     rel="stylesheet"
     href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
     integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
     crossorigin="anonymous"
   />
 
   <!--script-->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 </head>
 
 <body class="signupLogin">
   <div class="container">
     <div class="global-container">
       <div class="card login-form">
         <div class="card-body">
           <h3 class="card-title text-center">Login to My TODO List</h3>
           <div class="alert alert-warning text-center">${errorMessage}</div>
           <div class="card-text">
             <form method="POST" action="login">
               <div class="form-group">
                 <label for="InputUserName">User Name</label>
                 <input
                   type="text"
                   class="form-control form-control-sm"
                   id="InputUserName"
                   name="username"
                   aria-describedby="UserNameHelp"
                 />
               </div>
               <div class="form-group">
                 <label for="InputPassword">Password</label>
                 
                 <input
                   type="password"
                   class="form-control form-control-sm"
                   id="InputPassword"
                   name="password"
                 />
               </div>
               <button
                 type="submit"
                 name="postAction"
                 value="submit"
                 class="btn btn-info btn-block"
               >
                 Login
               </button>
              
             </form>
           </div>
         </div>
       </div>
     </div>
   </div>
 </body>
</html>
 


