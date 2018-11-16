
<div class="text-center">
<h1>Name : ${student.fname} ${student.lname}</h1>
<hr>
</div>
<div class="row">
	<div class="col-md-6">
	<h4>Parents: </h4>Father's Name: ${student.fatherName } 
<br>
Mother's Name : ${student.motherName }
<hr>
<h5>Contact :</h5>  Mobile: ${student.number}
<hr>
<h4>Address: 
</h4> Temporary: ${student.tempAddress }
<br>
Permanent: ${student.permAddress }

<hr>

<h4>Local guardian
</h4>
Name : ${student.localGuardian}
<br>
Mobile No: ${student.localNumber }
<br>
<br>
<a class = "btn btn-danger fa fa-caret-left"  href = "${SITE_URL}/admin/student/get?name=${student.stdClass.name}"> Back</a>
</div>
<div class="col-md-6">
	<h3>Total Present Days: ${student.totalPresentDay }</h3>
	<br>
	<h3>Total Absent Days:  ${student.totalAbsentDay}</h3>
</div>

	
</div>
