<div class="container">
	<div class="col-md-4">
		<form onsubmit="return Validate()" action = "${SITE_URL}/user/new/password" id = "confirmPasswordForm" method="POST" style = "border:1px solid black;padding:10px;border-radius:10px;">
			<div class="form-group">
				<label class="control-label" >New Password</label> 
				
				<input type="password" id="newPass" class="form-control" name = "password"/>
				<div id = "newPassword_error" class="error_message"></div>
			</div>
			
			<div class="form-group">
			<label class="control-label" >Confirm Password</label> 
			
			<input type="password" id="confirmPass" class="form-control" name = "confirmPassword"/>
			<div id = "confirmPassword_error" class="error_message"></div>
			</div>
			<a href = "${SITE_URL}/user/show/session" class="btn btn-primary fa fa-caret-left">
				Back</a>
			<button type="submit" name="submit" class="btn btn-danger fa fa-save">
				Save</button>
				
		</form>
	</div>
</div>

<script type="text/javascript">
	var confirmPasswordForm = document.getElementById("confirmPasswordForm");
	
	var newPassword_error = document.getElementById("newPassword_error");
	var confirmPassword_error = document.getElementById("confirmPassword_error");
	
	function Validate()
	{
		var newPassword = document.getElementById("newPass").value;
		var confirmPass = document.getElementById("confirmPass").value;
		if(newPassword != confirmPass)
			{
				newPassword_error.textContent = "* The passwords do not match";
				confirmPassword_error.textContent = "* The passwords do not match";
				return false;
				
			}
		else
			{
				if(newPassword.length < 6)
					{
						newPassword_error.textContent = "* Length must be greater than 8";
						
						return false;
					}
				else
					{
						
						return true;
					}	
				
			
			}
		
	}
	
	
</script>


