<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>

<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="CSS/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 71% 100%, 33% 93%, 0 100%, 0 0
		);
}
</style>
</head>
<body>
	<%@include file="normal_navbar.jsp"%>
	<main class="primary-background  banner-background"
		style="padding-bottom: 80px">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa-user-plus fa fa-2x"></span> <br> Register
						Here

					</div>
					<div class="card-body">
						<form id="reg-form" action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="user_name"
									aria-describedby="emailHelp" placeholder="Enter Name">

							</div>



							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>


							<div class="form-group">
								<label for="gender">Select Gender</label> <br> <input
									type="radio" id="gender" name="gender" value="male">
								Male <input type="radio" id="gender" name="gender"
									value="female"> Female
							</div>
							<div class="form-group">
								<textarea name="about" class="form-control" id="" rows="5"
									placeholder="Enter Something About Yourself"></textarea>
							</div>


							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Conditions</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-spinner fa-spin"></span>
								<h5>Please Wait....</h5>
							</div>

							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>


				</div>

			</div>

		</div>

	</main>




	<!-- javascripts -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded....")

			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				let form = new FormData(this);

				$("#submit-btn").hide();
				$("#loader").show();

				// send to register servlet

				$.ajax({
					url : "RegisterServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXBR) {
						console.log(data)
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim()==='Done')
						{
						 swal("Registered Successfully....We'll be Redirecting you to Login page.")
						.then((value) => {
						  window.location="login_page.jsp"
						});
						}else{
							
							swal(data);
						}
					},
					error : function(jqXBR, textStatus, errorThrown) {
						console.log(jqXBR)
						$("#submit-btn").show();
						$("#loader").hide();
						swal("Something Went Wromg Try Again.");
						
					},
					processData : false,
					contentType : false

				});
			});
		});
	</script>
</body>
</html>