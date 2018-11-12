<div class="text-center">
<h2>Name : ${student.fname} ${student.lname}</h2>
<hr>
</div>

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
Name : ${student.localGuardian }
<br>
Mobile No: ${student.localNumber }
<br>
<br>
<a class = "btn btn-primary" href = "${SITE_URL}/admin/student/${student.classId}/get">Back</a>
