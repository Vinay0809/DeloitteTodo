<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<!--CSS-->
   <style><%@include file="/WEB-INF/views/style.css"%></style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous" />
</head>

<body>
	<div class="container">
		<div class="container">



			<div class="global-container">
				<div class="card login-form">
					<div class="card-body">
						<h3 class="card-title text-center">Add Task</h3>
						<div class="card-text">



							<form:form method="POST" action="/save/${userObj}"
								modelAttribute="task">
								<div class="form-group">
									<form:label for="taskDesc" path="taskDescription">Add Task Description</form:label>
									<form:input type="text" class="form-control form-control-sm"
										id="taskDesc" name="taskDesc" path="taskDescription"
										required="required" />
								</div>

								<div class="form-group">
									<form:label for="taskDesc" path="flag">Task Completed</form:label>
									<form:select name="flag" id="flag" path="flag">
										<option value="yes">Yes</option>
										<option value="no">No</option>
									</form:select>

								</div>
								<button type="submit" name="postAction" value="submit"
									class="btn btn-info btn-block">Add</button>
								<a class="btn btn-primary btn-block delete mr-1 mb-1"
									role="button "
									href="
                           <c:url value="/viewtask/${userObj}/"/>
                           ">Back</a>

							</form:form>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(".checkbox").click(function() {
			var checkBoxes = $(this).attr('checked');
			if (checkBoxes == null) {
				$('.checkbox').attr("checked", "checked");
			} else {
				$('.checkbox').removeAttr('checked');
			}
		});
	</script>
</body>
</html>



